extends SpinBox

var has_mouse = false

func _process(delta: float) -> void:
# Scrollwheel controls without focus.
	if has_mouse and Input.is_action_pressed("ctrl") and Input.is_action_just_pressed("scroll_up"):
		value = value+1

	if has_mouse and Input.is_action_pressed("ctrl") and Input.is_action_just_pressed("scroll_down"):
		value = value-1

func _on_mouse_entered() -> void:
	has_mouse = true

func _on_mouse_exited() -> void:
	has_mouse = false


func _on_edit_toggled(toggled_on: bool) -> void:
	visible = toggled_on
	pass # Replace with function body.
