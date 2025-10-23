extends CharacterBody3D


# How fast the player moves in meters per second.
const speed = 14
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 50

const jump_velocity = 10
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var pivot := $Pivot
@onready var camera := $Pivot/Camera3D

#Handles head movement
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			pivot.rotate_y(-event.relative.x * 0.01)
			camera.rotate_x(-event.relative.y * 0.01)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-30), deg_to_rad(60))

func _physics_process(delta):
	#var direction = Vector3.ZERO
	
	# Vertical Velocity
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		velocity.y = velocity.y - (fall_acceleration * delta)
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
		
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction = (pivot.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	
	move_and_slide()
	
	#if Input.is_action_pressed("move_right"):
		#direction.x += 1
	#if Input.is_action_pressed("move_left"):
		#direction.x -= 1
	#if Input.is_action_pressed("move_back"):
		#direction.z += 1
	#if Input.is_action_pressed("move_forward"):
		#direction.z -= 1

	
	#if direction != Vector3.ZERO:
		#direction = direction.normalized()
		## Setting the basis property will affect the rotation of the node.
		#$Pivot.basis = Basis.looking_at(direction)

	## Ground Velocity
	#target_velocity.x = direction.x * speed
	#target_velocity.z = direction.z * speed
#
	## Moving the Character
	#velocity = target_velocity
	#move_and_slide()
