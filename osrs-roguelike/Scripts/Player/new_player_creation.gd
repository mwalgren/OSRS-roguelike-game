extends Resource
class_name Character


var player_inventory:Array [InventoryData] = []



@export_category("Skills")
@export var skills:Dictionary = {"Attack": 1, "Strength" : 1, "Ranged" : 1, "Prayer" : 1, "Magic" : 1, "Defense" : 1, "hp":1 }
@export var character_name:String
@export var base_deck:DefaultDeck
