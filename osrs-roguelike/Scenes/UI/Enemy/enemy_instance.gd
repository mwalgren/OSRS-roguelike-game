extends Control
class_name EnemyInstance

var current_hp:int
var current_armor:int
var base_dmg:int
var enemy_name:String
@export var enemy_art:TextureRect
@export var health_bar:ProgressBar


func set_enemy_data(data):
	current_armor = data.base_armor
	current_hp = data.max_hp
	base_dmg = data.base_dmg
	enemy_name = data.enemy_name
	enemy_art.texture = data.enemy_art

func take_damage(value:int):
	var final_dmg = randi_range(0, value)
	print("Goblin set to take : ", final_dmg)
	if current_armor > 0:
		current_hp -= (final_dmg - current_armor)
		update_hp_bar(current_hp)
	else: current_hp -= final_dmg


func update_hp_bar(value):
	health_bar.value = value


func _on_progress_bar_value_changed(value: float) -> void:
	pass # Replace with function body.
