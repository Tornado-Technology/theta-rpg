/// @func translate_lang_exists()
/// @param {real} lang_id
/// @desc Checks if the id is in valid values
function translate_lang_exists(_lang_id) {
	return (_lang_id > -1) && (_lang_id < translate_lang_count()); 
}

