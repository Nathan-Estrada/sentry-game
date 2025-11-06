extends Node3D

var turn_speed = 0.4
var is_in_range = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()
	#var zombie = get_node("root/npc")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not is_in_range:
		rotate_y(deg_to_rad(turn_speed))


func _on_timer_timeout() -> void:
	turn_speed = -turn_speed


func _on_sentry_range_entered(body: CharacterBody3D) -> void:
	if body.has_method("_zombie_death"):
		$Timer.stop()
		print("pee")
		is_in_range = true

func _sentry_aim():
	pass
	


func _on_sentry_range_exited(body: CharacterBody3D) -> void:
	if body.has_method("_zombie_death"):
		$Timer.start()
		print("poo")
		is_in_range = false
