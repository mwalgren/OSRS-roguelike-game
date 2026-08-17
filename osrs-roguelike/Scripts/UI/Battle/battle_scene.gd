extends Control


@export var CombatMngr:Node2D
@export var enemy_spawn_point:Marker2D
@export var player_spawn_point:Marker2D
@export var enemy_factory:Node

@export var deck_vbox:VBoxContainer  #debug
@export var hand_vbox:VBoxContainer #debug

@export var hand_container:PackedScene #debug

@export var enemy_instance:PackedScene
@export var player_instance:PackedScene



func _ready() -> void:
		spawn_player()
		spawn_enemy()


func _on_button_pressed() -> void:
	CombatMngr.draw_card(1)

func spawn_player():
	var player = player_instance.instantiate()
	if player:
		add_child(player)
		player.global_position = player_spawn_point.global_position
		CombatMngr.player = player

func spawn_enemy():
	var enemy_data = enemy_factory.spawn_encounter()
	if enemy_data:
		var enemy_inst = enemy_instance.instantiate()
		enemy_inst.set_enemy_data(enemy_data)
		add_child(enemy_inst)
		enemy_inst.global_position = enemy_spawn_point.global_position
		CombatMngr.current_enemy_target = enemy_inst
