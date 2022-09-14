/// @desc Resets all draw params to default
/// look at __draw_macros
function draw_reset() {
	draw_set_halign(default_haligin);
	draw_set_valign(default_valigin);
	draw_set_color(default_color);
	draw_set_alpha(default_alpha);
	draw_set_font(default_font);
}
