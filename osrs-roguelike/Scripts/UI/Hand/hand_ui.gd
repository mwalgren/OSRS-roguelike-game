extends Control


@export var cardscene:PackedScene
@export var container:Control #not in use
@export var hbox:HBoxContainer
@export var fan_radius:float = 220.00 #not in use
@export var fan_angle_deg:float = 90.00 #not in use
@export var card_spacing_y:float = 20.00 #not in use
@export var animation_time = 0.15 #not in use

var cards:Array = []

func _ready() -> void:
	container.clip_contents


func add_card(card_instance) ->Node:
	var card_node:Node = cardscene.instantiate()
	card_node.name = "Card_%s" % cards.size()
	hbox.add_child(card_node)
	card_node.set_card_data(card_instance)
	card_node.set_card_lbls(card_instance)
	#card_node.hand = self
	cards.append(card_node)
	#arrange_cards()
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

#func update_hand(hand_array):
	#for c in hbox.get_children():
		#c.queue_free()
	#for i in hand_array.size():
		#print(i)
		#var card = cardscene.instantiate()
		#card.set_card_data(hand_array[i])
		#card.set_card_lbls(hand_array[i])
		#hbox.add_child(card)


func _on_combat_manager_hand_changed(_hand_array: Variant) -> void:
	add_card(_hand_array.pop_back()) # MUST BE CHANGED DEBUG ONLY 
	print("on_hand_changed")
