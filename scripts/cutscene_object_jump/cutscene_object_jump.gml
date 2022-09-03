/// @param {Id.Instance} obj
/// @param {Real} height
/// @param {Real} speed
function cutscene_object_jump(_obj, _height, _speed) {
	if (!instance_exists(_obj)) return undefined;
	
	object_jump_y = object_jump_y == undefined ?  _obj.y : object_jump_y;
	
	if (!object_jumped) {
		 _obj.y = approach(_obj.y, object_jump_y - _height, _speed);
		
		if (_obj.y == object_jump_y - _height) {
			object_jumped = true;
		}
		
		return false;
	}
	
	 _obj.y = approach(_obj.y, object_jump_y, _speed);
	 
	 if (_obj.y == object_jump_y) {
		object_jumped = false;
		object_jump_y = undefined;
		return true;
	}
	
	return false;
}
