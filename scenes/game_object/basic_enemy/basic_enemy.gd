extends CharacterBody2D

const MAX_SPEED = 25

@onready var health_component: HealthComponent = $HealthComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.area_entered.connect(on_area_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = get_player_direction()
	var target_rotation = direction.angle()
	rotation = lerp(rotation, target_rotation, 1.0 - exp(-delta * 10))
	velocity = direction * MAX_SPEED
	move_and_slide()


func get_player_direction():
	var player = get_tree().get_first_node_in_group('player') as Node2D
	if player != null:
		return (player.global_position - global_position).normalized()
		
	return Vector2.ZERO


func on_area_entered(other_area: Area2D):
	health_component.damage(100)
