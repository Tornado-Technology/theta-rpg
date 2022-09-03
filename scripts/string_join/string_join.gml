/// @param {Array<Any>} array
/// @param {String} delemiter
function string_join(array, delemiter) {
	var result = "";
	var length = array_length(array);
	for (var i = 0; i < length; i++) {
		result += string(array[i]);
		
		if (i != length - 1) {
			result += delemiter;
		}
	}
	return result;
}
