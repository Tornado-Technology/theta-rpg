/// @func file_text_read_all_strings()
/// @param {string} path
/// @param {string} default
/// @desc Returns the entire contents of the file
function file_text_read_all_strings(_path, _default = "") {
	var buffer = buffer_load(_path);
	
	if (buffer == -1) {
		logger.warn("Buffer load failed, path: \"{0}\"", _path);
		buffer_delete(buffer);
		return _default;
	}
	
	if (buffer_get_size(buffer) == 0) {
		logger.warn("Buffer load warning file is empty, path: \"{0}\"", _path);
		buffer_delete(buffer);
		return "";
	}
	
	var result = buffer_read(buffer, buffer_string);
	buffer_delete(buffer);
	return result;
}

