extends Control

@export var test_player_inv_panel:PanelContainer
@export var test_inv:Resource #TESTING ONLY

var slot_drag_data:SlotData
@onready var inventory_slot: PanelContainer = $InventorySlot

func _physics_process(delta: float) -> void:
	if inventory_slot.visible:
		inventory_slot.global_position = get_global_mouse_position() + Vector2(5,5)

func _ready() -> void:
	set_player_inventory_data(test_inv)

func set_player_inventory_data(inv_data:InventoryData) -> void:
	test_player_inv_panel.set_inventory_data(inv_data)
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


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI/Start Screen/Splash.tscn")
