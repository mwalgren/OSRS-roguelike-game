extends Control


@export var CombatMngr:Node2D
@export var enemy_spawn_point:Marker2D
@export var player_spawn_point:Marker2D

#temporary
@export var vbox:VBoxContainer  #debug

func _ready() -> void:
	assemble_character(GameManager.character_state)

func assemble_character(_character_state):
	var _deck_inst:DeckInstance = DeckInstance.new()
	var _decklist = DeckList.new()
	_decklist.build_from_default(_character_state.current_deck)
	_deck_inst.build_from_decklist(_decklist)
	
	populate_deck_debugger(_deck_inst) #debug


func populate_deck_debugger(deck_inst): #debug
	for i in deck_inst.deck_array:
		var lbl = Label.new()
		lbl.text = str(i.card_definition.card_name)
		vbox.add_child(lbl)
