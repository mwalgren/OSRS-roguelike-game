extends ItemSlotUI
class_name EquipmentSlot

@export var slot_type:ItemData.TYPE = ItemData.TYPE.NONE
signal slot_unequip(slot)


func _gui_input(event: InputEvent) -> void:
	if not (event is InputEventMouseButton and event.is_pressed()):
		return
	if event.button_index == MOUSE_BUTTON_LEFT and event.shift_pressed:
		slot_unequip.emit(self)
		self.clear_slot()
