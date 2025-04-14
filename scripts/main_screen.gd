extends TextureRect

# Tools
var notepad = preload("res://Tools/Note/scenes/markdownnote.tscn")
var progressclock = preload("res://Tools/ProgressClock/scenes/clock.tscn")
var rolltable = preload("res://Tools/RollTable/scenes/rolltable.tscn")



func _on_add_note_pressed() -> void:
	var NotepadInstance = notepad.instantiate()
	add_child(NotepadInstance)

func _on_add_clock_pressed() -> void:
	var ClockInstance = progressclock.instantiate()
	add_child(ClockInstance)

func _on_add_rolltable_pressed() -> void:
	var RollTableInstance = rolltable.instantiate()
	add_child(RollTableInstance)

func _on_close_pressed() -> void:
	get_tree().quit()
