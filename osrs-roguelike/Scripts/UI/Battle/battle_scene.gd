extends Control


@export var CombatMngr:Node2D
@export var enemy_spawn_point:Marker2D
@export var player_spawn_point:Marker2D
@export var enemy_factory:Node

@export var vbox:VBoxContainer  #debug
@export var hand_container:PackedScene #debug
@export var enemy_instance:PackedScene

func _ready() -> void:
		var enemy_data = enemy_factory.spawn_encounter()
		if enemy_data:
			var enemy_inst = enemy_instance.instantiate()
			enemy_inst.set_enemy_data(enemy_data)
			add_child(enemy_inst)
			enemy_inst.global_position = enemy_spawn_point.global_position


func _on_button_pressed() -> void:
	CombatMngr.player_deck_inst.draw(1)
	CombatMngr.hand_changed.emit(CombatMngr.player_deck_inst.hand_array)
