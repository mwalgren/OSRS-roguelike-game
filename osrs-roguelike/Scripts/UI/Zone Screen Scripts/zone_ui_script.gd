extends Control


@export var zone_array:Array[zone]
@export var background_container:TextureRect
@export var enemy_preview:HBoxContainer
@export var zone_lbl:Label
@export var zone_lvl_lbl:Label
var _current_zone_index = 0

@export var starter_deck:DefaultDeck

func _ready() -> void:
	set_zone_data(zone_array[_current_zone_index])


func set_zone_data(data):
	for i in enemy_preview.get_children():
		i.queue_free()
	for i in data.zone_enemy_preview:
		var new_texture = TextureRect.new()
		new_texture.texture = i
		new_texture.custom_maximum_size = Vector2(100,100)
		enemy_preview.add_child(new_texture)
	zone_lbl.text = data.zone_name
	zone_lvl_lbl.text = data.zone_level
	background_container.texture = data.zone_main_img


func _on_right_button_pressed() -> void:
	change_zone(1)


func _on_left_button_pressed() -> void:
	change_zone(-1)

func change_zone(step:int) ->void:
	_current_zone_index = clampi(_current_zone_index + step, 0 , zone_array.size()-1)
	set_zone_data(zone_array[_current_zone_index])


func _on_battle_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI/Battle Scene/BattleScene.tscn")
