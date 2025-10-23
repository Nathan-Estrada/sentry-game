extends Node3D

const turn_speed = 0.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (rotation_degrees.y >= 180):
		rotate_y(deg_to_rad(-turn_speed))
	elif (rotation_degrees.y <= 50):
		rotate_y(deg_to_rad(-turn_speed))
	print(rotation_degrees.y)
		
