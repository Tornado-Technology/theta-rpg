function Event(){
	return new __class_event();
}

function __class_event() constructor {
	listeners = [];
	
	static connect = function(_method) {
		array_push(listeners, _method)
		return _method;
	}
	
	static disconnect = function(_method) {
		for (var i = 0; i < array_length(listeners); i++) {
			var element = listeners[i];
			
			if (_method == element) {
				array_delete(listeners, i, 1);
				return;
			}
		}
	}
	
	static invoke = function() {
		var array_arguments = [];
		for (var i = 0; i < argument_count; i++) {
			array_push(array_arguments, argument[i]);
		}
		
		for (var i = 0; i < array_length(listeners); i++) {
			var listener_method = listeners[i];
			
			try {
				listener_method(array_arguments);
			} catch(_error) {
				logger.error("Event: Listener method call error: ", _error.message);
			}
		}
	}
}
