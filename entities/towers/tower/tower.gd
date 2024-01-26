class_name Tower
extends Area2D

var state_machine: TowerStateMachine

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

func placing_state(msg: Dictionary = {}) -> void:
	state_machine.placing_state(msg)

func selected_state(msg: Dictionary = {}) -> void:
	state_machine.selected_state(msg)
	
func placed_state(msg: Dictionary = {}) -> void:
	state_machine.placed_state(msg)
