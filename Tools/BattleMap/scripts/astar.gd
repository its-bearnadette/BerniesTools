class_name BattleGrid
extends Node
var astar = AStar3D.new()
const Directions = [Vector3.FORWARD,Vector3.BACK,Vector3.LEFT,Vector3.RIGHT]
@onready var main = get_tree().root.get_node("Main")
@onready var baseplate = $"../Baseplate"
@export var line_size = 25

func _ready():
	_populate_points()
	baseplate.size = Vector3(line_size,1,line_size)
	baseplate.position = Vector3.ZERO + Vector3(1,-.5,1) - Vector3(baseplate.size.x,0,baseplate.size.z)/2

func _populate_points():
	var grid_size = pow(line_size,2)
	var x = 0
	#var y = 0
	var z = 0
	var point_id = 0
	var test_node = load("res://Tools/BattleMap/scenes/testnode.tscn")
	
	for points in grid_size:
		var dot_instance = test_node.instantiate()
		point_id = point_id + 1
		dot_instance.x = x
		#dot_instance.y = y
		dot_instance.z = z
		add_sibling.call_deferred(dot_instance)
		# uncomment the timer for a nice, slow iteration of the grid. sexy.
		#await get_tree().create_timer(0.000001).timeout
		astar.add_point(point_id,Vector3(x,0,z))
		print("added point:"," x: ", x, " z: ", z)
		if x == sqrt(grid_size)-1:
			x = 0
			z += 1
		else:
			x += 1


func _connect_point(point_pos: Vector3):
	var point_id = astar.get_closest_point(point_pos)
	for direction in Directions:
		var neighbor = point_pos + direction
		var neighbor_id = astar.get_closest_point(neighbor)
