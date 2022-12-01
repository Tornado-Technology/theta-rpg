function MenuSlider(key_translate, start_value, callback = function() {}) {
	var instance = new ClassMenuSlider(key_translate, start_value, callback);
	instance.translate_update();
	
	return instance;
}

function ClassMenuSlider(key_translate, start_value, callback) : ClassMenuElement(key_translate) constructor {
	self.callback = callback;
	value = start_value;
	is_shift = false;
	slider_time = 0;
	previous_mouse_position_x = -1;
	last_mouse_hold = false;
	static base_update = update;
	static base_draw = draw;
	static offset_from_main_text = 64;
	static length = 64;
	static radius = 4;
	static line_width = 2
	static char_height = char_get_height("W");
	static slider_delay = 20;
	static mouse_slider = { value: undefined };
	
	static update = function(position_x, position_y, menu_instance) {
		base_update(position_x, position_y, menu_instance);
		
		var new_position_x = position_x + menu_instance.page_width + offset_from_main_text;
		var new_position_y = position_y + char_height / 2;
		var circle_x = new_position_x + (length * value);
		
		var mouse_hover_circle = point_in_circle(mouse_gui_x, mouse_gui_y, circle_x, new_position_y, radius);
		var mouse_hover_line = point_in_rectangle(mouse_gui_x, mouse_gui_y, new_position_x, new_position_y, new_position_x + length, new_position_y + line_width);
		
		if (mouse_hover_circle || mouse_hover_line) {
			if (menu_instance.input_wheel != 0) {
				change_value(value + menu_instance.input_wheel / 100);
			}
		}
		
		if ((mouse_hover_circle || last_mouse_hold) && (mouse_slider.value == undefined || mouse_slider.value == self)) {
			if (mouse_check_button(mb_left)) {
				last_mouse_hold = true;
				var new_value = (mouse_gui_x - new_position_x) / length;
				mouse_slider.value = self;
				
				if (new_value != value) {
					change_value(new_value);
				}
			} else {
				last_mouse_hold = false;
				mouse_slider.value = undefined;
			}
		}
		
		if (!hover) return;
		
		if (menu_instance.held_h == 0) {
			slider_time = 0;
			return;
		}
		
		slider_time = approach(slider_time, slider_delay, 1);
		
		change_value(value + (slider_time == slider_delay ? 0.01 : 0.002) * menu_instance.held_h);
	}
	
	static draw = function(position_x, position_y, menu_instance) {
		base_draw(position_x, position_y, menu_instance);
		
		var new_position_x = position_x + menu_instance.page_width + offset_from_main_text;
		var new_position_y = position_y + char_height / 2;
		
		draw_reset();
		draw_set_font(font_determination);
		
		var circle_x = new_position_x + (length * value);
			
		draw_set_color(c_black);
		draw_line_width(new_position_x - 1, new_position_y, new_position_x + length + 1, new_position_y, line_width + 2);
		draw_set_color(c_white);
		draw_line_width(new_position_x, new_position_y, new_position_x + length, new_position_y, line_width);
		draw_set_color(c_black);
		draw_circle(circle_x, new_position_y, radius, false);
		draw_set_color(c_white);
		draw_circle(circle_x, new_position_y, radius - 1, false);
		draw_text_outlined(new_position_x + (length * 1.2), new_position_y - 7, text_color, text_color_outline, string(floor(value * 100)) + "%");
		
		draw_reset();
	}
	
	static change_switcher_status = function(value) {
		audio_play_sound_plugging(snd_selection);
		
		switcher_status = value;
		callback(value);
	}
	
	static change_value = function(new_value) {
		if (new_value > 1 || new_value < 0) {
			value = clamp(new_value, 0, 1);
			callback(value);
			return;
		}
		
		audio_play_sound(snd_tick, 1, false);
		
		value = new_value;
		value = clamp(value, 0, 1);
		callback(value);
	}
}