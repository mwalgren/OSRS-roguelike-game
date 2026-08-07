extends Control

signal pressed

@export var button_text: String = "PLAY"

@onready var button: TextureButton = $Button
@onready var text_label: Label = $Button/Text

var animation_tween: Tween


func _ready() -> void:
	text_label.text = button_text

	# Text should never block the button.
	text_label.mouse_filter = Control.MOUSE_FILTER_IGNORE

	# Actual clickable button.
	button.mouse_filter = Control.MOUSE_FILTER_STOP
	button.disabled = false

	# Removes keyboard-focus outline.
	button.focus_mode = Control.FOCUS_NONE

	# Scale animation comes from center.
	pivot_offset = size / 2.0

	button.mouse_entered.connect(_on_mouse_entered)
	button.mouse_exited.connect(_on_mouse_exited)
	button.button_down.connect(_on_button_down)
	button.button_up.connect(_on_button_up)
	button.pressed.connect(_on_button_pressed)


func _on_mouse_entered() -> void:
	animate_button(
		Vector2(1.03, 1.03),
		Color(1.08, 1.08, 1.02, 1.0)
	)


func _on_mouse_exited() -> void:
	animate_button(
		Vector2.ONE,
		Color.WHITE
	)


func _on_button_down() -> void:
	animate_button(
		Vector2(0.97, 0.97),
		Color(0.82, 0.82, 0.82, 1.0)
	)


func _on_button_up() -> void:
	animate_button(
		Vector2(1.03, 1.03),
		Color(1.08, 1.08, 1.02, 1.0)
	)


func _on_button_pressed() -> void:
	print(button_text + " CLICKED")
	pressed.emit()


func animate_button(
	target_scale: Vector2,
	target_color: Color
) -> void:
	if animation_tween:
		animation_tween.kill()

	animation_tween = create_tween()
	animation_tween.set_parallel(true)

	animation_tween.tween_property(
		self,
		"scale",
		target_scale,
		0.08
	)

	animation_tween.tween_property(
		self,
		"modulate",
		target_color,
		0.08
	)
