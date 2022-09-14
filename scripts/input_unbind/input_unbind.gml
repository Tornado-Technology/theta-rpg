/// @param {Real} target
/// @param {Any} keys
function input_unbind(target, keys) {
	if (!is_array(keys)) {
		keys = [keys];
	}
	
	var input_key = input_find(target);
	if (input_key == undefined) {
		return;
	}
	
	for (var i = 0; i <	array_length(keys); i++) {
		var key = keys[i];
		if (is_string(key)) {
			key = ord(key);
		}
		
		input_key.remove_key(key);
	}
}
