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

state_add(player_state.idle, function(arguments) {
	var player = arguments[0];
});

state_add(player_state.walk, function(arguments) {
	var player = arguments[0];
});

state_add(player_state.run, function(arguments) {
	var player = arguments[0];
});

state_add(player_state.interact, function(arguments) {
	var player = arguments[0];
});
