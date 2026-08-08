extends Control


func _ready() -> void:
	pass

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI/Zone Screen/Zone_screen.tscn")


func _on_inventory_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI/Inventory/Inventory_interface.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
