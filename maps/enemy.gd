extends Node3D

var speed = 2.5
var waypoints = []
var current_index = 0

func _ready():
	var wp_parent = get_tree().current_scene.get_node("Waypoints")

	for child in wp_parent.get_children():
		waypoints.append(child)

func _process(delta):
	if current_index >= waypoints.size():
		queue_free()
		return

	var target_node = waypoints[current_index]
	var target_pos = target_node.global_position

	var dir = (target_pos - global_position).normalized()
	global_position += dir * speed * delta

	if global_position.distance_to(target_pos) < 0.2:

		# Se chegou ao waypoint final
		if target_node.name == "WPEnd":
			queue_free()
			return

		current_index += 1
