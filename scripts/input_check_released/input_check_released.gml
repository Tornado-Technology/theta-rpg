/// @param {Real} target
function input_check_released(target) {
	var input_key = input_find(target);
	return input_key.check_released();
}
