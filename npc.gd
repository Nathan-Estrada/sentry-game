extends CharacterBody3D

@onready var animation = $Pivot/Zombie/AnimationPlayer
const SPEED = 3
const JUMP_VELOCITY = 4.5

func _ready():
	velocity = Vector3.FORWARD * -SPEED
	
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	animation.play("Armature|Walk")
	move_and_slide()
	
func _zombie_death():
	pass
