/// @desc Returns translation values from the current language
/// @param {String} key
/// @param {String} def
/// @return {Any}
function translate_get(key = "", def = "?????") {
	var json = global._translate_lang_json;
	
	if (json == undefined || json == -4) {
		logger.warn("Trasnlate language not laoded before reading, key: {0}. ", key);
		return def;
	}
	
	// Return a structure
	if (string_is_empty(key)) { 
		// You can use it, but I STRONGLY DON'T RECOMMEND
		// (Because of this method it is impossible to control the fidelity of the key)
		return json;
	}
	
	// Return a string value
	return struct_get_key_value(json, key, def, ".");
}

