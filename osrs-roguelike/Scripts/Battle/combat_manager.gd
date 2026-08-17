extends Node2D


var player_deck_inst:DeckInstance

@export var hand_ui:Control

var current_enemy_target
var player

func _ready() -> void:
	build_character(GameManager.character_state)
	

func build_character(character_state:CharacterState):
	player_deck_inst = DeckInstance.new()
	player_deck_inst.build_from_decklist(character_state.current_deck)
	player_deck_inst.hand_changed.connect(hand_ui._on_combat_manager_hand_changed)
	

func _on_playable_area_area_entered(area: Area2D) -> void:
	pass


func on_card_played(card):
	player_deck_inst.play_from_hand(card)
	if card.dmg:
		current_enemy_target.take_damage(card.dmg)
	if card.armor > 0 : 
		player.apply_armor(card.armor)


func draw_card(n:int = 1):
	player_deck_inst.draw(n)
