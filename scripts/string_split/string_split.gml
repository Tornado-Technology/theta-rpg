/// @desc Simply divides the string into an array using a symbol.
/// @param {String} string
/// @param {String} delemiter
/// @return {Array<String>}
function string_split(str, del = ":") {
	var result = [];
	var position = string_pos(del, str);
	var position_old = 1;
	var delemiter_length = string_length(del);
	
	if (delemiter_length) {
		while (position) {
			array_push(result, string_copy(str, position_old, position - position_old));
			position_old = position + delemiter_length;
			position = string_pos_ext(del, str, position_old);
		}
	}
	
	array_push(result, string_delete(str, 1, position_old - 1));
	return result;
}
