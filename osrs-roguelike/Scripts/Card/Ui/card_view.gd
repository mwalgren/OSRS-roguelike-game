extends Control
class_name CardUi

var cost:int
var dmg:int
var armor:int
var card_instance
var target_type
var card_type
var parent:Control
var tween:Tween

@export var art:TextureRect
@export var costlbl:Label
@export var namelbl:Label #debug
@export var statelbl:Label
@onready var targets:Array[Node] = []

@export var card_state_machine:CardStateMachine
@export var drop_point_detector:Area2D
@export var card_state_released:Node

signal reparent_request(card_ui:CardUi)
signal card_played(card)


func _ready() -> void:
	card_state_machine.init(self)
	card_state_released.card_played.connect(_on_release_state_card_played)

func set_card_data(card):
	art.texture = card.card_definition.card_art
	card_instance = card
	cost = card.card_definition.cost
	dmg = card.card_definition.dmg
	armor = card.card_definition.armor
	target_type = card.card_definition.TARGET_TYPE
	card_type = card.card_definition.card_category

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


func _on_release_state_card_played(card):
	card_played.emit(card)
	

func animate_to_position(new_pos:Vector2, duration:float) ->void:
	tween = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "global_position", new_pos, duration)
