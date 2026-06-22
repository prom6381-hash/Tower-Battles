extends Node3D

@onready var goal = get_node("../Goal")

var speed = 2.0

func _process(delta):
	var direction = (goal.position - position).normalized()
	position += direction * speed * delta
