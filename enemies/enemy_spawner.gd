extends Node3D

var enemy_scene = preload("res://enemies/enemy.tscn")

var timer = 0.0

func _process(delta):
	timer += delta

	if timer >= 2.0:
		timer = 0.0

		var enemy = enemy_scene.instantiate()

		enemy.position = position

		get_parent().add_child(enemy)
