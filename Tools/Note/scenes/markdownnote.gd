extends Panel

@onready var text_edit = $VBoxContainer/ScrollContainer/HBoxContainer/MarkdownEdit/TextEdit
var tags = []
func save_note():
	var contents_dict = {
	"type" : "note",
	"tags" : tags,
	"contents" : text_edit.text
	}

func load_note():
	pass
