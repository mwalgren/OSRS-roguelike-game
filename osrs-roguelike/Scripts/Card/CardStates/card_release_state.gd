extends CardState

var played:bool

signal card_released
signal card_played(card)

func enter() ->void:
	card_ui.statelbl.text = "RELEASED"
	played = false
	if not card_ui.targets.is_empty():
		played = true
		print("played card for target", card_ui.targets)
	card_released.emit()
	card_played.emit(card_ui.card_instance)

func on_input(_even:InputEvent):
	if played:
		return

	transition_requested.emit(self, CardState.State.BASE)
