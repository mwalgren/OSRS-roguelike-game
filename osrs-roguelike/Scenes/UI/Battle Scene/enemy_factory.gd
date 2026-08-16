extends Node

@export var enemy_instance_array:Array = []



func spawn_encounter() ->Resource:
	if enemy_instance_array.size() > 0:
		var enemy_to_spawn = enemy_instance_array.pop_front()
		return enemy_to_spawn
	else: return null
