class_name PlayerCamera
extends Camera2D

var increment := Vector2(0.10, 0.10)
var min_limit := Vector2(1.0, 1.0)
var max_limit := Vector2(1.3, 1.3)

func zoom():
	if Input.is_action_just_released('wheel_down') and get_zoom() > min_limit:
		set_zoom(get_zoom() - increment)
	if Input.is_action_just_released('wheel_up') and get_zoom() < max_limit:
		set_zoom(get_zoom() + increment)

func _physics_process(_delta):
	zoom()
