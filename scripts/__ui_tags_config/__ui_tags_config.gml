#region Color
Tag(["color", "colour"], function(ui, index, arguments) {
	ui.color = global.__uilib_colors[$ arguments[0]];
});

Tag(["/color", "/colour"], function(ui, index, arguments) {
	ui.color = c_white;
});
#endregion
#region Font
Tag(["font"], function(ui, index, arguments) {
	ui.font = asset_get_index(arguments[0]);
});

Tag(["/font"], function(ui, index, arguments) {
	ui.font = -1;
});
#endregion
#region Typewriter
Tag(["speed"], function(ui, index, arguments) {
	ui.typewriter_speed = real(arguments[0]);
	ui.typewriter_voice_speed = real(arguments[0]);
}, true);

Tag(["/speed"], function(ui, index, arguments) {
	ui.typewriter_speed = 2;
	ui.typewriter_voice_speed = 2;
}, true);

Tag(["writeSpeed"], function(ui, index, arguments) {
	ui.typewriter_speed = real(arguments[0]);
}, true);

Tag(["/writeSpeed"], function(ui, index, arguments) {
	ui.typewriter_speed = 2;
}, true);

Tag(["voiceSpeed"], function(ui, index, arguments) {
	ui.typewriter_voice_speed = real(arguments[0]);
}, true);

Tag(["/voiceSpeed"], function(ui, index, arguments) {
	ui.typewriter_voice_speed = 2;
}, true);
#endregion
#region Voice
Tag(["voice"], function(ui, index, arguments) {
	ui.voice = asset_get_index(arguments[0]);
});

Tag(["/voice"], function(ui, index, arguments) {
	ui.voice = undefined;
});
#endregion

Tag(["player"], function(ui, index, arguments) {
	switch (arguments[0]) {
		case "name":
			ui.display_text = string_insert(global.player_name, ui.display_text, index);
			break;
	}
}, true);