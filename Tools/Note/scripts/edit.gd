extends Button
func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		text = "Editing Enabled"
	else:
		text = "Editing Disabled"
	pass # Replace with function body.
