/// @param {struct} item
/// @desc Checks if the structure is an instance of the Item class.
function is_item(item) {
	// Yes crutch, at the time of theta's creation there was no way to do otherwise
	return variable_struct_exists(item, "__system_type");
}
