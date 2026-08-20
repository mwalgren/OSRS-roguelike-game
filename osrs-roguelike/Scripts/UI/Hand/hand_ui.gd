extends Control


@export var cardscene:PackedScene
@export var hbox:HBoxContainer
@export var combatmanager:Node2D

var cards:Array = []

func _ready() -> void:
	pass


func add_card(card_instance) ->Node:
	var card_node:Node = cardscene.instantiate()
	card_node.parent = self
	card_node.name = "Card_%s" % cards.size()
	card_node.card_played.connect(combatmanager.on_card_played)
	card_node.reparent_request.connect(_on_card_ui_reparent_requested)
	hbox.add_child(card_node)
	card_node.set_card_data(card_instance)
	card_node.set_card_lbls(card_instance)
	cards.append(card_node)
	return card_node


func remove_card_node(card_node):
	if cards.has(card_node):
		cards.erase(card_node)



func play_card_from_hand(card_node:Node) -> void:
	remove_card_node(card_node)
	card_node.queue_free()



func _on_combat_manager_hand_changed(_hand_array: Variant) -> void:
	for c in hbox.get_children():
		c.queue_free()
	cards.clear()
	for card_inst in _hand_array:
		add_card(card_inst)


func _on_card_ui_reparent_requested(child:CardUi):
	child.reparent(hbox)
