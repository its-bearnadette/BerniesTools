extends VBoxContainer

@export var item_list = []
@onready var item_entry = $"../../LineEdit"


func _on_line_edit_text_submitted(new_text: String) -> void:
	_add_to_list(new_text)
	item_entry.clear()

func _add_to_list(item:String) -> void:
	item_list.append(item)
	print(item_list)
	_populate()

func _populate() -> void:
	for child in get_children():
		child.queue_free()

	var item_display = load("res://Tools/RollTable/scenes/itemdisplay.tscn")
	var index = 0
	for item in item_list: 
		var instance = item_display.instantiate()
		instance._deleted.connect(self._on_child_deleted)
		instance._changed.connect(self._on_child_text_changed)
		instance.number = int(index)
		instance.text = str(item_list.get(int(index)))
		add_child(instance)
		index = index + 1

func _on_child_text_changed(index, new_text):
	item_list.set(index,new_text)

func _on_child_deleted(index):
	print("signal received", str(index))
	item_list.remove_at(index)
	print(item_list)
	_populate()
