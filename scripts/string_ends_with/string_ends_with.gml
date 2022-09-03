/// @param {string} str The string to check
/// @param {string} end The string to look for
/// @desc Checks whether the specified string ends with the specified [end_with].
function string_ends_with(str, end_with) {
	var pos = string_pos(end_with, str);
	return pos > 0 && pos == (string_length(str) - string_length(end_with) + 1);
}