extends Panel
@onready var clock = $VBoxContainer/HBoxContainer2/VBoxContainer/CenterContainer/Clock
@onready var clockedit = $VBoxContainer/HBoxContainer2/VBoxContainer/HBoxContainer
@onready var edit_button = $VBoxContainer/HBoxContainer/Edit

func _ready() -> void:
	edit_button.button_pressed = true

func _on_edit_toggled(toggled_on: bool) -> void:
	clockedit.visible = toggled_on
	pass # Replace with function body.

func _on_spin_box_value_changed(value: int) -> void:
	clock._change_max(value)
	pass # Replace with function body.
