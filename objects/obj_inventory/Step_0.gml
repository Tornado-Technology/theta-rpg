if (mouse_x != mouse_xprevious || mouse_y != mouse_yprevious) { 
	on_mouse_movement.invoke(mouse_x, mouse_y);
}

mouse_xprevious = mouse_x;
mouse_yprevious = mouse_y;

if (mouse_check_button_pressed(mb_any)) {
	on_mouse_click.invoke(mouse_button);
}
