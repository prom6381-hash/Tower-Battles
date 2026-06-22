extends Node3D

var enemy_scene = preload("res://enemies/enemy.tscn")
var timer = 0.0

func _process(delta):
	timer += delta

	if timer >= 2.0:
		timer = 0.0

		var enemy = enemy_scene.instantiate()
		get_tree().current_scene.add_child(enemy)

		enemy.global_position = global_position + Vector3(0, 0, 0)

		print("SPAWN OK")
