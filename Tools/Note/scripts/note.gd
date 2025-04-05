extends Panel

@onready var TitleEdit = $VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/TitleEdit
@onready var BodyEdit = $VBoxContainer/ScrollContainer/HBoxContainer/VBoxContainer/BodyEdit
var tags : Array
var title : String
var body : String

# when AddTag is pressed, create a line edit, expand_to_text_length true and connect the signal text_submitted().
# when text_submitted(), make the text lowercase, make it uneditable, remove all breakout characters add to the tag array. add a [x] button to delete the tag.

func _on_title_text_changed() -> void:
	title = TitleEdit.text

func _on_body_edit_text_changed() -> void:
	body = BodyEdit.text

# when Save is pressed, create a JSON containing the type (note), tags, title text, and body contents.
# when Load is pressed, open a dialogue, find all JSONs of the type note, and load.
