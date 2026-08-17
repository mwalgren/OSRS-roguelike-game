extends Node2D


var player_deck_inst:DeckInstance


signal hand_changed(_hand_array)

var current_enemy_target
var player

func _ready() -> void:
	assemble_character(GameManager.character_state)
	

func assemble_character(_character_state):
	player_deck_inst = DeckInstance.new()
	var _decklist = DeckList.new()
	_decklist.build_from_default(_character_state.current_deck)
	player_deck_inst.build_from_decklist(_decklist)


func _on_playable_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("player_card"):
		print("PLAYER CARD ENTERED")


func on_card_played(card):
	print("combat manager received: ", card)
	if card.dmg:
		current_enemy_target.take_damage(card.dmg)
	if card.armor > 0 : 
		player.apply_armor(card.armor)
