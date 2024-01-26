class_name TowerStateMachine
extends StateMachine

const PLACING_STATE = "Placing"
const SELECTED_STATE = "Selected"
const PLACED_STATE = "Placed"

@export var tower : Tower

func _ready() -> void:
	await owner.ready
	assert (tower != null)
	
	for child in get_children():
		child.setup(tower)
	
func placing_state(msg: Dictionary = {}) -> void:
	transition_to(PLACING_STATE, msg)
	
func selected_state(msg: Dictionary = {}) -> void:
	transition_to(SELECTED_STATE, msg)
	
func placed_state(msg: Dictionary = {}) -> void:
	transition_to(PLACED_STATE, msg)
