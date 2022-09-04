function UIText(text, options = {}) {
	return new UITextClass(text, options);
}

function UITextClass(text, options) constructor {
	self.text = text;
	display_text = text;
	use_tags = true;
	
	// Draw
	color = c_white;
	alpha = 1;
	font = font_arial;
	
	haligin = fa_left;
	valigin = fa_top;
	
	commands = [];

	char_offset_x = 2;
	char_offset_y = 0;
	
	// Draw sycle
	char_index = 0;

	// Typewriter
	time_char = 2;
	typewriter_speed = 2;
	
	voice = undefined;
	typewriter_voice_speed = 2;
	
	is_end = false;
	
	static set_text = function(text) {
		self.text = text;
		parse();
	}
	
	/// @desc Turns a string with a set of commands(tags) into a normal string and applies the commands(tags) when rendering.
	static parse = function() {
		if (!use_tags) {
			logger.info("Parsing stopped, reason: \"use_tags\" was turned off.");
			return;
		}
		
		//is_end = false;
		//char_index = 0;
		//commands = [];
		
		var new_text = text;
		var commands_count = string_count(UILIB_CHAR_TAG_CLOUSE, text);
		repeat (commands_count) {
	
			var cmd_index = parse_get_index(new_text);
			var cmd = string_copy(new_text, cmd_index.starting + 1, cmd_index.difference - 1);

			command_add(cmd, cmd_index.starting);
			new_text = string_delete(new_text, cmd_index.starting, cmd_index.difference + 1);
		}

		// We throw a line without commands
		display_text = new_text;
	}
	
	/// @desc Returns an object in which some indexes are specified for convenience.
	/// @param {String} str
	static parse_get_index = function(str) {
		var index = {
			starting: 0,
			ending: 0,
			difference: 0
		};
 
		index.starting = string_pos(UILIB_CHAR_TAG_OPEN, str);
		index.ending = string_pos_ext(UILIB_CHAR_TAG_CLOUSE, str, index.starting);
		index.difference = index.ending - index.starting;
	
		return index;
	}

	/// @param {String} command
	/// @param {Real} index
	static command_add = function(command, index) {
		var content = command;
		
		if (UILIB_IGNORE_CASE) {
			content = string_lower(content);
		}
		
		if (UILIB_IGNORE_SPACES) {
			content = string_replace_all(content, " ", "")
		}
		
		// Command struct
		var command_data = { 
			content: content, 
			index: index,
			used: false
		};
	
		// Pushing command to alls
		array_push(commands, command_data);
	}
	
	/// @param {Struct} command_data
	static command_invoke = function(command_data) {
		var command_array = string_split(command_data.content, UILIB_CHAR_TAG_COMMNAD_DELEMITER);
		var command_name = command_array[0];
		
		// Get arguments if we have it
		var command_arguments = [];
		if (array_length(command_array) > 1) {
			command_arguments = string_split(command_array[1], UILIB_CHAR_TAG_ARGUMENT_DELEMITER);
		}
		
		var command = command_find(command_name);
		if (command == undefined) return;
		if (command.single_use && command_data.used) return;
		command_data.used = true;
		command.invoke(self, command_data.index, command_arguments);
	}
	
	/// @param {String} name
	/// @return {Struct.ClassTag}
	static command_find = function(name) {
		name = string_lower(string(name));
		
		var tags = global.__tags;
	
		// Finde command
		for (var i = 0; i < array_length(tags); i++) {
			var tag = tags[i];
		
			// Check all names
			if (tag.has_name(name)) {
				return tag;
			}
		}
	
		logger.warn("Tag: \"" + name + "\" not found");
		return undefined;
	}
	
	static draw = function(xpos, ypos) {
		update();
		
		var char_buffer_width = 0;
		
		// Main draw cycle
		for (var i = 1; i < char_index; i++) {
			var char = string_char_at(display_text, i);
	
			for (var j = 0; j < array_length(commands); j++) {
				var command = commands[j];
				if (command.index == i) {
					command_invoke(command);
				}
			}
	
			// Set draw modes
			draw_set_blend(color, alpha)
			draw_set_font(font);
	
			draw_text(xpos + char_buffer_width, ypos, char);
			char_buffer_width += char_get_width(char);
		}
		
		draw_reset();
	}
	
	static update = function() {
		time_char = approach(time_char, 0, 1);
		if (time_char == 0) {
			time_char = typewriter_speed;
	
			if (char_index <= string_length(display_text)) {
				char_index++;
			} else {
				is_end = true;
			}
		}
	}
	
	static blend = function(color, alpha) {
		self.color = color;
		self.alpha = alpha;
	}
}
