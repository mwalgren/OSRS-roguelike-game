extends Node2D

const ARC_POINTS := 8
@export var area2d:Area2D
@export var card_arc:Line2D

var current_card:CardUi
var targeting := false


func _ready() -> void:
	Event.card_aim_started.connect(_on_card_aim_started)
	Event.card_aim_ended.connect(_on_card_aim_ended)

func _process(delta: float) -> void:
	if not targeting:
		return
	
	area2d.position = get_local_mouse_position()
	card_arc.points = _get_points()

func _get_points() -> Array:
	var points := []
	var start := current_card.global_position
	start.x += (current_card.size.x / 2)
	var target := get_local_mouse_position()
	var distance := (target - start)
	
	for i in range(ARC_POINTS):
		var t := (1.0 / ARC_POINTS) * i
		var x := start.x + (distance.x / ARC_POINTS) * i
		var y = start.y + ease_out_cubic(t) * distance.y 
		points.append(Vector2(x,y))
	
	points.append(target)
	return points

func ease_out_cubic(n:float) -> float:
	return 1.0 - pow(1.0 - n, 3.0)

func _on_card_aim_started(card:CardUi)-> void:
	if not card.card_instance.card_definition.is_single_target():
		return
	
	targeting = true
	area2d.monitoring = true
	area2d.monitorable = true
	current_card = card

func _on_card_aim_ended(_card:CardUi) ->void:
	targeting = false
	card_arc.clear_points()
	area2d.position = Vector2.ZERO
	area2d.monitorable = false
	area2d.monitoring = false
	current_card = null


func _on_area_2d_area_entered(area: Area2D) -> void:
	if not current_card or not targeting:
		return
	if not current_card.targets.has(area):
		current_card.targets.append(area)


func _on_area_2d_area_exited(area: Area2D) -> void:
	if not current_card or not targeting:
		return
	current_card.targets.erase(area)
