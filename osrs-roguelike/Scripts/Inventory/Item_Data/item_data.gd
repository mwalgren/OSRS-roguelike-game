extends Resource
class_name ItemData

enum TYPE {NONE, HEAD, BODY, LEGS, WEAPON, FOOD, NECKLACE, RING, BOOTS}
@export var item_type:TYPE = TYPE.NONE

@export var name:String = ''
@export_multiline var description:String = ''
@export var stackable:bool = false
@export var texture:AtlasTexture
