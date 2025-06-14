extends Node3D

var x = 0
var y = 0
var z = 0

func _ready() -> void:
	global_position = Vector3(int(-x),int(y),int(-z))
