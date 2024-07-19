extends Node

const MAX_RANGE = 150

@export var sword_ability: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.timeout.connect(on_timer_timeout)
	

func on_timer_timeout():
	var player = get_tree().get_first_node_in_group('player') as Node2D
	if player == null:
		return
	
	var enemies = get_tree().get_nodes_in_group('enemy')
	enemies = enemies.filter(func(enemy: Node2D):
		return enemy.global_position.distance_squared_to(player.global_position) < pow(MAX_RANGE, 2)
	)
	
	if enemies.size() == 0:
		return
	
	enemies.sort_custom(func(enemy_a: Node2D, enemy_b: Node2D):
			var enemy_a_distance = enemy_a.global_position.distance_squared_to(player.global_position)
			var enemy_b_distance = enemy_b.global_position.distance_squared_to(player.global_position)
			return enemy_a_distance < enemy_b_distance
	)
	
	var sword_instance = sword_ability.instantiate() as Node2D
	player.get_parent().add_child(sword_instance)
	sword_instance.global_position = enemies[0].global_position
	sword_instance.global_position += Vector2.RIGHT.rotated(randf_range(0, TAU))

	var enemy_direction = enemies[0].global_position - sword_instance.global_position
	sword_instance.rotation = enemy_direction.angle()
