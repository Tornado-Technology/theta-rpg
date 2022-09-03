/// @func __ClassSlot()
function ClassSlot() constructor {
	item = undefined;
	sprite = undefined;
	type = undefined;
	
	render = true;
	drag_and_drop = true;
	
	on_collision = Event();
	on_click = Event();
	
	position_x = 0;
	position_y = 0;
	
	static initilization = function() {
		obj_init_mouse_events.on_move.connect(function() {
			var mouse_position = {
					x: device_mouse_x_to_gui(0),
					y: device_mouse_y_to_gui(0),
			}
			
			if (point_in_rectangle(mouse_position.x, mouse_position.y, position_x, position_y, position_x + sprite_get_width(sprite),  position_y + sprite_get_height(sprite))) {
				
			}
			
			delete mouse_position;
		})
	}
	
	#region get/set methods

	static get_item = function() {	
		return item;
	}
	
	/// @param {Struct.ClassItem} item
	static set_item = function(_item) {
		if (!is_item(_item)) return;
		
		if (type == undefined && type == _item.get_type()) {
			item = _item;
		}
	}
	
	static get_type = function() {
		return type;
	}

	/// @param {Real} type
	static set_type = function(_type) {
		type = _type;
	}
	
	static get_sprite = function() {
		return sprite;
	}
	
	/// @param {Asset.GMSprite} sprite
	static set_sprite = function(_sprite) {
		sprite = _sprite;
	}
	
	static set_position = function(_x, _y) {
		position_x = _x;
		position_y = _y;
	}
	static get_render = function() {
		return render;
	}
	
	/// @param {bool} render
	static set_render = function(_render) {
		render = _render;
	}
	static get_drag_and_drop = function() {
		return drag_and_drop;
	}
	
	/// @param {bool} drag_and_drop
	static set_drag_and_drop = function(_drag_and_drop) {
		drag_and_drop = _drag_and_drop;
	}
	
	#endregion
}
