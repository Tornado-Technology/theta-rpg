/// @desc Checks whether the specified string starts with the specified start_with.
/// @param {string} str	The string to check
/// @param {string} start_with	The string to look for
/// @returns {bool}	true, if str starts with start_with, otherwise false
function string_starts_with(str, start_with) {
	return string_pos(start_with, str) == 1;
}
