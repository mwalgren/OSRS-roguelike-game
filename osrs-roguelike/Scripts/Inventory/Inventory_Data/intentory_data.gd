extends Resource
class_name InventoryData

signal inventory_interact(inventory_data:InventoryData, index:int, button:int)
signal inventory_update(inventory_data:InventoryData)

@export var slot_data_array:Array [SlotData]


func grab_slot_data(index:int) -> SlotData:
	var slot_data = slot_data_array[index]
	
	if slot_data:
		slot_data_array[index] = null
		inventory_update.emit(self)
		return slot_data
	else:
		return null


func on_slot_clicked(index:int, button:int) ->void:
	inventory_interact.emit(self, index, button)

func drop_slot_data(slot_drag_data:SlotData, index:int) -> SlotData:
	var slot_data = slot_data_array[index]
	
	var return_slot_data:SlotData
	
	if slot_data and slot_data.can_merge_slot(slot_drag_data):
		slot_data.merge_slots(slot_drag_data)
	else: 
		slot_data_array[index] = slot_drag_data
		return_slot_data = slot_data

	inventory_update.emit(self)
	return return_slot_data

func drop_single_slot_data(slot_drag_data:SlotData, index:int) ->SlotData:
	var slot_data = slot_data_array[index]
	
	if not slot_data:
		slot_data_array[index] = slot_drag_data.create_single_slot_data()
	elif slot_data.can_merge_one(slot_drag_data):
		slot_data.merge_slots(slot_drag_data.create_single_slot_data())
		
	inventory_update.emit(self)
		
	if slot_drag_data.quantity > 0:
		return slot_drag_data
	else: return null
