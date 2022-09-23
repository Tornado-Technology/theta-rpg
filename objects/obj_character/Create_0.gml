// The base class for "character"
// In this case used to hide the player's system functions
// IT'S NOT FOR CREATING NPC

// Variables for use in states, etc.
movement_speed_x = 0;
movement_speed_y = 0;

// Position interaction
position_update = function() {
	collision_update();
	x += movement_speed_x;
	y += movement_speed_y;
}

// Collision interaction
collision_ignore = false;
collision_reference = obj_collider;
collision_instance = noone;

collision_update = function() {
	if (collision_ignore) return;
	
	if (place_meeting(x + movement_speed_x, y, collision_reference)) {
		var result_x = movement_speed_x;
		while (!place_meeting(x + sign(result_x), y, collision_reference)) {
			result_x += sign(result_x);
		}
		
		movement_speed_x = result_x;
	}

	if (place_meeting(x, y + movement_speed_y, collision_reference)) {
		var result_y = movement_speed_y;
		while(!place_meeting(x, y + sign(result_y), collision_reference)) {
			result_y += sign(result_y);
		}
		
		movement_speed_y = result_y;
	}
}

// Trigger interaction
trigger_ignore = false;
trigger_reference = obj_trigger;
trigger_instance = noone;
on_triggered = function() { };

trigger_update = function() {
	if (trigger_ignore) return;
	
	if (place_meeting(x, y, trigger_reference)) {
		// Trigger Enter
		if (trigger_instance == noone) {
			trigger_instance = instance_place(x, y, trigger_reference);
			trigger_instance.on_enter(id);
			return;
		}
		
		// Trigger Stay
		trigger_instance.on_stay(id);
			
		// Trigger Interaction
		if (input_check_pressed(input.interact)) {
			trigger_instance.on_interaction(id);
		}
		return;
	} 
	
	// Trigger exit
	if (trigger_instance != noone) {
		trigger_instance.on_exit(id);
		trigger_instance = noone;
	}
}

// State machine
state_index = 0;
states = [];
state_add = function(name, callback) {
	array_push(states, State(name, callback));
}

set_state = function(index) {
	state_index = index;
}

get_state = function() {
	return states[state_index];
}

state_update = function() {
	get_state().invoke(self);
}

