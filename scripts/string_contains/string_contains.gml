/// @param {string} str The line in which the search takes place
/// @param {string} substr Search string
/// @param {real} start_pos Starting position for the search
/// @desc Returns whether the specified [substr] is contained in [str].
function string_contains(str, substr, start_pos = 1) {
	return string_pos_ext(substr, str, start_pos) > 0;
}
