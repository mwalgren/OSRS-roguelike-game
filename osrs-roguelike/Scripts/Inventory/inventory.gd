extends PanelContainer


const Slot = preload("res://Scenes/UI/Inventory/inventory_slot.tscn")
@export var item_grid:GridContainer
@export var test_inv:Resource #TESTING ONLY


func _ready() -> void:
	populate_items(test_inv.slota_data_array)##TESTING ONLY


func set_inventory_data(inventory_data:InventoryData) ->void:
	populate_items(inventory_data.slota_data_array)

func populate_items(slot_array:Array[SlotData]) ->void:
	for child in item_grid.get_children():
		child.queue_free()
	
	for i in slot_array:
		var slot = Slot.instantiate()
		item_grid.add_child(slot)
		if i:
			slot.set_slot_data(i)
