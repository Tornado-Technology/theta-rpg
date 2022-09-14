/// @desc Checks for at least one element in an array.
/// @param {Array<Any>} array - The array which we want to check
/// @param {Any} element - The element with which we will check the array
/// @return {Bool} Check result
function array_has(array, element) {
	return array_indexof(array, element) != -1;
}
