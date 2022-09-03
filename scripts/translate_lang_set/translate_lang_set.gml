/// @param {Real} lang_id - Unique language number obtained depending on its order in global._translate_langs. You can use enum lang
function translate_lang_set(_lang_id) {
	if (!translate_lang_exists(_lang_id)) { 
		logger.error("Translate error, \"lang_id\" not exists, id: {0}.", _lang_id);
		return;
	}
	
	var root = string(global._translate_langs[_lang_id]);
	var path = TRANSLATE_DIRECTORY + root + "/";
	var json = json_open(path + TRANSLATE_LANG_MAIN);
	var info = json_open(path + TRANSLATE_LANG_INFO);

	// Set globals...
	global._translate_lang_id = _lang_id;
	global._translate_lang_json = json;
	global._translate_lang_info = info;
	
	var sprites = file_finde_all(path + TRANSLATE_LANG_SPRITES + "*.png", fa_readonly);
	for (var i = 0; i < array_length(sprites); i++) {
		logger.debug("New sprite for load: {0}.", sprites[i]);
	}

	logger.info("Translate set new language: {0}.", _lang_id);
	on_translate_update.invoke();
}
