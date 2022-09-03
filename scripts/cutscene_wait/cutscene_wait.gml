/// @param {Real} time
function cutscene_wait(_time) {
	time++;
	
	if (time >= _time * room_speed) {
		time = 0;
		return true;
	}
	
	return false;
}