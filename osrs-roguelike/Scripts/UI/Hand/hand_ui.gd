extends Control


@export var cardscene:PackedScene
@export var hbox:HBoxContainer
@export var combatmanager:Node2D

var cards:Array = []

func _ready() -> void:
	pass

func add_card(card_instance) ->Node:
	var card_node:Node = cardscene.instantiate()
	card_node.name = "Card_%s" % cards.size()
	card_node.card_played.connect(combatmanager.on_card_played)
	#card_node.card_played.connect(play_card_from_hand)
	hbox.add_child(card_node)
	card_node.set_card_data(card_instance)
	card_node.set_card_lbls(card_instance)
	cards.append(card_node)
	return card_node


func remove_card_node(card_node):
	if cards.has(card_node):
		cards.erase(card_node)
		#arrange_cards()

func play_card_from_hand(card_node:Node) -> void:
	remove_card_node(card_node)
	card_node.queue_free()

#func arrange_cards():
	#var n = cards.size()
	#if n == 0:
		#return
	#var base = container.size
	#var center_x = base.x * 0.5
	#var baseline_y = base.y - card_spacing_y
	#var total_angle = deg_to_rad(fan_angle_deg)
	#var start_angle = -total_angle * 0.5
	#for i in range(n):
		#var t = 0.0
		#if n == 1:
			#t = 0.5
		#else: 
			#t = float(i) / float(max(1, n - 1))
		#var ang = start_angle + t * total_angle
		#var pos = Vector2(sin(ang), -cos(ang)) * fan_radius + Vector2(center_x, baseline_y)
		#var rot = rad_to_deg(ang) * 0.8
		#var z = i
		#
		#if cards[i].has_method("move_to_target"):
			#cards[i].move_to_target(pos, deg_to_rad(rot), animation_time, z)
		#else:
			#cards[i].global_position = container.global_position + pos
			#cards[i].rotation = deg_to_rad(rot)
			#cards[i].z_index = z



func reparent_to_container() ->void:
		for child in hbox.get_children():
			var card_ui := child as CardUi

func _on_combat_manager_hand_changed(_hand_array: Variant) -> void:
	for c in hbox.get_children():
		c.queue_free()
	cards.clear()
	for card_inst in _hand_array:
		add_card(card_inst)

func _on_card_ui_reparent_requested(child:CardUi):
	child.reparent(hbox)
