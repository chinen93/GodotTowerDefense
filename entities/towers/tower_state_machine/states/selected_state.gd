class_name SelectedState
extends TowerState

func enter(_data := {}) -> void:
	print(str(tower) + "enters SelectedState")
	
func exit(_data := {}) -> void:
	print(str(tower) + "exits SelectedState")
