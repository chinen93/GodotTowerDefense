class_name Objective
extends Node

@onready var collision_shape := $CollisionShape2D as CollisionShape2D

func _on_body_entered(body: Enemy) -> void:
	body.die()
