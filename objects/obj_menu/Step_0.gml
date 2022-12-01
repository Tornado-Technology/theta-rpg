for (var i = 0; i < elements_count; i++) {
	get_element_in_page(i).update(page_x, page_y + page_element_offset * i, id);
}

input_e = input_check_pressed(input.interact) || (element_mouse_index != -1 ? mouse_check_button_pressed(mb_left) : false);
input_v = input_check_pressed(input.down) - input_check_pressed(input.up);
input_h = input_check_pressed(input.right) - input_check_pressed(input.left);
held_h  = input_check_held(input.right) - input_check_held(input.left);
input_wheel = mouse_wheel_up() - mouse_wheel_down();

if (input_v != 0) {
	on_change_element();
}
