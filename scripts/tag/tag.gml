/// @param {Array<String>} names
/// @param {Function} callback
/// @param {Bool} single_use
function Tag(names, callback, single_use = false) {
	var tag = new ClassTag(names, callback, single_use);
	if (!variable_global_exists("__tags")) {
		/// @return {Array<Struct.ClassTag>}
		global.__tags = [];
	}
	
	array_push(global.__tags, tag);
	return tag;
}

/// @param {Array<String>} names
/// @param {Function} callback
/// @param {Bool} single_use
function ClassTag(names, callback, single_use) constructor {
	self.names = names;
	self.callback = callback;
	self.single_use = single_use;
	
	/// @param {Struct.UITextClass} ui
	/// @param {Real} index
	/// @param {Array<Any>} arguments
	static invoke = function(ui, index, arguments) {
		try {
			callback(ui, index, arguments);
		} catch(error) {
			logger.crash("Tag \"{0}\" calling failed, reasone: {1}.", string_join(names, ", "), error.message);
		}
	}
	
	/// @param {String} name
	/// @return {Bool}
	static has_name = function(name) {
		for (var i = 0; i < array_length(names); i++) {
			if (names[i] == name) {
				return true;
			}
		}
		
		return false;
	}
}
