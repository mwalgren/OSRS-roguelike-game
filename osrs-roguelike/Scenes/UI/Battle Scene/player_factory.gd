extends Node

@export var CombatManager:Node2D
@export var player_spawn_point:Marker2D
@export var player_instance:PackedScene

func _ready() -> void:
	build_character(GameManager.character_state)
	spawn_player()

func build_character(character_state:CharacterState):
	#var decklist = DeckList.new()
	#decklist.build_from_default(character_state.default_deck_list)
	CombatManager.player_deck_inst = DeckInstance.new()
	CombatManager.player_deck_inst.build_from_decklist(character_state.current_deck)


func spawn_player():
	var player = player_instance.instantiate()
	if player:
		add_child(player)
		player.global_position = player_spawn_point.global_position
		CombatManager.player = player
