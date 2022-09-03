/// @desc Returns structure from file (JSON).
/// @param {String} path
/// @param {Struct} def
/// @return {Any}
function json_open(path, def = {}) {
	var str = file_text_read_all_strings(path);
	
	try {
		return json_parse(str);
	} catch(error) {
		logger.error("Json open failed, reason: {0}  path: \"{1}\"", error.message, path);
		return def;
	}
}  

