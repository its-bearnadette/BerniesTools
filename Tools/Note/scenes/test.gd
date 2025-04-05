extends PanelContainer

@onready var edit = $TextEdit
@onready var label = $MarkdownLabel

func _on_button_toggled(toggled_on: bool) -> void:
	edit.visible = toggled_on
	label.visible = !toggled_on

func _on_text_edit_text_changed() -> void:
	label.markdown_text = edit.text
