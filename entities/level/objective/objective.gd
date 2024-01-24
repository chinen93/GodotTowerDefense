class_name Objective
extends Node

@export var health := 200

@onready var collision_shape := $CollisionShape2D as CollisionShape2D
@onready var health_component := $Health as Health

func _ready() -> void:
	health_component._set_health(health)

func _on_body_entered(enemy: Enemy) -> void:
	
	health_component.take_damage(enemy.damage)
	enemy.die()
	
	if health_component.is_dead():
		print("Game Over")
		
	
