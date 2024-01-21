class_name Tower
extends Area2D

@export var fire_rate: float = 0.7
@export var damage: float = 20
@export var target_priority: int

@onready var tower_range := $TowerRange as TowerRange
@onready var timer := $Timer as Timer

var is_on_cooldown: bool = false

func can_place(position: Vector2) -> bool:
	return false

func start_cooldown():
	is_on_cooldown = true

	timer.wait_time = fire_rate
	timer.one_shot = true
	timer.start()

func shoot(enemy: Enemy) -> void:
	if not is_on_cooldown:
		print("Shoot at " + str(enemy))
		start_cooldown()
	
func _process(delay: float) -> void:
	var enemy = tower_range.get_target(target_priority)
	
	if enemy == null:
		return
		
	shoot(enemy)

func _on_timer_timeout():
	is_on_cooldown = false

