/// @desc
var width = display_get_gui_width();
draw_set_halign(fa_right);
draw_text(width - 4, 4, "FPS: " + string(fps));
draw_text(width - 4, 14, "RFPS: " + string(fps_real));