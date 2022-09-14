/// @param {Real} target
/// @param {Array<Real>} keys
/// @param {Bool} rebinding
function InputKey(target, keys, rebinding = true) {
	if (!variable_global_exists("__inputs")) {
		global.__inputs = [];
	}
	
	var input_key = new InputKeyClass(target, keys, rebinding);
	array_push(global.__inputs, input_key);
	return input_key;
}

/// @param {Real} target
/// @param {Array<Real>} keys
/// @param {Bool} rebinding
function InputKeyClass(target, keys, rebinding) constructor {
	self.target = target;
	self.keys = keys;
	self.rebinding = rebinding;

	#region Check methods
	/// @param {Function} callabck
	/// @return {Bool}
	static __check__ = function(callback) {
		for (var i = 0; i < array_length(keys); i++) {
			if (callback(keys[i])) {
				return true;
			}
		}
		
		return false;
	}

	/// @return {Bool}
	static check = function() {
		return __check__(function(key) {
			return keyboard_check(key);
		});
	}
	
	/// @return {Bool}
	static check_pressed = function() {
		return __check__(function(key) {
			return keyboard_check_pressed(key);
		});
	}
	
	/// @return {Bool}
	static check_direct = function() {
		return __check__(function(key) {
			return keyboard_check_direct(key);
		});
	}
	
	/// @return {Bool}
	static check_released = function() {
		return __check__(function(key) {
			return keyboard_check_released(key);
		});
	}
	#endregion
	
	/// @param {Real} key
	static has_key = function(key) {
		return array_has(keys, key);
	}
	
	/// @param {Real} key
	static add_key = function(key) {
		if (!rebinding) return;
		
		if (array_has(keys, key)) {
			logger.warn("InputKey add \"{0}\"key failed, reasone: Already in the keys.");
			return;
		}
		
		array_push(keys, key);
	}
	
	/// @param {Real} key
	static remove_key = function(key) {
		if (!rebinding) return;
		
		var index = array_indexof(keys, key);
		if (index == -1) {
			logger.warn("InputKey remove \"{0}\"key failed, reasone: Not found in the keys.");
			return;
		}

		array_delete(keys, index, 1);
	}
		
	static clear_keys = function() {
		array_clear(keys);
	}
}
