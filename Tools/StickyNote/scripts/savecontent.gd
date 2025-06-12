extends Panel

@onready var Menu = $VBoxContainer/TopBar/HBoxContainer/MenuButton
@onready var MenuPopup = Menu.get_popup()
@export var filename : String
@onready var content = $VBoxContainer/Content/MarkdownEdit/TextEdit.text
@onready var tags = $VBoxContainer/TagsContainer.tags_dict

func _ready() -> void:
	MenuPopup.connect("id_pressed",_on_menu_button_pressed)

func _on_menu_button_pressed(id:int):
	if id == 0:
		print("pressed save")
		_on_save_pressed()
	if id == 1:
		print("pressed load")
		_on_load_pressed()
	pass

func _on_save_pressed() -> void:
	var save_dict = {
	"filename" : filename,
	"content" : content,
	"tags" : tags
	}
	$FileDialog.file_mode = 4
	$FileDialog.visible = true

func _on_load_pressed() -> void:
	$FileDialog.file_mode = 0
	$FileDialog.visible = true
