draw_reset();
for (var i = 0; i < elements_count; i++) {
	get_element_in_page(i).draw(page_x, page_y + page_element_offset * i, id);
}
