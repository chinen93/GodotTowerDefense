class_name Player
extends Node2D

@export var speed = 100 # How fast the player will move (pixels/sec).
var screen_size: Vector2 # Size of the game window.

@onready var camera := $Camera2D as Camera2D

func _move(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	self._camera_settings()	
	
func _camera_settings() -> void:
	camera.limit_left = 0
	camera.limit_right = int(screen_size.x)
	camera.limit_top = 0
	camera.limit_bottom = int(screen_size.y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self._move(delta)
	
