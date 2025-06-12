extends Control

@onready var window: Panel = $".."

var is_moving = false
var is_resizing = false
var dragging_start_position = Vector2()

func _process(delta: float) -> void:
	if is_moving:
		var mouse_position = get_global_mouse_position()
		var window_position = Vector2(DisplayServer.window_get_position())
		window.set_global_position(window_position + (mouse_position - dragging_start_position))

func _resize() -> void:
	window.set_size(get_global_mouse_position())

func _on_title_bar_button_down() -> void:
	is_moving = true
	dragging_start_position = get_local_mouse_position()

func _on_title_bar_button_up() -> void:
	is_moving = false

func _on_title_bar_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.get_button_index() ==1:
			is_moving = !is_moving
			dragging_start_position = get_local_mouse_position()
