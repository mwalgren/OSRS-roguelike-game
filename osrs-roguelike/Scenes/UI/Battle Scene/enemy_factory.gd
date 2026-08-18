extends Node

@export var enemy_instance_array:Array = []
@export var enemy_spawn_point:Marker2D
@export var CombatManager:Node2D
@export var enemy_instance:PackedScene

var current_enemy

func _ready() -> void:
	update_enemies_per_zone()
	spawn_enemy()

func spawn_encounter() ->Resource:
	if enemy_instance_array.size() > 0:
		var enemy_to_spawn = enemy_instance_array.pop_front()
		return enemy_to_spawn
	else: return null


func update_enemies_per_zone():
	enemy_instance_array.clear()
	for i in GameManager.current_zone.zone_enemies:
		enemy_instance_array.append(i)


func spawn_enemy():
	var enemy_data = spawn_encounter()
	if enemy_data:
		var enemy_inst = enemy_instance.instantiate()
		enemy_inst.set_enemy_data(enemy_data)
		add_child(enemy_inst)
		enemy_inst.global_position = enemy_spawn_point.global_position
		CombatManager.current_enemy_target = enemy_inst
