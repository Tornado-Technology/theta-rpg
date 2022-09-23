/// @desc Main Update

// Always before other updates
state_update();

position_update(); // Also checks collision
trigger_update();
