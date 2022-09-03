/// @func clone_item()
/// @param {Struct.ClassItem} item
/// @desc Сreates a clone of the item.
function clone_item(item) {
	var clone = Item("Item (clone)", "Item.");
	var variables = variable_struct_get_names(item);
	
	for (var i = 0; i < array_length(variables); i++) {
		var value = variable_struct_get(item, variables[i]);
		if (is_struct(value)) value = struct_clone(value);
		variable_struct_set(clone, variables[i], value);
	}
	
	return clone;
}
