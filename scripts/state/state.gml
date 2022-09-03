/// @param {string} name
/// @param {function} call
function State(_name, _call) {
	return new __ClassState(_name, _call)
}

/// @param {string} name
/// @param {function} call
function __ClassState(_name, _call) constructor {
	name = _name;
	call = _call;
	
	/// @param {any} args...
	static invoke = function() {
		var arguments = [];
		
		for (var i = 0; i < argument_count; i++) {
			array_push(arguments, argument[i]);
		}
		
		return call(arguments);
	}
	
	static get_name = function() {
		return name;
	}
}
