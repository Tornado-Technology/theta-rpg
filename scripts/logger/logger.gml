function Logger() {
	return new ClassLogger();
}

function ClassLogger() constructor {
	file = "log.txt";
	show_time = true;
	
	#region System
	/// @param {string} msg
	static __log__ = function(msg) {
		var directory = working_directory + self.file;
		var file = file_text_open_append(directory);
		file_text_write_string(file, msg + "\n");
		file_text_close(file);
	}
	
	static __base__ = function(msg, prefix, args) {
		var format = msg;
		for (var i = 0; i < array_length(args); i++) {
			format = string_replace_all(format, "{" + string(i) + "}", string(args[i]));
		}
		format =  (show_time ? "[" + date_datetime_string(date_current_datetime()) + "]"  : "") + prefix + " " + format;
		show_debug_message(format);
		__log__(format);
	}
	#endregion
	
	/// @param {string} msg
	/// @param {Any} args
	static info = function(msg) {
		// Some shit
		var args = []; for (var i = 1; i < argument_count; i++) array_push(args, string(argument[i]));
		__base__(msg, "[I]", args);
	}
	
	/// @param {string} msg
	/// @param {Any} args
	static warn = function(msg) {
		// Some shit
		var args = []; for (var i = 1; i < argument_count; i++) array_push(args, string(argument[i]));
		__base__(msg, "[W]", args);
	}
	
	/// @param {string} msg
	/// @param {Any} args
	static error = function(msg) {
		// Some shit
		var args = []; for (var i = 1; i < argument_count; i++) array_push(args, string(argument[i]));
		__base__(msg, "[E]", args);
	}
	
	static crash = function(msg) {
		var args = []; for (var i = 1; i < argument_count; i++) array_push(args, string(argument[i]));
		__base__(msg, "[F]", args);
		
		var format = msg;
		for (var i = 0; i < array_length(args); i++) {
			format = string_replace_all(format, "{" + string(i) + "}", string(args[i]));
		}
		
		throw (format);
	}
	
	/// @param {string} msg
	/// @param {Any} args
	/// @desc Works only in [DEBUG_MODE]
	static debug = function(msg) {
		if (!DEBUG_MODE) return;
		// Some shit
		var args = []; for (var i = 1; i < argument_count; i++) array_push(args, string(argument[i]));
		__base__(msg, "[D]", args);
	}
	

	/// @desc Clears the log files.
	static clear = function() {
		file_delete(working_directory + file);
	}
}

global.__logger = Logger();

#macro logger global.__logger