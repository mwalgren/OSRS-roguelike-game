extends Node2D


var player_deck_inst:DeckInstance

signal hand_changed(_hand_array)


func _ready() -> void:
	assemble_character(GameManager.character_state)
	player_deck_inst.draw(5)
	hand_changed.emit(player_deck_inst.hand_array)
	print("player hand array: ", player_deck_inst.hand_array)


func assemble_character(_character_state):
	player_deck_inst = DeckInstance.new()
	var _decklist = DeckList.new()
	_decklist.build_from_default(_character_state.current_deck)
	player_deck_inst.build_from_decklist(_decklist)
