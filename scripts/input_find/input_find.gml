/// @param {Real} target
/// @return {Struct.InputKeyClass}
function input_find(target) {
	if (!variable_global_exists("__inputs")) {
		global.__inputs = [];
	}
	
	var args = [target];
	return array_find(global.__inputs, function(e, i, args) { 
		return e.target == args[0];
	}, args);
}
