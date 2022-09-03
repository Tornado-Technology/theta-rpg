/// @desc Searches for all files with a specified mask and attributes in the directory, 
/// and returns them as an array.
/// @param {String} mask - The mask use for searching.
/// @param {Constant.FileAttribute} attr - The specific file attribute to look for.
/// @return {Array<String>}
function file_finde_all(mask, attr) {
	var files = [];
	var file_name = file_find_first(mask, attr);
	
	while (file_name != "") {
		array_push(files, file_name);
		file_name = file_find_next();
	}
	
	file_find_close();
	return files;
}
