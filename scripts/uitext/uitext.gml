function UIText(text, options = {}) {
	var ui = new UITextClass(text);
	return ui;
}

function UITextClass(text) constructor {
	self.text = text;
	display_text = text;
	use_tags = true;
	
	// Draw
	color = default_color;
	alpha = default_alpha;
	font = default_font;
	
	haligin = default_haligin;
	valigin = default_valigin;
	
	// Transform
	angle = 0;
	scale_x = 1;
	scale_y = 1;
	
	commands = [];

	char_offset_x = 1;
	char_offset_y = 3;
	
	// Draw sycle
	char_index = 0;

	// Typewriter
	time_char = 2;
	typewriter_speed = 2;
	
	voice = undefined;
	typewriter_voice_speed = 2;
	
	is_end = false;
	
	// Box
	wrapbox_enable = false;
	wrapbox_x = 0;
	wrapbox_y = 0;
	wrapbox_width = 0;
	wrapbox_height = 0;
	
	/// @desc A new text is set and calls the method parse().
	/// @param {String} text - The new text for work
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

		is_end = false;
		char_index = 0;
		commands = [];

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

	/// @desc Searches for a tag in a string and returns its content.
	/// @param {String} str - The tagging string for search
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

	/// @desc Adds information about the tag for further work in the draw() method.
	/// @param {String} tag - The all tag content
	/// @param {Real} index - The tag index in text
	static command_add = function(tag, index) {
		var content = tag;

		if (UILIB_IGNORE_CASE) {
			content = string_lower(content);
		}

		if (UILIB_IGNORE_SPACES) {
			content = string_replace_all(content, " ", "")
		}

		// Tag struct
		var tag_data = { 
			content: content, 
			index: index,
			used: false
		};

		// Pushing tag to alls
		array_push(commands, tag_data);
	}

	/// @desc Gets information about the team, looks for it in the list and calls.
	/// @param {Struct} command_data - Information about the parsed tag
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

	/// @param {String} name - One name from the list of tags
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

	/// @desc Draws text at a specific position on the screen.
	/// @param {Real} x
	/// @param {Real} y
	static draw = function(xpos, ypos) {
		update();

		var char_buffer_width = 0;
		var char_buffer_height = 0;
		var char_buffer_scale_x = 0;
		var char_buffer_scale_y = 0;

		// TODO: Remake this with aligins
		if (haligin == fa_center) {
			xpos -= (string_real_width(display_text) * scale_x + (string_length(display_text) * char_offset_x)) / 2;
		}
		
		ypos -= char_get_width("W") * scale_y / 2;

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

			var char_width = char_get_width(char);

			
			if (wrapbox_enable && char_buffer_width > wrapbox_width - wrapbox_x) {
				char_buffer_width = 0;
				char_buffer_height += char_get_height("P") + char_offset_y;
			}

			var text_x = xpos + char_buffer_width;
			var text_y = ypos + char_buffer_height;
			
			draw_text_transformed(text_x, text_y, char, scale_x, scale_y, angle);

			char_buffer_width += char_width * scale_x + char_offset_x;
		}

		draw_reset();
	}

	/// @desc Updates the state of the text and more, and is automatically called by the draw() method.
	static update = function() {
		if (is_end) {
			return;
		}

		if (typewriter_speed == undefined || typewriter_speed == -1) {
			char_index = string_length(display_text) + 1;
			is_end = true;
			return;
		}

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

	/// @param {Real} scale_x
	/// @param {Real} scale_y
	/// @param {Real} sangle
	static transform = function(scale_x, scale_y, angle = self.angle) {
		self.scale_x = scale_x;
		self.scale_y = scale_y;
		self.angle = angle;
		return self;
	}

	/// @param {Constant.HAligin} haligin
	/// @param {Constant.VAligin} valigin
	static aligin = function(haligin, valigin) {
		self.haligin = haligin;
		self.valigin = valigin;
		return self;
	}

	/// @param {Constant.Color} color
	/// @param {Real} alpha
	static blend = function(color = c_white, alpha = 1) {
		self.color = color;
		self.alpha = alpha;
		return self;
	}
	
	/// @param {Real} x
	/// @param {Real} y
	/// @param {Real} width
	/// @param {Real} height
	static set_wrapbox = function(x, y, width, height) {
		wrapbox_enable = true;
		wrapbox_x = x;
		wrapbox_y = y;
		wrapbox_width = width;
		wrapbox_height = height;
		return self;
	}
}
