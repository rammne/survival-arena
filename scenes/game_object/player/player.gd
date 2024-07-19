extends CharacterBody2D

const MAX_SPEED = 125
const ACCELERATION_SMOOTHING = 15



func _process(delta):
	var movement = get_movement_vector()
	var target_veolocity = movement * MAX_SPEED
	velocity = velocity.lerp(target_veolocity, 1.0 - exp(-delta * ACCELERATION_SMOOTHING))
	move_and_slide()


func get_movement_vector():
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(x_movement, y_movement).normalized()
