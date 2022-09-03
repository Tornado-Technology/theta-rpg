/// @param {Id.Instance} inst
/// @param {Real} angle
/// @param {Real} spd
function cutscene_object_rotate_to(inst, angle, spd) {
	if (instance_exists(inst)) {
		inst.image_angle = approach(inst.image_angle, angle, spd);
		return inst.image_angle == angle;
	}

	return undefined;
}
