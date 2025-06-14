extends Node3D

@onready var pawn = $".."
@onready var camera: Camera3D = $CameraZoom/Camera3D
@onready var new_rotation = 0
@onready var new_pitch = -30
@onready var zoom_target = $CameraZoom
@onready var new_zoom = 50
@onready var camera_target = $CameraTarget
@onready var zoom_slider: VSlider = $CanvasLayer2/Control/HBoxContainer/VSlider

var is_rotating = false
var camera_locked_to_pawn = true

func _ready() -> void:
	_recenter()

func _physics_process(delta: float) -> void:
# camera position and rotation
	if int(camera_target.global_position.x) == int(global_position.x) and int(camera_target.global_position.z) == int(global_position.z):
		camera_locked_to_pawn = true

	if camera_locked_to_pawn:
		camera_target.global_position = Vector3(pawn.global_position.x,.1,pawn.global_position.z)
		camera_target.visible = false
	else:
		camera_target.visible = true

	global_position = lerp(global_position,camera_target.global_position,.1)
	global_rotation.y = lerp_angle(global_rotation.y, new_rotation, .1)
	if snappedi(global_rotation.y,45) == snappedi(new_rotation,45):
		is_rotating = false
	if Input.is_action_just_pressed("bm_west"):
		if !is_rotating:
			is_rotating = true
			new_rotation = deg_to_rad(snappedi(global_rotation_degrees.y - 45,45))
		else:
			pass

	if Input.is_action_just_pressed("bm_east"):
		if !is_rotating:
			is_rotating = true
			new_rotation = deg_to_rad(snappedi(global_rotation_degrees.y + 45, 45))
		else:
			pass

# camera pitch
	rotation.x = lerp_angle(rotation.x, deg_to_rad(new_pitch),.1)
	if Input.is_action_just_pressed("bm_south"):
		if rotation_degrees.x + 10 > -15:
			new_pitch = -15
		else:
			new_pitch += 15

	if Input.is_action_just_pressed("bm_north"):
		if rotation_degrees.x - 10 < -75:
			new_pitch = -75
		else:
			new_pitch -= 15

	if Input.is_action_just_pressed("bm_recenter"):
		_recenter()

# camera zoom
	camera.position.z = lerp(camera.position.z,zoom_target.position.z,.1)
	zoom_target.position.z = new_zoom

	if Input.is_action_just_pressed("bm_zoom_in"):
		if new_zoom <= 10:
			#new_zoom = 10
			zoom_slider.value = 40
		else:
			#new_zoom -= 10
			zoom_slider.value += 10
	if Input.is_action_just_pressed("bm_zoom_out"):
		if new_zoom >= 60:
			#new_zoom = 60
			zoom_slider.value = 10
		else:
			#new_zoom += 10
			zoom_slider.value -=10

func _recenter():
		camera_locked_to_pawn = true
		new_pitch = -30
		new_rotation = deg_to_rad(180)
		new_zoom = 50

func _on_l_button_pressed() -> void:
		if !is_rotating:
			is_rotating = true
			new_rotation = deg_to_rad(snappedi(global_rotation_degrees.y - 45,45))
		else:
			pass

func _on_r_button_pressed() -> void:
		if !is_rotating:
			is_rotating = true
			new_rotation = deg_to_rad(snappedi(global_rotation_degrees.y + 45, 45))
		else:
			pass

func _on_up_button_pressed() -> void:
	if rotation_degrees.x - 10 < -75:
		new_pitch = -75
	else:
		new_pitch -= 15

func _on_center_obutton_pressed() -> void:
		camera_locked_to_pawn = true
		new_pitch = -30
		new_rotation = deg_to_rad(180)
		new_zoom = 50

func _on_down_button_pressed() -> void:
		if rotation_degrees.x + 10 > -15:
			new_pitch = -15
		else:
			new_pitch += 15

func _on_zoom_slider_value_changed(value: float) -> void:
	value = 50 - int(value)
	new_zoom = value
