extends Resource
class_name Enemy

@export var max_hp:int
@export var base_dmg:int
@export var base_armor:int
@export var drop_table:Array[ItemData] = []
@export var enemy_id:String
@export var enemy_name:String
@export var is_boss:bool
@export var tags:Array[String] = []
@export var enemy_art:Texture
