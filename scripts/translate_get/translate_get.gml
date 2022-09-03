/// @desc Returns translation values from the current language
/// @param {String} key
/// @param {String} def
/// @return {Any}
function translate_get(key = "", def = "?????") {
	var json = global._translate_lang_json;
	
	if (json == undefined || json == -4) {
		logger.warn("Trasnlate language not laoded before reading, key: {0} ", key);
		return def;
	}
	
	// Return a structure
	if (string_is_empty(key)) { 
		// You can use it, but I STRONGLY DON'T RECOMMEND
		// (Because of this method it is impossible to control the fidelity of the key)
		return json;
	}
	
	// Return a string value
	var keys = string_split(key, ".");
	var path = json[$ keys[0]];
	var new_path = -1;
	
	try {
		for (var i = 1; i < array_length(keys); i++) {
			new_path = path[$ keys[i]];
			path = new_path;
		}
	} catch(_error) {
		return def;
	}
	
	return path == undefined ? def : path;
}

