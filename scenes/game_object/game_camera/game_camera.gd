extends Camera2D

var target_velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	acquire_target()
	global_position = global_position.lerp(target_velocity, 1.0 - exp(-delta * 15))


func acquire_target():
	var player = get_tree().get_first_node_in_group('player') as Node2D
	if player != null:
		target_velocity = player.global_position
