extends TextureProgressBar

var tick_count = max_value
@export var radius = 62
@onready var label = $Label
@onready var spinbox = $"../../HBoxContainer/SpinBox"
var has_mouse = false

func _ready() -> void:
	max_value = tick_count
	value = 0
	#spinbox.value = max_value

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("scroll_up") and Input.is_action_pressed("ctrl") and has_mouse:
		_change_value(1)
	if Input.is_action_just_pressed("scroll_down") and Input.is_action_pressed("ctrl") and has_mouse:
		_change_value(-1)

func _draw() -> void:
	label.text = str(int(value),"/",int(max_value))
	var partition_angle = 360 / tick_count
	if tick_count == 7:
		partition_angle = 51.5

	var center = Vector2(position.x+(size.x/2),position.y+(size.y/2))
	center = Vector2(64,64)
	var endpoint = center+Vector2(0,-radius)
	for tick in tick_count:
		draw_line(center,endpoint,Color.BLACK,.5,true)
		endpoint = rotate_around_point(endpoint,center,deg_to_rad(partition_angle))

func rotate_around_point(vec: Vector2, center: Vector2, angle:float) -> Vector2:
	var diff:Vector2 = vec - center
	diff = diff.rotated(angle)
	diff += center
	return diff

func _change_value(addend) -> void:
	if value + addend > max_value:
		pass
	elif value + addend < min_value:
		value = 0
		$AudioStreamPlayer.play()
	else:
		value = value + addend
		$AudioStreamPlayer.play()

func _change_max(max_val:int) -> void:
	if max_val <= 8 and max_val >= 2:
		max_value = max_val
		tick_count = max_val

func _on_mouse_entered() -> void:
	has_mouse = true
	pass # Replace with function body.

func _on_mouse_exited() -> void:
	has_mouse = false
	pass # Replace with function body.

func _on_button_pressed() -> void:
	if Input.is_action_pressed("alt"):
		_change_value(-8)
	else:
		_change_value(1)
	pass # Replace with function body.
