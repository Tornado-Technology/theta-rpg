/// @param {Id.Instance} obj
/// @param {String} name
/// @param {Any} val
function cutscene_object_set_variable(_obj, _key, _value) {
	if (instance_exists(_obj)) {
		variable_instance_set(_obj, _key, _value);
		return true;
	}
	
	return undefined;
}
