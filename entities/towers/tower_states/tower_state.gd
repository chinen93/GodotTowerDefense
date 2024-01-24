class_name TowerState
extends State

var tower: Tower

func _ready() -> void:
	await owner.ready
	
	tower = owner as Tower
	assert(tower != null)
