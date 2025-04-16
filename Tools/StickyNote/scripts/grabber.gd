extends ColorRect

var has_mouse = false

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if has_mouse:
				pass

func _on_mouse_entered() -> void:
	has_mouse = true
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	has_mouse = false
	pass # Replace with function body.
