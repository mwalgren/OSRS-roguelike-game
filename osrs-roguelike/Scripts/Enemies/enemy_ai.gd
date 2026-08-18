extends Node

var move_pool:Array = []
var intent

signal enemy_intent(intent)


func set_intent():
	var enemy_move = move_pool.pick_random()
	intent = enemy_move
	enemy_intent.emit(enemy_move)
