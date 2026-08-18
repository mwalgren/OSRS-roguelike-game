extends Node
class_name gamemngr

var character_state:CharacterState
var player_deck:DeckList
var player_def = preload("res://Resources/Character/test_character.tres")

var current_zone

func start_new_run():
	character_state = CharacterState.new()
	character_state.seed_character_data(player_def)
