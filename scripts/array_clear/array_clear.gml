/// @desc Clear all values on array
/// (Works only if "Copy On Write Behaviour for Arrays" turn on).
/// @param {Array<Any>} array - The array which we want to clear
function array_clear(array) {
	array_delete(array, 0, array_length(array) + 1);
}
