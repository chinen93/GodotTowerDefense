class_name Tower
extends Area2D

@export var fire_rate: float = 0.7
@export var damage: float = 20
@export var target_priority: int

@onready var collision := $TowerCollision as CollisionShape2D
@onready var tower_range := $TowerRange as TowerRange
@onready var timer := $Timer as Timer

var is_on_cooldown: bool = false

func _ready() -> void:
	timer.connect("timeout", self._on_timer_timeout)
	
func remove() -> void:
	queue_free()

func can_place() -> bool:
	var place_valid = false
	var overlapping_areas = get_overlapping_areas()
	for area in overlapping_areas:
		
		if is_instance_of(area, TowerPlacement):
			place_valid = true
		
		if is_instance_of(area, Tower):
			return false
			
	return place_valid

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