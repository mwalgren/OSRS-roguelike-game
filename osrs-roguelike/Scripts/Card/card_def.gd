extends Resource
class_name CardData



#------------------------------------
@export_category("ID's & INFO")
@export var card_id:String
@export var tags:Array
@export var card_name:String
@export var card_descrip:String
@export var rarity:String


#------------------------------------
@export_category("Damage & Effects")
@export var dmg:int = 1
@export var target_type:String


#------------------------------------
@export_category("Cost")
@export var cost:int


#------------------------------------
@export_category("Art")
@export var card_art:Texture
