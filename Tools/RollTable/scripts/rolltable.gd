extends PanelContainer

@onready var list_display = $VBoxContainer/ScrollContainer/ListDisplay
@onready var output = $VBoxContainer/Label
@onready var item_entry = $VBoxContainer/LineEdit
@onready var item_list = $VBoxContainer/ScrollContainer/ListDisplay.item_list
var rng = RandomNumberGenerator.new()



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


func _on_show_hide_toggled(toggled_on: bool) -> void:
	if toggled_on:
		item_entry.visible = true
		list_display.visible = true
	else:
		item_entry.visible = false
		list_display.visible = false
	pass # Replace with function body.
