/// @desc Properties
sprite_index = spr_empty;

// Time (In frames)
if (!variable_instance_exists(id, "time_in")) time_in = 60;
if (!variable_instance_exists(id, "time_out")) time_out = 60;

// Render
if (!variable_instance_exists(id, "alpha")) alpha = 0;
if (!variable_instance_exists(id, "color")) color = c_black;

// Doesn't work with HTML(Will always draw only in Draw)
if (!variable_instance_exists(id, "color")) target_gui = !is_html;

if (target_gui == true && is_html) target_gui = false;

// Don't touch yourself if you don't know what you're doing
time_to_in = true
amount_in = 1 / time_in;
amount_out = 1 / time_out;
width = target_gui ? display_get_gui_width() : room_width;
height = target_gui ? display_get_gui_height() : room_height;

// Main render method
render = function() {
	draw_set_alpha(alpha);
	draw_set_color(color);
	draw_rectangle(0, 0, width, height, false);
	draw_set_blend(); // Used to reset the color and transparency to the default
};
