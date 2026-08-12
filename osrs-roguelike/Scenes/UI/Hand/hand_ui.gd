extends Control


@export var cardscene:PackedScene
@export var hbox:HBoxContainer

func update_hand(hand_array):
	for c in hbox.get_children():
		c.queue_free()
	for i in hand_array.size():
		print(i)
		var card = cardscene.instantiate()
		card.set_card_data(hand_array[i])
		card.set_card_lbls(hand_array[i])
		hbox.add_child(card)


func _on_combat_manager_hand_changed(_hand_array: Variant) -> void:
	update_hand(_hand_array)
	print("on_hand_changed")
