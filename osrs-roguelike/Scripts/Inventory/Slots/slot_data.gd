extends Resource
class_name SlotData

const max_stack_size:int = 99

@export var item_data:ItemData
@export_range(1,max_stack_size) var quantity:int = 1: set = set_quantity


func can_merge_slot(other_slot:SlotData) ->bool:
	return item_data == other_slot.item_data \
		and item_data.stackable \
		and quantity + other_slot.quantity <= max_stack_size

func merge_slots(other_slot_data:SlotData) ->void:
	quantity += other_slot_data.quantity


func set_quantity(value:int) -> void:
	quantity = value
	if item_data and quantity > 1 && not item_data.stackable:
		quantity = 1
		push_error("%s is not stackable" % item_data.name)

func can_merge_one(other_slot:SlotData) ->bool:
	return item_data == other_slot.item_data \
		and item_data.stackable \
		and quantity + other_slot.quantity < max_stack_size

func create_single_slot_data() ->SlotData:
	var new_slot_data = duplicate()
	new_slot_data.quantity = 1
	quantity -= 1
	return new_slot_data
