class_name PlacedState
extends TowerState

func enter(_data := {}) -> void:
	print(str(tower) + "enters PlacedState")

func exit(_data := {}) -> void:
	print(str(tower) + "exits PlacedState")
