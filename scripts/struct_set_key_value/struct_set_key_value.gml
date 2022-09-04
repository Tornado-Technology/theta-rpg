/// @param {Struct} struct
/// @param {String} key
/// @param {Any} value
/// @param {String} delemiter
function struct_set_key_value(struct, key, value, delemiter = ".") {
	if (!is_struct(struct)) {
		logger.error("Can't set struct key value, reason: \"struct\" not the structure.");
		return;
	}
	
	if (string_is_empty(key)) {
		logger.warn("Not bladeless setting the value of the structure. Try to remove this.");
		return struct;
	}
	
	var paths = string_split(key, delemiter);
	var struct_finde = struct[$ paths[0]]
	
	for (var i = 1; i < array_length(paths) - 1; i++) {
		struct_finde = struct_finde[$ paths[i]];
	}
	
	struct_finde[$ paths[array_length(paths) - 1]] = value;
}
