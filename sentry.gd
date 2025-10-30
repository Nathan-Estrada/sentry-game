extends Node3D

var turn_speed = 0.4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_y(deg_to_rad(turn_speed))


func _on_timer_timeout() -> void:
	turn_speed = -turn_speed
