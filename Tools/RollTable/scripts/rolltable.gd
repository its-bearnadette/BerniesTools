extends PanelContainer

@onready var list_display = $VBoxContainer/ItemList
@onready var output = $VBoxContainer/Label
@onready var item_entry = $VBoxContainer/LineEdit
var item_list = []
var rng = RandomNumberGenerator.new()

func _add_to_list(item:String) -> void:
	item_list.append(item)
	print(item_list)
	_populate(item)

func _populate(item: String) -> void:
	# get items from list of items, create an hbox container with a label and a delete button in the list_display for each item.
	# connect each button to _remove_from_list().
	pass

func _remove_from_list(item) -> void:
	# get the string of the item (or the name of the hboxcontainer), remove the item from the list, queue_free the container from the display.
	pass

func _roll() -> void:
	# get number of items in list, select a random item. don't forget off-by-ones.
	if item_list.is_empty():
		_print_result("Table has no items!")
	else:
		rng.randomize()
		var number = rng.randi_range(1,item_list.size())
		_print_result(item_list[number-1])

func _print_result(item) -> void:
	print(item)
	output.text = item
	pass

func _on_button_pressed() -> void:
	_roll()
	pass # Replace with function body.


func _on_line_edit_text_submitted(new_text: String) -> void:
	_add_to_list(new_text)
	item_entry.clear()
