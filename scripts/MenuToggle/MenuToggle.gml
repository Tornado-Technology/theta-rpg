function MenuToggle(key_translate, switcher_status = false, callback = function() {}) {
	var instance = new ClassMenuToggle(key_translate, switcher_status, callback);
	instance.translate_update();
	
	return instance;
}

function ClassMenuToggle(key_translate, switcher_status, callback) : ClassMenuElement(key_translate) constructor {
	self.switcher_status = switcher_status;
	self.callback = callback;
	is_shift = false;
	static base_update = update;
	static base_draw = draw;
	static offset_from_main_text = 64;
	static offset_between_text = 32;
	static text_enable = "On";
	static text_disable = "Off";
	static char_height = char_get_height("W");
	static text_enable_width = string_real_width(text_enable, font_determination);
	static text_disable_width = string_real_width(text_disable, font_determination);
	static text_color_enabled = c_white;
	static text_color_disabled = c_dkgray;
	
	
	static update = function(position_x, position_y, menu_instance) {
		base_update(position_x, position_y, menu_instance);
		
		var new_position_x = position_x + menu_instance.page_width + offset_from_main_text;
		
		var text_enable_mouse_hover = point_in_rectangle(mouse_gui_x, mouse_gui_y, new_position_x, position_y, new_position_x + text_enable_width, position_y + char_height);
		var text_disable_mouse_hover = point_in_rectangle(mouse_gui_x, mouse_gui_y, new_position_x + offset_between_text, position_y, new_position_x + offset_between_text + text_disable_width, position_y + char_height);
		
		if (text_enable_mouse_hover) {
			if (mouse_check_button_pressed(mb_left) && !switcher_status) {
				change_switcher_status(true);
			}
		}
		
		if (text_disable_mouse_hover) {
			if (mouse_check_button_pressed(mb_left) && switcher_status) {
				change_switcher_status(false);
			}
		}
		
		if (!hover) return;
		if (menu_instance.input_h == 0) return;
		
		change_switcher_status(!switcher_status);
	}
	
	static draw = function(position_x, position_y, menu_instance) {
		base_draw(position_x, position_y, menu_instance);
		
		var new_position_x = position_x + menu_instance.page_width + offset_from_main_text;
		
		draw_reset();
		draw_set_font(font_determination);
		
		draw_text_outlined(new_position_x, position_y, merge_color(text_color_enabled, text_color_disabled,  !switcher_status), text_color_outline, text_enable);
		draw_text_outlined(new_position_x + offset_between_text, position_y, merge_color(text_color_enabled, text_color_disabled,  switcher_status), text_color_outline, text_disable);
		
		draw_reset();
	}
	
	static change_switcher_status = function(value) {
		audio_play_sound(snd_select, 0, false);
		
		switcher_status = value;
		callback(value);
	}
}