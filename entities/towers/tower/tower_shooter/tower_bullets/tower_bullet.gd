class_name TowerBullet
extends Node2D

@export var speed : float = 4.0

var enemy: Enemy
var damage: float	

func _process(_delta:float) -> void:
	if is_instance_valid(enemy):
		var velocity = global_position.direction_to(enemy.position)
		global_position += speed * velocity
	else:
		remove()
	
func is_position_valid() -> bool:
	return true
	
func remove() -> void:
	queue_free()
	
func hit_enemy(body: Node2D) -> void:
	if not is_instance_of(body, Enemy):
		return
	enemy.take_damage(self.damage)
	remove()

func setup(enemy: Enemy, damage: float) -> void:
	self.enemy = enemy
	self.damage = damage
