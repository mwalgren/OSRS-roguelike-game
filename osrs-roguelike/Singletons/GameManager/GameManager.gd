extends Node
class_name gamemngr

var character_state:CharacterState
var player_deck:DeckList
var player_def = preload("res://Resources/Character/test_character.tres")

func start_new_run():
	character_state = CharacterState.new()
	character_state.seed_character_data(player_def)
	print("Character State", character_state)
	print("Runtime Character Deck", character_state.current_deck)
	
	print("Deck :" , character_state.current_deck,  "Lvls :", character_state.skills)
