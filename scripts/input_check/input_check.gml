/// @param {Real} target
function input_check(target) {
	var input_key = input_find(target);
	return input_key.check();
}
