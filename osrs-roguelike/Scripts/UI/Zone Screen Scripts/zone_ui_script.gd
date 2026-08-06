extends Control

var example = preload("res://Resources/Zones/desert.tres")
@export var background_container:TextureRect
@export var enemy_preview:HBoxContainer
@export var zone_lbl:Label
@export var zone_lvl_lbl:Label

func _ready() -> void:
	set_zone_data(example)


func set_zone_data(data):
	for i in data.zone_enemy_preview:
		var new_texture = TextureRect.new()
		new_texture.texture = i
		new_texture.custom_maximum_size.x = 100
		new_texture.custom_maximum_size.y = 100
		enemy_preview.add_child(new_texture)
		zone_lbl.text = data.zone_name
		zone_lvl_lbl.text = data.zone_level
		background_container.texture = data.zone_main_img
