extends Node3D

var attack_range = 5.0

func _process(_delta):
	var target = find_target()

	if target:
		look_at(target.global_position)

func find_target():
	var enemies = get_tree().get_nodes_in_group("enemies")

	var closest = null
	var closest_distance = attack_range

	for enemy in enemies:

		var d = global_position.distance_to(enemy.global_position)

		if d < closest_distance:
			closest_distance = d
			closest = enemy

	return closest
