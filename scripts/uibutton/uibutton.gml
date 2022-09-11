function UITextButton(text, callback = undefined) {
	return new UIButtonClass(text, spr_empty, callback); 
}

function UIButton(text, sprite = spr_empty, callback = undefined) {
	return new UIButtonClass(text, sprite, callback); 
}

/// @param {String} text
/// @param {Asset.GMSprite} sprite
/// @param {Function} callback
function UIButtonClass(text, sprite, callback) constructor {
	self.text = UIText(text);
	self.text.parse();
	self.text.typewriter_speed = -1;
	self.text.font = font_arcade;
	self.text.use_tags = false;
	
	self.callback = callback;
	
	width = string_real_width(self.text.display_text) + 5;
	height = char_get_height("W") + 5;
	
	if (sprite != spr_empty) {
		width = sprite_get_width(sprite);
		height = sprite_get_height(sprite);
	}
	
	hover = false;
	
	text_scale_x = 1;
	text_scale_y = 1;
	text_hover_scale_x = 1.5;
	text_hover_scale_y = 1.5;
	
	/// @param {Real} width
	/// @param {Real} height
	static set_size = function(width, height) {
		self.width = width;
		self.height = height;
	}
	
	/// @param {Real} x
	/// @param {Real} y
	static draw = function(position_x, position_y) {
		update(position_x, position_y);
		
		text.scale_x = lerp(text.scale_x, hover ? text_hover_scale_x : text_scale_x, 0.7);
		text.scale_y = lerp(text.scale_y, hover ? text_hover_scale_y : text_scale_y, 0.7);
		text.aligin(fa_center, fa_middle);
		text.draw(position_x, position_y);
		
		draw_reset();
	}

	
	static update = function(position_x, position_y) {
		var point_x1 = position_x - width;
		var point_y1 = position_y - height;
		var point_x2 = position_x + width;
		var point_y2 = position_y + height;

		if (DEBUG_MODE) {
			draw_set_color(c_red);
			draw_rectangle(point_x1, point_y1, point_x2, point_y2, true);
		}
		
		hover = point_in_rectangle(mouse_x, mouse_y, point_x1, point_y1, point_x2, point_y2);
		
		if (hover && callback != undefined && mouse_check_button_pressed(mb_left)) {
			callback();
		}
	}
}
