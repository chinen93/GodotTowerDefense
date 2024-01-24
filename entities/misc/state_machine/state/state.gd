class_name State
extends Node

# Virtual function. Receives events from the `_unhandled_input()` callback.
func handle_input(event: InputEvent) -> void:
	pass

# Virtual function. Corresponds to the `_process()` callback.
func update(delta: float) -> void:
	pass

# Virtual function. Corresponds to the `_physics_process()` callback.
func physics_update(delta: float) -> void:
	pass

# Virtual function.
# Parameter:
# - data: Initialize state with this value
func enter(data := {}) -> void:
	pass

# Virtual function.
func exit() -> void:
	pass
