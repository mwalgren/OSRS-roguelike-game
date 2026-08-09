extends Control

@export var test_player_inv_panel:PanelContainer
@export var test_inv:Resource #TESTING ONLY

var slot_drag_data:SlotData

@onready var inventory_slot: PanelContainer = $InventorySlot
@export var player_equipment:PanelContainer


func _physics_process(delta: float) -> void:
	if inventory_slot.visible:
		inventory_slot.global_position = get_global_mouse_position() + Vector2(5,5)

func _ready() -> void:
	set_player_inventory_data(test_inv)

func set_player_inventory_data(inv_data:InventoryData) -> void:
	test_player_inv_panel.set_inventory_data(inv_data)
	inv_data.inventory_equip.connect(on_inventory_equip)
	inv_data.inventory_interact.connect(on_inventory_interact)


func on_inventory_interact(inventory_data:InventoryData, index:int, button:int):
		match [slot_drag_data, button]:
			[null, MOUSE_BUTTON_LEFT]:
				slot_drag_data = inventory_data.grab_slot_data(index)
			[_, MOUSE_BUTTON_LEFT]:
				slot_drag_data = inventory_data.drop_slot_data(slot_drag_data, index)
			[null, MOUSE_BUTTON_RIGHT]:
				pass
			[_, MOUSE_BUTTON_RIGHT]:
				slot_drag_data = inventory_data.drop_single_slot_data(slot_drag_data, index)
		update_dragged_slot()


func update_dragged_slot() -> void:
	if slot_drag_data:
		inventory_slot.show()
		inventory_slot.set_slot_data(slot_drag_data)
	else:
		inventory_slot.hide()


func on_inventory_equip(inventory_data:InventoryData, index:int):
	if slot_drag_data:
		return
	
	var slot_data = inventory_data.slot_data_array[index]
	#print("type: ", slot_data.item_data.item_type)
	if not slot_data or slot_data.item_data.item_type == ItemData.TYPE.NONE:
		return
	var grabbed = inventory_data.grab_slot_data(index)
	var displaced = player_equipment.equip(grabbed)
	if displaced: 
		inventory_data.drop_slot_data(displaced, index)

func on_inventory_unequip(inventory_data:InventoryData, index:int):
	if inventory_data:
		inventory_data = null
