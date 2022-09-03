// Self things
#macro sprite_aspect  (sprite_width / sprite_height)
#macro sprite_unwidth (sprite_get_width(sprite_index))
#macro sprite_unheight (sprite_get_height(sprite_index))
#macro sprite_unaspect  (sprite_unwidth / sprite_unheight)

#macro sprite_width_center (sprite_width / 2 - sprite_xoffset)
#macro sprtie_height_center (sprite_height / 2 -sprite_yoffset)

#macro sprite_edge_left (-sprite_xoffset)
#macro sprite_edge_top  (-sprite_yoffset)
#macro sprite_edge_right (sprite_width - 1 - sprite_xoffset)
#macro sprite_edge_bottom (sprite_height - 1 - sprite_yoffset)

#macro xdelta (x - xprevious)
#macro ydelta (y -yprevious)

// Platform macros
#macro is_desktop (os_type == os_windows || os_type == os_linux || os_type == os_macosx)
#macro is_mobile (os_type == os_android || os_type == os_ios)
#macro is_html (os_browser != browser_not_a_browser)
