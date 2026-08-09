extends PanelContainer


const Slot = preload("res://Scenes/UI/Inventory/inventory_slot.tscn")
@export var item_grid:GridContainer




func set_inventory_data(inventory_data:InventoryData) ->void:
	inventory_data.inventory_update.connect(populate_items)
	populate_items(inventory_data)

func populate_items(inventory_data:InventoryData) ->void:
	for child in item_grid.get_children():
		child.queue_free()
	
	for i in inventory_data.slot_data_array:
		var slot = Slot.instantiate()
		item_grid.add_child(slot)
		slot.slot_clicked.connect(inventory_data.on_slot_clicked)
		slot.slot_equip.connect(inventory_data.on_slot_equip)
		if i:
			slot.set_slot_data(i)
