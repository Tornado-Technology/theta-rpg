inventory = Inventory(10);
inventory.try_add_item(Item("Octo", "Octo the best my friend", spr_item));

inventory.set_sprite_all_slots(spr_slot);

inventory.position_set(room_width / 2, room_height / 2, 5, 10, 10, fa_right, fa_bottom);

number = 0;
