extends Resource
class_name Enemy

@export var enemy_id:String
@export var enemy_name:String

@export var max_hp:int
@export var base_dmg:int
@export var base_armor:int

@export var enemy_move_pool:Array = []

@export var is_boss:bool
@export var tags:Array[String] = []

@export var enemy_art:Texture
