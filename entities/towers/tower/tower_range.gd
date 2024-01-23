class_name TowerRange
extends Area2D

var targets: Array

func _ready() -> void:
	targets = Array()
	
func get_target(target_priority: int) -> Enemy:
	if targets.is_empty():
		return null
	
	match target_priority:
		0: return targets[0]
		
	return null

func _on_body_entered(body: Node2D) -> void:
	if not is_instance_of(body, Enemy):
		return 
	targets.push_back(body)

func _on_body_exited(body: Node2D) -> void:
	if not is_instance_of(body, Enemy):
		return 
	targets.pop_back()
