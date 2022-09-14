/// @param {Array<Any>} array
/// @param {Function} predicate
/// @param {Array<Any>} args
function array_find(array, predicate, args) {
	for (var i = 0; i < array_length(array); i++) {
		var value = array[i];
		if (predicate(value, i, args)) {
			return value;
		}
	}
	
	return undefined;
}
