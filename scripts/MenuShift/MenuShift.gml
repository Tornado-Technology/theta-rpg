/// @param {String} key
/// @param {Array<String>} elements
/// @param {Function} callback
/// @param {Real} element
function MenuShift(key, elements, element = 0, callback = function() {}) {
	var instance = new ClassMenuShift(key, elements, callback, element);
	instance.translate_update();
	return instance;
}

/// @param {String} key
/// @param {Array<String>} elements
/// @param {Function} callback
/// @param {Real} element
function ClassMenuShift(key, elements, callback, element) : ClassMenuElement(key) constructor {
	self.callback = callback;
	self.elements = elements;
	self.element = element;
	elements_count = array_length(elements);
	
	is_shift = false;
	text_char_right_position_x = 0;
	text_shift = "";
	
	static base_update = update;
	static base_draw = draw;
	
	static offset = 64;
	
	static text_char_left = "<<";
	static text_char_right = ">>";
	static text_char_left_width = string_width(text_char_left);
	static text_char_right_width = string_width(text_char_right);
	
	static char_height = char_get_height("W");
	
	/// @param {Real} position_x
	/// @param {Real} position_y
	/// @param {Id.Instance} instance
	static update = function(position_x, position_y, instance) {
		base_update(position_x, position_y, instance);
		
		if (text_char_right_position_x == 0) {
			text_char_right_position_x = get_text_char_right_position_x(position_x, instance);
		}
		
		var position_x_new = position_x + instance.page_width + offset;
		var char_left_mouse_hover = point_in_rectangle(mouse_gui_x, mouse_gui_y, position_x_new, position_y, position_x_new + text_char_left_width, position_y + char_height);
		var char_right_mouse_hover = point_in_rectangle(mouse_gui_x, mouse_gui_y, text_char_right_position_x, position_y, text_char_right_position_x + text_char_right_width, position_y + char_height);
		
		if (char_left_mouse_hover && element != 0 && mouse_check_button_pressed(mb_left)) {
			element--;
			change_element(position_x, position_y, instance);
		}
		
		if (char_right_mouse_hover && element + 1 != elements_count && mouse_check_button_pressed(mb_left)) {
			element++;
			change_element(position_x, position_y, instance);
		}
		
		if (!hover) {
			return;
		}
		
		element += instance.input_h;
		
		if (element >= elements_count) {
			element = 0;
		}
		
		if (element < 0) {
			element = elements_count - 1;
		}
		
		if (instance.input_h != 0) {
			change_element(position_x, position_y, instance);
		}
	}
	
	/// @param {Real} position_x
	/// @param {Real} position_y
	/// @param {Id.Instance} instance
	static draw = function(position_x, position_y, instance) {
		base_draw(position_x, position_y, instance);
		
		var char_left  = element == 0 ? "" : text_char_left + " ";
		var char_right = element + 1 == elements_count ? "" : " " + text_char_right;
		text_shift = char_left + elements[element] + char_right;
		
		draw_reset();
		draw_set_font(font_determination);
		
		draw_text_outlined(position_x + instance.page_width + offset, position_y, text_color, text_color_outline, text_shift);
		draw_reset();
	}
	
	/// @param {Real} position_x
	/// @param {Id.Instance} instance
	static get_text_char_right_position_x = function(position_x, instance) {
		var char_left  = element == 0 ? "" : text_char_left + " ";
		return position_x + instance.page_width + offset + string_width(char_left + elements[element] + " ");
	}
	
	/// @param {Real} position_x
	/// @param {Real} position_y
	/// @param {Id.Instance} instance
	static change_element = function(position_x, position_y, instance) {
		audio_play_sound(snd_selecting, 0, false);
		callback(element);
		text_char_right_position_x = get_text_char_right_position_x(position_x, instance);
	}
}