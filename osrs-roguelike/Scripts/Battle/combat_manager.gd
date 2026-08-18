extends Node2D


var player_deck_inst:DeckInstance

@export var hand_ui:Control

var current_enemy_target
var player



func _ready() -> void:
	player_deck_inst.hand_changed.connect(hand_ui._on_combat_manager_hand_changed)


func on_card_played(card):
	player_deck_inst.play_from_hand(card)
	if card.dmg:
		current_enemy_target.take_damage(card.dmg)
	if card.armor > 0 : 
		player.apply_armor(card.armor)


func draw_card(n:int = 1):
	player_deck_inst.draw(n)
