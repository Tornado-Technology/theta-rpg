if (input_check_pressed(input.interact)) {
	if (ui_text.is_end) {
		ui_text.set_text(texts[++text_index]);
	} else {
		ui_text.skip();
	}
}
