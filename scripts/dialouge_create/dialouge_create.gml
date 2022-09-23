/// @param {Any} index
function dialouge_create(index) {
	var texts = index;
	if (!is_array(index)) {
		texts = translate_get(index);
	}

	instance_create_depth(0, 0, 0, obj_dialouge, {
		texts: texts
	});
}
