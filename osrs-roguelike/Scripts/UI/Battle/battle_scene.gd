extends Control


@export var CombatManager:Node2D

@export var deck_vbox:VBoxContainer  #debug
@export var hand_vbox:VBoxContainer #debug

@export var hand_container:PackedScene #debug



func _ready() -> void:
	pass


func _on_button_pressed() -> void:
	CombatManager.draw_card(1)
