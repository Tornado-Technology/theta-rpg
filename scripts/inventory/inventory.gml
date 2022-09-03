/// @param {real} slot_count
/// @desc Сreates an instance of the inventory class. Use to create a new inventory.
function Inventory(slot_count) {
	return  new ClassInventory(slot_count).initilization();
}

/// @param {real} size
function ClassInventory (size) constructor {
    slots = array_create(size, undefined);
	
	/// @param {function} call Callback function
	/// @desc Works likes Array.forEach() in JavaScritp.
	static foreach_slots = function(call) {
		for (var i = 0; i < array_length(slots); i++) {
			call(slots[i], i);
		}
	}

	/// @desc You don't need to call this.
	/// It is automatically triggered in the [Inventory()] factory.
	static initilization = function() {
		// initilization slots
		for (var i = 0; i < array_length(slots); i++) {
			slots[i] = __Slot();
		}
		return self;
	}
	
    /// @param {Real} slot_index The slot number in the inventory
	/// @desc Checks if the slot is within the inventory.
    static index_valid = function(index) {
        return index >= 0 && index <= array_length(slots) - 1;
    }
    
    /// @param {Real} number_slots_to_remove
    static reduce_size = function(_number_slots_to_remove, _clear = false) {
		var removed_items = [];
		
		if (_clear) removed_items = clear_all_slots();
		
		for (var i = 0; i < _number_slots_to_remove; i++) {
			var item = clear_slot(array_length(slots) - 1);
			
			array_delete(slots, array_length(slots) - 1, 1);
			
			if (item == undefined) continue;
			array_push(removed_items, item);
		}
		
		return removed_items;
    }

    /// @param {Real} index
    static try_get_slot = function(_index) {
        return index_valid(_index) ? slots[_index] : undefined;
    }
    
    /// @param {Real} index
    /// @param {Struct.ClassItem} item
    static try_set_item = function(_index, _item) {
        var slot = try_get_slot(_index);
       
        // Slot not founded
        if (slot == undefined) {
            return;
        }

        slot.set_item(_item);
    } 

    /// @param {Struct.ClassItem} item
    static try_add_item = function(_item) {
        for (var i = 0; i < array_length(slots); i++) {
            var slot = try_get_slot(i);
            if (slot.get_item() == undefined) {
                return try_set_item(i, _item);
            }
        }

        logger.warn("Inventory can't add item \"{0}\", reason: Inventory full", _item.name);
    }
    
	/// @param {Real} index
    static try_get_item = function(_index) {
        var slot = try_get_slot(_index);
       
        // Slot not founded
        if (slot == undefined) {
            return;
        }
        
        return slot.get_item();
    }
	
	/// @param {Real} index
	static clear_slot = function(_index) {
		var slot = try_get_slot(_index);
		
		// Slot not founded
        if (slot == undefined) {
            return;
        }
		
		var item = slot.get_item();
		
		slot.item = undefined;
		
		return item;
	}
	
	static clear_all_slots = function() {
		var removed_items = [];
		
		for (var i = 0; i < array_length(slots); i++) {
			var item = clear_slot(i);
			
			if (item == undefined) continue;
			
			array_push(removed_items, item);
		}
		
		return removed_items;
	}
	
	#region Sprite methods
	
	/// @param {Asset.GMSprite} sprite
	static set_sprite_all_slots = function(_sprite) {
		for (var i = 0; i < array_length(slots); i++) {
			slots[i].set_sprite(_sprite);
		}
	}
	
	#endregion
	
	#region render
	
	static render = function() {
		render_slots();
		render_sprite_items();
	}
	
	static render_sprite_items = function() {
		foreach_slots(function(slot) {
			if (slot.get_item() == undefined) return;
			
			var sprite = slot.get_item().get_sprite();
			
			if (sprite == undefined) return;
			
			draw_sprite(sprite, 0, slot.position_x, slot.position_y);
		})
	}
	
	static render_slots = function() {
		foreach_slots(function(slot) {
			if (!slot.get_render) return;
			
			var sprite = slot.get_sprite();
			
			draw_sprite(sprite, 0, slot.position_x, slot.position_y);
		})
	}
	
	#endregion
	
	/// @param {real} x
	/// @param {real} y
	/// @param {real} count_slots_in_width
	/// @param {real} width_offset
	/// @param {real} height_offset
	/// @param {Constant.HAligin} halign
	/// @param {Constant.VAligin} valign
	static position_set = function(_x, _y, _count_slots_in_width, _width_offset, _height_offset, _halign, _valign) {
		var inventory_width = 0;
		var inventory_height = 0;
		var new_position = {
			x: 0,
			y: 0,
		}
		
		if (_count_slots_in_width > array_length(slots)) {
			logger.warn("\"count_slots_in_width\" can't be more size inventory");
			return;
		}
		
		// inventory width
		for (var i = 0; i < _count_slots_in_width; i++) {
			var slot = try_get_slot(i);
			var sprite = slot.get_sprite();
			
			if (sprite == undefined) {
				logger.warn("no sprite was found at the slot under the index %", i);
				return;
			}
			
			var _sprite_width = sprite_get_width(sprite);
			
			inventory_width += _sprite_width + _width_offset;
		}
		
		// inventory height
		for (var i = 0; i < array_length(slots) / _count_slots_in_width; i++) {
			if (array_length(slots) / _count_slots_in_width <= 1) break;
			
			var slot = try_get_slot(_count_slots_in_width * i);
			var sprite = slot.get_sprite();
			
			if (sprite == undefined) {
				logger.warn("no sprite was found at the slot under the index {0}", i);
				return;
			}
			
			var _sprite_height = sprite_get_height(sprite);
			
			inventory_height += _sprite_height + _height_offset;
		}
		
		switch (_halign) {
			case fa_left:
				new_position.x = _x;
			break;
			
			case fa_center:
				new_position.x = _x - inventory_width / 2;
			break;
			
			case fa_right:
				new_position.x = _x - inventory_width;
			break;
		}
		
		switch (_valign) {
			case fa_top:
				new_position.y = _y;
			break;
			
			case fa_middle:
				new_position.y = _y - inventory_height / 2;
			break;
			
			case fa_bottom:
				new_position.y = _y - inventory_height;
			break;
		}
		
		var primary_position_x = new_position.x;
		var slot_width_index = 0;
		
		for (var i = 0; i < array_length(slots); i++) {
			var slot = slots[i];
			var sprite = slot.get_sprite();
			var _sprite_width = sprite_get_width(sprite);
			var _sprite_height = sprite_get_height(sprite);
			
			
			slot.set_position(new_position.x, new_position.y);
			
			new_position.x += _sprite_width;
			
			if (slot_width_index >= _count_slots_in_width - 1) {
				slot_width_index = 0;
				new_position.y += _sprite_height + _height_offset;
				new_position.x = primary_position_x;
				continue;
			}
			
			slot_width_index++
			
			new_position.x += _width_offset;
		}
		
		delete new_position;
	}
}

