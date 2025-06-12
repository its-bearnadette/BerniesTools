extends RigidBody3D

func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var lin_rand_x = randf_range(-5,5)

	var lin_rand_z = randf_range(-5,5) 
	
	var ang_rand_x = randf_range(-30,30)
	var ang_rand_y = randf_range(-5,5)
	var ang_rand_z = randf_range(-30,30)

	linear_velocity = Vector3(lin_rand_x,3,lin_rand_z)
	angular_velocity = Vector3(ang_rand_x,ang_rand_y,ang_rand_z)
