extends Control

@onready var window: Panel = $".."

#@onready var title_bar: Button = $TitleBar
#@onready var top: Button = $Top
#@onready var bottom: Button = $Bottom
#@onready var left: Button = $Left
#@onready var right: Button = $Right
#@onready var top_left: Button = $TopLeft
#@onready var top_right: Button = $TopRight
#@onready var bottom_left: Button = $BottomLeft
#@onready var bottom_right: Button = $BottomRight

var is_moving = false
var is_resizing = false

func _process(delta: float) -> void:
	if is_moving:
		_move()

func _move() -> void:
# fix this so that the window moves from where you grabbed it rather than snapping to the corner.
# this probably means either finding and mathematically negating the difference between the two, 
# or finding the difference of the mouse's position from its previous position and applying the same transforms to the window.
	window.set_global_position(get_global_mouse_position() - Vector2(size.x/2,36/2)) 

func _resize() -> void:
	window.set_size(get_global_mouse_position())

func _on_title_bar_button_down() -> void:
	is_moving = true

#func _input(e):
	#if e is InputEventMouseButton and e.button_index == MOUSE_BUTTON_LEFT and e.double_click:
		#print("DOUBLE CLICK")
# make double clicking the title bar maximize it.

func _on_title_bar_button_up() -> void:
	is_moving = false
