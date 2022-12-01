elements_count = 0;
element_mouse_index = -1;
element_index = -1;

pages = [];
page = 0;

page_max_width = 0;
page_max_hegiht = 0;
page_width = 0;
page_height = 0;
page_element_offset = 20;

input_e = 0;
input_v = 0;
input_h = 0;
held_h = 0;
input_wheel = 0;

/// @return {Real}
get_page_width = function() {	
	for (var i = 0; i < elements_count; i++) {
		page_max_width = max(page_max_width, get_element_in_page(i).text_width);
	}
	
	return page_max_width;
}

/// @return {Real}
get_page_height = function() {
	for (var i = 0; i < elements_count; i++) {
		page_max_hegiht = get_element_in_page(i).text_height + page_element_offset * i;
	}

	return page_max_hegiht;
}

unfocus_current_element = function() {
	if (element_index < 0 || element_index >= elements_count) {
		return;
	}
	get_element_in_page(element_index).unfocus();
}

get_current_element_in_page = function() {
	return pages[page][element_index];
}

/// @param {Real} index
get_element_in_page = function(index) {
	return pages[page][index];
}

on_change_element = function() {
	if (element_mouse_index != -1) {
		return;
	}
	
	var previous_element = element_index;
	element_index += input_v;
	
	if (element_index == elements_count) {
		element_index = 0;
	}
	
	if (element_index < 0) {
		element_index = elements_count - 1;
	}
	
	if (previous_element >= 0 && previous_element != elements_count) {
		get_element_in_page(previous_element).unfocus();
	}
	
	get_current_element_in_page().focus();
}

/// @param {Array<Element>} elements
/// @param {Real} position
create_page = function(elements, position) {
	pages[position] = elements;
	for (var i = 0; i < array_length(pages[position]); i++) {
		pages[position][i].index = i;
	}
}
	
get_page = function(index) {
	return pages[index];
}

pages_foreach = function(callback) {
	for (var i = 0; i < array_length(pages); i++) {
		callback(get_page(i));
	}	
}

/// @param {Real} index
goto_page = function(index) {
	unfocus_current_element();
	page = index;
	
	elements_count = array_length(pages[index]);
	page_width = get_page_width();
	page_height = get_page_height();
	
	input_e = 0;
	
	element_mouse_index = -1;
	element_index = -1;
}

/// @param {Real} index
change_element_mouse = function(index) {
	//if (input_is_locked) return;
	
	if (index == -1) {
		element_mouse_index = -1;
		return;
	}
	
	if (element_index >= 0 && element_index != elements_count) {
		get_element_in_page(element_index).unfocus();
	}
	
	element_index = index;
	element_mouse_index = index;
	
	get_current_element_in_page().focus();
}

enum menu_page { 
	main,
}

// Elements
Execute = MenuExecute;
Transfer = MenuTransfer;
Shift = MenuShift;
Toggle = MenuToggle;
Slider = MenuSlider;

create_page([
	Execute("Main.Exit", [], game_end),
], menu_page.main);

var languages = [];
for (var i = 0; i < array_length(global.__translate_languages); i++) {
	var language_directory = global.__translate_languages[i];
	var info = json_open(TRANSLATE_DIRECTORY + language_directory + "/" + TRANSLATE_LANGUAGE_FILE_MAIN_INFO);
	array_push(languages, info.Name);
}
goto_page(menu_page.main);

page_x = 100;
page_y = 200;

translate_update = on_translate_update.connect(function () {
	pages_foreach(function(page) {
		for (var i = 0; i < array_length(page); i++) {
			page[i].translate_update();
			page_width = get_page_width();
		}
	})
});
