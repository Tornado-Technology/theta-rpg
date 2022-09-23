/// @desc Customizable vatiables
// System methods in obj_character
event_inherited();

// Customizable pricks(Variable)
movement_speed_swim = 1;
movement_speed_walk = 2;
movement_speed_run  = 3;

// State machine
enum player_state {
	idle,
	walk,
	run,
	interact
}

on_triggered = function() {
	if (trigger_instance == noone) {
		set_state(player_state.interact);
		return;
	}
	
	set_state(player_state.idle);
};

state_add(player_state.idle, function(arguments) {
	var player = arguments[0];
	var input_horizontal = input_check(input.right) - input_check(input.left);
	var input_vertical = input_check(input.down) - input_check(input.up);
	
	if (image_speed == 1) {
		image_speed = 0;
		image_index = 0;
	}
	
	if (input_horizontal != 0 || input_vertical != 0) {
		image_speed = 1;
		set_state(player_state.walk);
	}
});

state_add(player_state.walk, function(arguments) {
	var player = arguments[0];
	var input_horizontal = input_check(input.right) - input_check(input.left);
	var input_vertical = input_check(input.down) - input_check(input.up);
	
	movement_speed_x = input_horizontal * movement_speed_walk;
	movement_speed_y = input_vertical * movement_speed_walk;
	
	if (input_horizontal != 0) {
		sprite_index = input_horizontal == -1 ? spr_char_frisk_walk_left : spr_char_frisk_walk_right;
	}
	
	if (input_vertical != 0) {
		sprite_index = input_vertical == -1 ? spr_char_frisk_walk_up : spr_char_frisk_walk_down;
	}
	
	
	if (input_horizontal == 0 && input_vertical == 0) {
		set_state(player_state.idle);
	}
});

state_add(player_state.run, function(arguments) {
	var player = arguments[0];
});

state_add(player_state.interact, function(arguments) {
	var player = arguments[0];
});
