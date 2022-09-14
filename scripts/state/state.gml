/// @param {String} name
/// @param {Function} callback
function State(name, callback) {
	return new StateClass(name, callback)
}

/// @param {String} name
/// @param {Function} callback
function StateClass(name, callback) constructor {
	self.name = name;
	self.callback = callback;
	
	/// @param {any} args...
	static invoke = function() {
		var arguments = [];
		
		for (var i = 0; i < argument_count; i++) {
			array_push(arguments, argument[i]);
		}
		
		return callback(arguments);
	}
	
	static get_name = function() {
		return name;
	}
}
