/// @desc Сreates a clone of the struct.
/// DON'T WORK WITH CLASSES (use special class methods to clone).
/// @param {Struct} struct - Struct for need a clone
/// @return {Struct}
function  struct_clone(struct) {
	var clone = {};
	var variables = variable_struct_get_names(struct);
	
	for (var i = 0; i < array_length(variables); i++) {
		var value = struct[$ variables[i]];
		if (is_struct(value)) value = struct_clone(value); // Recoursing
		clone[$ variables[i]] = value;
	}
	
	return clone;
}
