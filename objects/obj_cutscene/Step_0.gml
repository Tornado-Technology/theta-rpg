if (array_length(scene_actions) == 0) exit;

var scene = scene_actions[scene_id];
var action_result = script_execute_ext(scene[0], scene, 1);

if (action_result == true || !is_bool(action_result)) {
	if (scene_id == array_length(scene_actions) - 1) {
		instance_destroy();
	} else {
		scene_id++;
	}
}
