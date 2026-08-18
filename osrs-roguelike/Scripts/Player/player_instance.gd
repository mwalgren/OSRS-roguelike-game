extends Control
class_name PlayerUI

var current_hp:int
var current_armor:int
@export var health_bar:ProgressBar
@export var player_art:TextureRect
@export var armor_lbl:Label

func _ready() -> void:
	health_bar.max_value = current_hp
	health_bar.value = current_hp

func set_stats(character):
	current_armor = character.armor
	current_hp = character.hp

func take_damage(value):
	var final_dmg = randi_range(0, value)
	if current_armor > 0:
		current_hp -= (final_dmg - current_armor)
	else: current_hp -= final_dmg

	set_health(current_hp)
	print(current_hp)


func set_health(new_value):
	var tween:Tween = create_tween()
	
	tween.tween_property(health_bar, "value", new_value, 0.3) \
	.set_trans(Tween.TRANS_CUBIC) \
	.set_ease(Tween.EASE_OUT)

func apply_armor(value):
	current_armor += value
	armor_lbl.text = str(current_armor)
