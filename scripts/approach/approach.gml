/// @func approach()
/// @param {real} value
/// @param {real} target
/// @param {real} amout
function approach(_value, _target, amount) {
	return _value < _target ? min(_value + amount, _target) : max(_value - amount, _target);
}
