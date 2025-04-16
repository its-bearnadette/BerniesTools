extends TextEdit

func _process(delta: float) -> void:
	if has_focus():
		if Input.is_action_just_pressed("bold"):
			_bold()
		if Input.is_action_just_pressed("italic"):
			_italicize()
		if Input.is_action_just_pressed("monospace"):
			_monospace()
		if Input.is_action_just_pressed("header"):
			_header()

func _bold():
	# check for a selection, insert ** ** at beginning and end of selection. if no selection, insert **** and place the caret in the middle.
	if has_selection():
		insert_text("**",get_selection_origin_line(),get_selection_origin_column())
		insert_text("**",get_caret_line(),get_caret_column())
	else:
		insert_text_at_caret("****")
		set_caret_column(get_caret_column()-2)

func _italicize():
	if has_selection():
		insert_text("*",get_selection_origin_line(),get_selection_origin_column())
		insert_text("*",get_caret_line(),get_caret_column())
	else:
		insert_text_at_caret("**")
		set_caret_column(get_caret_column()-1)

func _monospace():
	if has_selection():
		insert_text("`",get_selection_origin_line(),get_selection_origin_column())
		insert_text("`",get_caret_line(),get_caret_column())
	else:
		insert_text_at_caret("``")
		set_caret_column(get_caret_column()-1)

func _header():
	insert_text("#",get_caret_line(),0)
