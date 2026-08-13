extends Control
class_name CardUi

var cost:int
var dmg:int
var armor:int

@export var art:Sprite2D
@export var costlbl:Label
@export var namelbl:Label #debug
@export var statelbl:Label
@onready var targets:Array[Node] = []

@export var card_state_machine:CardStateMachine
@export var drop_point_detector:Area2D

signal reparent_request(card_ui:CardUi)

func _ready() -> void:
	add_to_group("player_card")
	card_state_machine.init(self)


func set_card_data(card):
	cost = card.card_definition.cost
	dmg = card.card_definition.dmg
	armor = card.card_definition.armor

func set_card_lbls(card):
	costlbl.text = str(card.card_definition.cost)
	namelbl.text = card.card_definition.card_name

func _input(event:InputEvent) ->void:
	card_state_machine.on_input(event)

func _on_gui_input(event:InputEvent) ->void:
	card_state_machine.on_gui_input(event)

func _on_mouse_entered() ->void:
	card_state_machine.on_mouse_entered()

func _on_mouse_exited() ->void:
	card_state_machine.on_mouse_exited()


func _on_droppointdetect_area_entered(area: Area2D) -> void:
	if not targets.has(area):
		targets.append(area)

func _on_droppointdetect_area_exited(area: Area2D) -> void:
	targets.erase(area)
