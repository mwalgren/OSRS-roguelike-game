extends CardState


const MOUSE_Y_SNAPBACK_THRESHOLD:= 138


func enter():
	card_ui.statelbl.text = "AIMING"
	card_ui.targets.clear()
	var offset := Vector2(card_ui.parent.size.x / 2, -card_ui.size.y /2)
	offset.x -= card_ui.size.x /2
	card_ui.animate_to_position(card_ui.parent.global_position + offset, 0.2)
	card_ui.drop_point_detector.monitoring = false
	Event.card_aim_started.emit(card_ui)


func exit() ->void:
	Event.card_aim_ended.emit(card_ui)


func on_input(_event: InputEvent) ->void:
	var mouse_motion := _event is InputEventMouseMotion
	var mouse_at_bottom := card_ui.get_global_mouse_position().y > MOUSE_Y_SNAPBACK_THRESHOLD
	
	if _event.is_action_pressed("mouse_right"):
		transition_requested.emit(self, CardState.State.BASE)
		
		#Original version (must fix the threshold ratio to the screen)
	#if (mouse_motion and mouse_at_bottom) or _event.is_action_pressed("mouse_right"):
		#transition_requested.emit(self, CardState.State.BASE)
		
	elif _event.is_action_released("mouse_left"):
		get_viewport().set_input_as_handled()
		transition_requested.emit(self, CardState.State.RELEASED)
