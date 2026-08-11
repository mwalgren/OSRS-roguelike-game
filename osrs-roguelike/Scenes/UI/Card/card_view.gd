extends Node2D

var cost
var dmg
var armor


func set_card_data(card):
	cost = card.cost
	dmg = card.dmg
	armor = card.armor


func _physics_process(delta: float) -> void:
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
