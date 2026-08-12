extends Control

var cost:int
var dmg:int
var armor:int

@export var art:Sprite2D
@export var costlbl:Label
@export var namelbl:Label #debug

func _ready() -> void:
	add_to_group("player_card")

func set_card_data(card):
	cost = card.card_definition.cost
	dmg = card.card_definition.dmg
	armor = card.card_definition.armor

func set_card_lbls(card):
	costlbl.text = str(card.card_definition.cost)
	namelbl.text = card.card_definition.card_name

func _physics_process(delta: float) -> void:
	pass
