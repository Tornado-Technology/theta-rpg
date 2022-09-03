/// @param {Real} time_in - Time that the fade-in will take place (In frames)
/// @param {Real} time_out - Time that the scattering will take place (In frames)
/// @param {Constant.Color} color - Effect color
/// @param {Bool} target_gui - Is it drawn on the GUI
/// @param {Real} depth - Depth, use for sorting
/// @return {Id.Instance}
function effect_create_fade(time_in, time_out, color = c_black, target_gui = true, depth = -9999) {
	return instance_create_depth(0, 0, depth, obj_effect_fade, { 
		time_in: time_in,
		time_out: time_out,
		color: color,
		target_gui: target_gui
	});
}