extends Camera3D

@export var speed := 10.0
@export var mouse_sensitivity := 0.2

var pitch := 0.0
var yaw := 0.0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		yaw -= event.relative.x * mouse_sensitivity
		pitch -= event.relative.y * mouse_sensitivity
		pitch = clamp(pitch, -80, 80)

		rotation_degrees = Vector3(pitch, yaw, 0)

func _process(delta):
	var dir = Vector3.ZERO

	# MOVIMENTO LOCAL (mais fiável)
	var forward = -transform.basis.z
	var right = transform.basis.x

	if Input.is_key_pressed(KEY_W):
		dir += forward
	if Input.is_key_pressed(KEY_S):
		dir -= forward
	if Input.is_key_pressed(KEY_A):
		dir -= right
	if Input.is_key_pressed(KEY_D):
		dir += right

	var current_speed = speed
	if Input.is_key_pressed(KEY_SHIFT):
		current_speed *= 2.0

	global_position += dir.normalized() * current_speed * delta
