/// @param {real} position_x Force by x to be limited to values from -1 to 1 
/// @param {real} position_y Force by y to be limited to values from -1 to 1 
/// @param {bool} in_radians If set true it will return values in radians,otherwise in degrees
function position_to_angle(position_x, position_y, in_radians = false) {
	return (in_radians) ? arctan2(position_y, position_x) : darctan2(position_y, position_x);
}
