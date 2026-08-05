extends PanelContainer

@export var art:TextureRect
@export var qty_lbl:Label


func set_slot_data(slot_data:SlotData) -> void:
	var item_data = slot_data.item_data
	art.texture = item_data.texture
	tooltip_text = "%s\n%s" % [item_data.name, item_data.description]
	
	if slot_data.quantity > 1:
		qty_lbl.text = "x%s" % slot_data.quantity
		qty_lbl.show()
