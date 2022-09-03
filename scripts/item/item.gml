/// @param {string} name
/// @param {string} description
/// @param {Asset.GMSprite} sprite
/// @desc Сreates an instance of the Item class. use to create a new item
function Item(name = "Item", description = "Item.", sprite = spr_item) {
	return new ClassItem(name, description, sprite);
}

/// @param {string} name
/// @param {string} description
/// @param {Asset.GMSprite} sprite
function ClassItem(name, description, sprite) constructor {
	__system_type = undefined; // DON'T TOUCH THIS

	self.name = name;
	self.description = description;
	self.sprite = sprite;
	
	type = undefined;
	
	static get_type = function() {
		return type;
	}
	
	/// @param {real} type
	static set_type = function(type) {
		self.type = type;
		return self;
	}
	
	static get_sprite = function() {
		return sprite;
	}
	
	/// @param {Asset.GMSprite} sprite
	static set_sprite = function(sprite) {
		self.sprite = sprite;
		return self;
	}
}

