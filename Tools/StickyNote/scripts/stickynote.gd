extends PanelContainer

@onready var edit = $TextEdit
@onready var label = $MarkdownLabel
var has_mouse = true

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if !has_mouse: _release_focus()

func _grab_focus():
	label.visible = false
	edit.visible = true
	edit.grab_focus()

func _release_focus():
	edit.visible = false
	label.visible = true
	propagate_call("release_focus")

func _on_text_edit_text_changed() -> void:
	label.markdown_text = edit.text
func _on_text_edit_focus_exited() -> void:
	_release_focus()
func _on_markdown_label_focus_entered() -> void:
	_grab_focus()

func _on_control_mouse_entered() -> void:
	has_mouse = true
func _on_control_mouse_exited() -> void:
	has_mouse = false
