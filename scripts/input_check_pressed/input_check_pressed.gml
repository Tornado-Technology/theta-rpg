/// @param {Real} target
function input_check_pressed(target) {
	var input_key = input_find(target);
	return input_key.check_pressed();
}
