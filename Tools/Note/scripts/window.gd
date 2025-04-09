extends Window

var current = false

func check_saved():
	current = true
	pass

func prompt_save():
	pass

func _on_close_requested() -> void:
	# check for a difference between the current version and the one saved on file. prompt save.
	check_saved()
	if current:
		queue_free()
	else:
		prompt_save()
