extends ScrollContainer

var tags_dict = {}
@onready var tag_entry = $HBoxContainer/tag_entry

func _ready() -> void:
	
	pass

func _load() -> void:
	# check for tags with the same id in file and in main file
	# if a discrepancy in name exists for a tag with the same id, alert the user.
	# option 1: rename tag in file to the tag from the main file.
	# option 2: rename tag in main file to match tag in file.
	# option 3: keep both tags, change id of tag in file.
	pass

func _on_tag_text_submitted(new_text: String) -> void:
	# this isn't working at all lol.
	if new_text in tags_dict.values():
		print("already in tags")
		pass
	elif new_text in global.tags_dict.values():
		var tag = load("res://Tools/StickyNote/scenes/tag.tscn")
		var instance = tag.instantiate()
		var uid = global.tags_dict.find_key(new_text)
		instance.uid = uid
		instance.tag_name = new_text
		instance.connect("tag_changed",_on_tag_name_changed)
		instance.connect("tag_deleted",_on_tag_deleted)
		tags_dict[instance.uid] = str(instance.tag_name)
		print("tag added ", uid," : ", new_text)
		$HBoxContainer.add_child(instance)
		tag_entry.clear()
	else:
		var tag = load("res://Tools/StickyNote/scenes/tag.tscn")
		var instance = tag.instantiate()
		var uid = global.sqids.encode([global.tags_dict.size()+1,randi_range(0,9),randi_range(0,9)])
		instance.uid = uid
		instance.tag_name = new_text
		instance.connect("tag_changed",_on_tag_name_changed)
		tags_dict[instance.uid] = str(instance.tag_name)
		global.tags_dict[instance.uid] = str(instance.tag_name)
		print("tag created ", uid," : ", new_text)
		$HBoxContainer.add_child(instance)
		tag_entry.clear()


func _on_tag_name_changed(uid: String, text: String) -> void:
	tags_dict.set(uid,text)
	global.tags_dict.set(uid,text)
	print(global.tags_dict)
	pass

func _on_tag_deleted(uid: String) -> void:
	print("test")
	tags_dict.erase(uid)
	global.tags_dict.erase(uid)
	print(uid," : ", global.tags_dict.get(uid)," deleted.")
	pass
