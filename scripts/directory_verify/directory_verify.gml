/// @desc Checks if the directory exists, if it does not, it creates a new one
/// @param {String} path - The path to directory
function directory_verify(path) {
	if (directory_exists(path)) return path;
	directory_create(path);
	return path;
}
