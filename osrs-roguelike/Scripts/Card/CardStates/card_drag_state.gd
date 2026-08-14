extends CardState

const DRAG_MINIMUM:= 0.05
var min_drag_time_lapsed := false


func enter() ->void:
	var ui_layer := get_tree().get_first_node_in_group("ui_layer")
	if ui_layer:
		card_ui.reparent(ui_layer)
		
	card_ui.statelbl.text = "DRAGGING"
	min_drag_time_lapsed = false
	var thresh_timer := get_tree().create_timer(DRAG_MINIMUM, false)
	thresh_timer.timeout.connect(func():min_drag_time_lapsed = true)


func on_input(event:InputEvent) ->void:
	var mouse_motion = event is InputEventMouseMotion
	var cancel = event.is_action_pressed("mouse_right")
	var confirm = event.is_action_released("mouse_left") or event.is_action_pressed("mouse_left")
	
	if mouse_motion:
		card_ui.global_position = card_ui.get_global_mouse_position() - card_ui.pivot_offset
		
	if cancel:
		transition_requested.emit(self, CardState.State.BASE)
			
	elif min_drag_time_lapsed and confirm:
		get_viewport().set_input_as_handled()
		transition_requested.emit(self, CardState.State.RELEASED)
