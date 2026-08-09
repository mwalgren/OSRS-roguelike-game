extends PanelContainer
class_name ItemSlotUI

@export var art:TextureRect
@export var qty_lbl:Label

signal slot_clicked(index:int, button:int)
signal slot_equip(index:int)

func set_slot_data(slot_data:SlotData) -> void:
	var item_data = slot_data.item_data
	art.texture = item_data.texture
	tooltip_text = "%s\n%s" % [item_data.name, item_data.description]

	if slot_data.quantity > 1:
		qty_lbl.text = "x%s" % slot_data.quantity
		qty_lbl.show()
	else:
		qty_lbl.hide()


func _on_gui_input(event: InputEvent) -> void:
	if not (event is InputEventMouseButton and event.is_pressed()):
		return
	if event.button_index == MOUSE_BUTTON_LEFT and event.shift_pressed:
		slot_equip.emit(get_index())
	elif event is InputEventMouseButton \
			and (event.button_index == MOUSE_BUTTON_LEFT \
			or event.button_index == MOUSE_BUTTON_RIGHT) \
			and event.is_pressed():
		slot_clicked.emit(get_index(), event.button_index)#change this int to a dynamic var


func clear_slots() -> void:
	art.texture = null
	qty_lbl.hide()
	tooltip_text = ""
