/// @param {Constant.HAligin} haligin Horizontal alignment
/// @param {Constant.VAligin} valigin  Vertical alignment
/// @desc Fabricator for ClassAligin()
function Aligin(haligin = default_haligin, valigin = default_valign) {
	return new ClassAligin(haligin, valigin);
}

/// @param {Constant.HAligin} haligin Horizontal alignment
/// @param {Constant.VAligin} valigin  Vertical alignment
function ClassAligin(haligin, valigin) constructor {
	self.haligin = haligin;
	self.valigin = valigin;
	
	/// @desc Works likes draw_set_aligin()
	/// But set [self.haligin] and [self.valigin]
	static set_draw_aligin  = function() {
		draw_set_aligin(haligin, valigin);
	}
	
	/// @desc Works likes draw_set_halign()
	/// But set [self.haligin]
	static set_draw_haligin = function() {
		draw_set_halign(haligin);
	}
	
	/// @desc Works likes draw_set_valigin()
	/// But set [self.valigin]
	static set_draw_valigin = function() {
		draw_set_valign(valigin);
	}
}
