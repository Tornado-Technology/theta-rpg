/// @param {Struct} struct
/// @param {String} key
/// @param {Any} default_value
/// @param {String} delemiter
function struct_get_key_value(struct, key, default_value, delemiter = ".") {
	if (!is_struct(struct)) {
		logger.error("Can't get struct key value, reason: \"struct\" not the structure.");
		return;
	}
	
	if (string_is_empty(key)) {
		logger.warn("Not bladeless getting the value of the structure. Try to remove this.");
		return struct;
	}
	
	var paths = string_split(key, delemiter);
	var struct_finde = struct[$ paths[0]]
	
	for (var i = 1; i < array_length(paths); i++) {
		struct_finde = struct_finde[$ paths[i]];
	}
	
	if (struct_finde == undefined) {
		return default_value;
	}
	
	return struct_finde;
}
