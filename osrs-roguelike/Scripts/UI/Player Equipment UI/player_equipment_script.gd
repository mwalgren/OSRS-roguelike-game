extends PanelContainer


var equipment_slot = preload("res://Scenes/UI/Equipment/equipment_slot.tscn")
@export var left_slots_vbox:VBoxContainer
@export var right_slots_vbox:VBoxContainer

var equipped:Dictionary = {}
var slot_nodes = {}

func _ready() -> void:
	for n in find_children("*", "", true, false):
		if n is ItemSlotUI:
			print(n.name, " -> ", n.get_script().resource_path)
	for slot in find_children("*", "EquipmentSlot", true, false):
		if slot.slot_type != ItemData.TYPE.NONE:
			slot_nodes[slot.slot_type] = slot
			slot.clear_slots()


func equip(slot_data:SlotData):
	print("equip func : working")
	var type = slot_data.item_data.item_type
	
	if not slot_nodes.has(type):
		return slot_data

	var displaced:SlotData = equipped.get(type)
	equipped[type] = slot_data
	slot_nodes[type].set_slot_data(slot_data)
	return displaced
