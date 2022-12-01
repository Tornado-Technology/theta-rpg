/// @param {String} key
/// @param {Real} page 
/// @param {Function} callback
function MenuTransfer(key, page, callback = function() {}) {
	var instance = new ClassMenuTransfer(key, page, callback);
	instance.translate_update();
	return instance;
}

/// @param {String} key
/// @param {Real} page 
/// @param {Function} callback
function ClassMenuTransfer(key, page, callback) : ClassMenuElement(key) constructor {
	self.callback = callback;
	self.page = page;
	
	/// @param {Id.Instance} instance
	on_click = function(instance) {
		audio_play_sound(snd_select, 0, false);
		instance.goto_page(page);
		callback();
	}
}