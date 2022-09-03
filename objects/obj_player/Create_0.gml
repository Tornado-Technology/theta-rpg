

trigger_ignore = false;
trigger_reference = obj_trigger;
trigger_instance = noone;

trigger_update = function() {
	if (trigger_ignore) return;
	
	if (place_meeting(x, y, trigger_reference)) {
		if (trigger_instance == noone) {
			trigger_instance = instance_place(x, y, trigger_reference);
			trigger_instance.on_enter();
		} else {
			trigger_instance.on_stay();
		}
	} else if (trigger_instance != noone) {
		trigger_instance.on_exit();
		trigger_instance = noone;
	}
}

