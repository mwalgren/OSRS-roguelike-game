extends Control
class_name EnemyInstance

var current_hp:int
var current_armor:int
var base_dmg:int
var enemy_name:String

@export var enemy_art:TextureRect
@export var health_bar:ProgressBar
@export var enemyAI:Node
@export var intent_art:TextureRect

func _ready() -> void:
	enemyAI.enemy_intent.connect(set_intent)


func set_enemy_data(data):
	current_armor = data.base_armor
	current_hp = data.max_hp
	base_dmg = data.base_dmg
	enemy_name = data.enemy_name
	enemy_art.texture = data.enemy_art
	health_bar.max_value = current_hp
	health_bar.value = current_hp
	for i in data.move_pool:
		enemyAI.move_pool.append(i)

func take_damage(value:int):
	var final_dmg = randi_range(0, value)
	if current_armor > 0:
		current_hp -= (final_dmg - current_armor)
	else: current_hp -= final_dmg

	set_health(current_hp)


func set_health(new_value):
	var tween:Tween = create_tween()
	
	tween.tween_property(health_bar, "value", new_value, 0.3) \
	.set_trans(Tween.TRANS_CUBIC) \
	.set_ease(Tween.EASE_OUT)


func set_intent(intent):
	intent_art.texture = intent.intent_art
