extends Control


@export var CombatManager:Node2D

@export var deck_vbox:VBoxContainer  #debug
@export var hand_vbox:VBoxContainer #debug

@export var hand_container:PackedScene #debug



func _ready() -> void:
	refresh()
	CombatManager.player_deck_inst.hand_changed.connect(func(_h): refresh())


func _on_button_pressed() -> void:
	CombatManager.draw_card(1)
	refresh()

func refresh():
	update_deck()
	update_hand()

func update_hand():
	_fill(hand_vbox, CombatManager.player_deck_inst.hand_array)

func update_deck():
	_fill(deck_vbox, CombatManager.player_deck_inst.deck_array)
	

func _fill(vbox: VBoxContainer, cards: Array) -> void:
	for c in vbox.get_children():
		c.free()
	for i in cards.size():
		var lbl := Label.new()
		lbl.text = "%d. %s [%s]" % [i, cards[i].card_definition.card_name, cards[i].card_definition.card_id]
		vbox.add_child(lbl)
