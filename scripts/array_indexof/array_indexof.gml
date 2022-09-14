/// @desc Find the element index in the array, if not found return -1.
/// @param {Array<Any>} array - The array which we want to check
/// @param {Any} element - The element whose index we want to find
/// @return {Real} element index or -1
function array_indexof(array, element) {
	for (var i = 0; i < array_length(array); i++) {
		var value = array[i];
		if (value == element) {
			return i;
		}
	}
	
	return -1;
}
