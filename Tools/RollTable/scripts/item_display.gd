extends HBoxContainer
signal _deleted
signal _changed

@onready var item_list = $"..".item_list

@onready var number_label = $Number
@onready var name_edit = $Name
@onready var delete_button = $Delete

@export var number : int
@export var text : String


func _ready() -> void:
	name_edit.text = text
	number_label.text = str(number+1)

func _on_name_text_changed(new_text: String) -> void:
	emit_signal("_changed",number,new_text)
	pass # Replace with function body.

func _on_delete_pressed() -> void:
	emit_signal("_deleted",number)
