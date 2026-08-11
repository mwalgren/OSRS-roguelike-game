extends Resource
class_name Character


var player_inventory:Array [InventoryData] = []



@export_category("Skills")
@export var attack_level:int = 1 
@export var strength_level:int = 1 
@export var magic_level:int = 1 
@export var prayer_level:int = 1 
@export var ranged_level:int = 1 
@export var defense_level:int = 1

@export var character_name:String

@export var base_deck:Dictionary
