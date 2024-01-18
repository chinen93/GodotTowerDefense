class_name PlayerCamera
extends Camera2D

var increment := Vector2(0.25, 0.25)
var min_limit := Vector2(1.0, 1.0)
var max_limit := Vector2(2.0, 2.0)

func zoom():
	if Input.is_action_just_released('wheel_down') and get_zoom() > min_limit:
		set_zoom(get_zoom() - increment)
	if Input.is_action_just_released('wheel_up') and get_zoom() < max_limit:
		set_zoom(get_zoom() + increment)

func _physics_process(delta):
	zoom()
