/// @param {Constant.Color} color The color to set
/// @param {real} alpha The alpha to set
function draw_set_blend(color = default_color, alpha = default_alpha) {
	draw_set_color(color);
	draw_set_alpha(alpha);
}
