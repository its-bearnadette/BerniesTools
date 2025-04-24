extends LineEdit

signal tag_changed
signal tag_deleted

@export var uid : String
@export var tag_name : String

func _ready() -> void:
	#tag_id = generate an identifier. make sure it's globally available to search for.
	text = tag_name

func _on_text_changed(new_text: String) -> void:
	emit_signal("tag_changed",uid,new_text)


func _on_delete_button_pressed() -> void:
	emit_signal("tag_deleted",uid)
