/// @param {String} str
function string_real_height(str) {
	var result = 0;
	for (var i = 1; i < string_length(str); i++) {
		result += char_get_height(string_char_at(str, i));
	}
	return result;
}
