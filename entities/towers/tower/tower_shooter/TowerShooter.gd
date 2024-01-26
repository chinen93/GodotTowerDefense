class_name TowerShooter
extends Node2D

enum TargetPriority { FIRST, LAST, HEALTH }

@export var fire_rate: float = 0.7
@export var damage: float = 20
@export var target_priority: TargetPriority

@onready var tower_range := $TowerRange as TowerRange
@onready var timer := $Timer as Timer

var is_on_cooldown: bool = false

func _ready() -> void:
	timer.connect("timeout", self._on_timer_timeout)
	
func remove() -> void:
	queue_free()

func start_cooldown():
	is_on_cooldown = true

	timer.wait_time = fire_rate
	timer.one_shot = true
	timer.start()

func shoot(enemy: Enemy) -> void:
	if is_on_cooldown:
		return
	
	print(str(self) + " shoot at " + str(enemy))
	enemy.take_damage(damage)
	start_cooldown()
	
func _process(_delay: float) -> void:
	var enemy = tower_range.get_target(target_priority)
	
	if enemy == null:
		return
		
	shoot(enemy)

func _on_timer_timeout():
	is_on_cooldown = false

