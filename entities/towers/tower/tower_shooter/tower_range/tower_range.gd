class_name TowerRange
extends Area2D

var targets: Array
var targets_location: Dictionary
	
func get_target(target_priority: int) -> Enemy:
	if targets.is_empty():
		return null

	match target_priority:
		0 when is_instance_valid(targets[0]):
			return targets[0]

	return null
	
func _ready() -> void:
	targets = Array()
	targets_location = Dictionary()

func _on_body_entered(body: Node2D) -> void:
	if not is_instance_of(body, Enemy):
		return

	body.enemy_died.connect(self._remove_enemy)
	
	var key = body.get_instance_id()
	var location = targets.size()
	
	targets_location[key] = location
	targets.push_front(body)

func _on_body_exited(body: Node2D) -> void:
	if not is_instance_of(body, Enemy): return

	var enemy = targets.pop_front()
	if enemy == null: return
		
	self._remove_enemy(enemy.get_instance_id())
	
func _remove_enemy(enemy_id: int) -> void:
	if targets_location.has(enemy_id):
		var location = targets_location[enemy_id]

		targets.pop_at(location)
		targets_location.erase(enemy_id)
