enum input {
	up,
	down,
	left,
	right,
	
	interact,
	fullscreen
}

// Bind
input_bind(input.up,       [vk_up,    "W"]);
input_bind(input.down,     [vk_down,  "S"]);
input_bind(input.left,     [vk_left,  "A"]);
input_bind(input.right,    [vk_right, "D"]);
input_bind(input.interact, [vk_enter, "X"]);
input_bind(input.fullscreen, vk_f11);
