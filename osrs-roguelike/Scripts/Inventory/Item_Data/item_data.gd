extends Resource
class_name ItemData

@export_enum("HEAD", "BODY", "FEET", "LEGS", "WEAPON", "OTHER") var TYPE

@export var name:String = ''
@export_multiline var description:String = ''
@export var stackable:bool = false
@export var texture:AtlasTexture
