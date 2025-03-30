extends RigidBody3D
@onready var colliderbody = $Bump
@export var push_force = 20
var contact_vector = Vector3.ZERO
var has_result_printed = false
var faces = []
var type = 0
var face_up = 0
signal result_printed(type:int, face_up:int)
func _ready():
	for face in get_tree().get_nodes_in_group('faces'):
		if self.is_ancestor_of(face):
			faces.append(face)
	pass
func _process(_delta):
	colliderbody.global_position = global_position
	#if colliderbody.get_contact_count() < 1 and angular_velocity < Vector3(.001,.001,.001) and angular_velocity > Vector3(-.001,-.001,-.001):
		#sleeping = true
	if colliderbody.get_contact_count() > 0 and !sleeping:
		apply_force(contact_vector*push_force)
	else:
		pass
	if(sleeping) and has_result_printed == false:
		found_result()
func find_up_face():
	var best_so_far = -1
	var best_face = null
	for face in faces:
		var dot = (face.global_transform.origin - global_transform.origin).dot(Vector3.UP)
		#print(
			#'Face: ', face.name,
			#', Dot: ', dot,
			#', Best: ', best_so_far)
		if dot > best_so_far:
			best_so_far = dot
			best_face = face
	return best_face.name
#--- End of Tim Klein's code---#

#func _on_timer_timeout():
	#kills the instance after the timer runs out.
func found_result():
#!!! The following code is lifted in part from Tim Klein's work at https://timjklein36.github.io/posts/physics_dice_rolls/ !!!#
	var face_names: Array = []
	type = len(faces)
	for face in faces:
		face_names.append(face.name)
	face_up = find_up_face()
	face_up = face_up.to_int()
#	print('Result (d', type, '): ', face_up)
	result_printed.emit(type, face_up)
	has_result_printed = true
	#have the main script listen for a signal "found_up_face" before printing the result.
	pass
func _on_body_entered(body):
	clack()
func _on_bumper_body_entered(body):
	clack()
	var collider_position = body.global_position
	contact_vector = global_position - collider_position
	return contact_vector
func clack():
	var soundVelocity = remap(linear_velocity.y,0,-30,4,0)
	$AudioStreamPlayer3D.play()
	$AudioStreamPlayer3D.pitch_scale = soundVelocity*.2
func _on_AudioStreamPlayer3D_finished():
	pass # Replace with function body.
func _kill_yourself():
	self.remove_from_group("LivingDice")
	queue_free()


func _on_sleeping_state_changed() -> void:
	if sleeping:
		print('zzz')
		found_result()
	pass # Replace with function body.
