/// @desc Checks if the file exists, if it does not, it creates a new one
/// @param {String} path - The path to file
function file_verify(path) {
	if (file_exists(path)) return path;
	file_text_close(file_text_open_write(path));
	return path;
}
