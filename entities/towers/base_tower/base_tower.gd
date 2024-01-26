class_name BaseTower
extends Tower

@onready var tower_state_machine := $TowerStateMachine as TowerStateMachine

func _ready() -> void:
	self.state_machine = tower_state_machine
	self.state_machine.tower = self
