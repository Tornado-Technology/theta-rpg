/// @param {Array<Any>} array
function array_get_random(array) {
	var index = irandom_range(0, array_length(array) - 1);
	return array[index];
}
