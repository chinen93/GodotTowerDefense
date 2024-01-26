class_name StateMachine
extends Node

@export var initial_state := NodePath()

@onready var state: State = get_node(initial_state)

func _ready() -> void:
	await owner.ready
	state.enter()

	# The state machine subscribes to node callbacks and delegates them to the state objects.
func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)

func _process(delta: float) -> void:
	state.update(delta)

func _physics_process(delta: float) -> void:
	state.physics_update(delta)
	
func transition_to(target_state_name: NodePath, msg: Dictionary = {}) -> void:
	if not has_node(target_state_name):
		return
		
	var target_state = get_node(target_state_name)
	if state == target_state:
		return

	state.exit()
	state = target_state
	state.enter(msg)
	
