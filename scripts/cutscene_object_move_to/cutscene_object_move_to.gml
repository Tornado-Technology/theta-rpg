/// @param {Id.Instance} obj
/// @param {Real} x
/// @param {Real} y
/// @param {Real} speed
function cutscene_object_move_to(_obj, _x, _y, _speed) {
	if (instance_exists(_obj)) {
		var obj_x = _obj.x;
		var obj_y = _obj.y;
		_obj.x = approach(_obj.x, _x, _speed);
		_obj.y = approach(_obj.y, _y, _speed);
		return (obj_x == _x) && (obj_y == _y)
	}

	return undefined;
}