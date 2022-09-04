function Data() {
	return new ClassData();
}

function ClassData() constructor {
	storage = undefined;
	
	name = "save.th";
	path = working_directory + name;
	
	static load = function() {
		storage = json_open(path);
	}
	
	static save = function() {
		if (file_exists(path)) {
			file_delete(path);
		}
		
		var file = file_text_open_write(path);
		var content = json_stringify(storage);
		file_text_write_string(file, content);
		file_text_close(file);
	}
	
	/// @param {String} key
	/// @param {Any} default_value
	/// @param {String} delemiter
	static get = function(key, default_value = undefined, delemiter = ".") {
		return struct_get_key_value(storage, key, default_value, delemiter);
	}
	
	/// @param {String} key
	/// @param {Any} value
	/// @param {String} delemiter
	static set = function(key, value, delemiter = ".") {
		struct_set_key_value(storage, key, value, delemiter);
	}
	
	static all_reset = function() {
		
	}
}

global.__data = Data();
#macro data global.__data
