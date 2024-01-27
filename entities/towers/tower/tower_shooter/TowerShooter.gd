class_name TowerShooter
extends Node2D

enum TargetPriority { FIRST, LAST, HEALTH }

@export var fire_rate: float = 0.7
@export var damage: float = 20
@export var target_priority: TargetPriority
@export var bullet: PackedScene

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

func shoot() -> void:
	if is_on_cooldown:
		return
		
	var enemy = tower_range.get_target(target_priority)
	if enemy == null:
		return
	
	var _bullet: TowerBullet = bullet.instantiate()
	_bullet.setup(enemy, damage)
	get_parent().add_child(_bullet)
	
	start_cooldown()
	
func _process(_delay: float) -> void:		
	shoot()

func _on_timer_timeout():
	is_on_cooldown = false

