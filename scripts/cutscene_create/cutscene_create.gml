/// @param {array} scene_actions
function cutscene_create(_scene_actions) {
	instance_create_depth(0, 0, 0, obj_cutscene, { scene_actions: _scene_actions });
}
