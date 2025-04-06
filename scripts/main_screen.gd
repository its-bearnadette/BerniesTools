extends TextureRect



# Tools


var notepad = preload("res://Tools/Note/scenes/markdownnote.tscn")
var progressclock = preload("res://Tools/ProgressClock/scenes/clock.tscn")




func _on_add_note_pressed() -> void:
	var NotepadInstance = notepad.instantiate()
	add_child(NotepadInstance)
	pass # Replace with function body.

func _on_add_clock_pressed() -> void:
	var ClockInstance = progressclock.instantiate()
	add_child(ClockInstance)
	print("hello")
	pass # Replace with function body.

func _on_close_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
