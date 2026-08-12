extends Control


@export var CombatMngr:Node2D
@export var enemy_spawn_point:Marker2D
@export var player_spawn_point:Marker2D

@export var vbox:VBoxContainer  #debug
@export var hand_container:PackedScene #debug


func _ready() -> void:
	pass

func populate_deck_debugger(deck_inst): #debug
	for i in deck_inst.deck_array:
		var lbl = Label.new()
		lbl.text = str(i.card_definition.card_name)
		vbox.add_child(lbl)


func _on_button_pressed() -> void:
	CombatMngr.player_deck_inst.draw(1)
	CombatMngr.hand_changed.emit(CombatMngr.player_deck_inst.hand_array)
