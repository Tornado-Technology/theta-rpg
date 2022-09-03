function Data() {
	return new ClassData();
}

function ClassData() constructor {
	storage = undefined;
	
	name = "save.th";
	path = working_directory + name;
	
	/// @param {String} file
	static load = function(file = path) {
		var json = json_open(file);
		storage  = json;
	}
	
	/// @param {String} file
	static save = function(file = path) {
		var json = json_open(storage);
		storage  = json;
	}
	
	/// @param {String} key
	/// @param {Any} default_value
	static get = function(key, default_value = undefined) {
		
	}
	
	/// @param {String} key
	/// @param {Any} value
	static set = function(key, value) {
		
	}
	
	static all_reset = function() {
		
	}
}

global.__data = undefined;
#macro data global.__data
