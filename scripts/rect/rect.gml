/// @param {real} x1 Start x rect point
/// @param {real} y1 Start y rect point
/// @param {real} x2 End x rect point (x1 + width)
/// @param {real} y2 End y rect point (y1 + height)
/// @desc (Fabricator) Return a new ClassRect();
function Rect(x1, y1, x2, y2) {
	return new ClassRect(x1, y1, x2, y2);
}

/// @param {real} x1 Start x rect point
/// @param {real} y1 Start y rect point
/// @param {real} x2 End x rect point (x1 + width)
/// @param {real} y2 End y rect point (y1 + height)
/// @desc Stores a set of 4 points.
function ClassRect(x1, y1, x2, y2) constructor {
	self.x1 = x1;
	self.y1 = y1;
	self.x2 = x2;
	self.y2 = y2;
	
	/// @param {real} draw_x Start x draw point
	/// @param {real} draw_y Start y draw point
	/// @param {bool} outline Draw outline(true) or fill(false).
	/// @desc Work only in Draw Events.
	static draw = function(draw_x, draw_y, outline) {
		draw_rectangle(x1 + draw_x, y1 + draw_y, x2 + draw_x, y2 + draw_y, outline);
	}
	
	/// @param {real} x_ponit Point x to check
	/// @param {real} y_ponit Point y to check
	/// @desc Checks if the point inside in the rect.
	static point_in_rect = function(x_point, y_point) {
		return point_in_rectangle(x_point, y_point, x1, y1, x2, y2);
	}
	
	/// @desc Checks if the mouse inside in the rect.
	static mouse_in_rect = function() {
		return point_in_rect(mouse_x, mouse_y);
	}
}
