/// @param {String} char
/// @return {Real}
function char_get_height(char) {
	var font = draw_get_font();

	if (font == -1) { 
		return 12;
	}
	
	var info = font_get_info(font);	
	return info.glyphs[$ char].h;
}
