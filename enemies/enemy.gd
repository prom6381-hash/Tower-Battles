extends Node3D

var goal
var speed = 2.0

func _ready():
	goal = get_tree().current_scene.get_node("Goal")

func _process(delta):
	if goal == null:
		return

	var distance = position.distance_to(goal.position)

	if distance < 0.5:
		queue_free()
		return

	var direction = (goal.position - position).normalized()
	position += direction * speed * delta
