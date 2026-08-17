extends Node

@export var enemy_instance_array:Array = []

var current_enemy

func _ready() -> void:
	update_enemies_per_zone()

func spawn_encounter() ->Resource:
	if enemy_instance_array.size() > 0:
		var enemy_to_spawn = enemy_instance_array.pop_front()
		return enemy_to_spawn
	else: return null


func update_enemies_per_zone():
	enemy_instance_array.clear()
	for i in GameManager.current_zone.zone_enemies:
		enemy_instance_array.append(i)
