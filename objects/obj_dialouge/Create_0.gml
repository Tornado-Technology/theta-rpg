/// @desc Setup
text_index = 0;
if (!variable_instance_exists(id, "texts")) {
	texts = [];
}

if (array_length(texts) == 0) {
	instance_destroy();
	exit;
}

// Local
var width = display_get_gui_width();
var height = display_get_gui_height();

// Box
box_sprite = spr_dialouge_box;
box_padding = 10;
box_margin = 15;
box_width = width - 2 * box_margin;
box_height = 220;
box_x = width / 2 - box_width / 2;
box_y = height - box_height - box_margin;

// Text
ui_text = UIText(texts[0]);
ui_text.parse();
ui_text_x = box_x + box_padding;
ui_text_y = box_y + box_padding;
ui_text.set_wrapbox(ui_text_x, ui_text_y, box_width - box_padding, box_height - box_padding);
