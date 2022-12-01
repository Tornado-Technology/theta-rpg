function MenuExecute(key, arguments, callback) {
	var instance = new ClassMenuExecute(key, arguments, callback);
	instance.translate_update();
	return instance;
}

function ClassMenuExecute(key, arguments, callback) : ClassMenuElement(key) constructor {
	self.callback = callback;
	self.arguments = arguments;
	
	on_click = function() {
		if (array_length(arguments) > 0) {
			callback(arguments);
			return;
		}
		
		callback();
	}
}