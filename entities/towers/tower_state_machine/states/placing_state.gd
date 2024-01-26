class_name PlacingState
extends TowerState

func enter(_data := {}) -> void:
	print(str(tower) + "enters PlacingState")
	
func exit(_data := {}) -> void:
	print(str(tower) + "exits PlacingState")
	
func update(_delta: float) -> void:
	var position: Vector2 = get_viewport().get_mouse_position()
	tower.position = position

# DO SOMETHING
