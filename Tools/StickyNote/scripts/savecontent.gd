extends Panel

@onready var content = $VBoxContainer/Content/MarkdownEdit/TextEdit.text
@onready var tags = $VBoxContainer/TagsContainer.tags_dict
var filename : String

func _on_save_as_pressed() -> void:
	_save()

func _save():
	print("hello")
	var save_dict = {
		"filename" : filename,
		"content" : content,
		"tags" : tags
	}
	print(save_dict)

func _on_load_pressed() -> void:
	
	pass # Replace with function body.
