class_name Health
extends Node2D

@export var health := 100:
	set = _set_health
	
func _set_health(value: float) -> void:
	health = max(0, value)
		
func take_damage(damage: float) -> void:
	self._set_health(self.health - damage)
	
func is_dead() -> bool:
	return health == 0
	
func die() -> void:
	pass
