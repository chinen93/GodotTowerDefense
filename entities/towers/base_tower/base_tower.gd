class_name BaseTower
extends Tower

@onready var tower_state_machine := $TowerStateMachine as TowerStateMachine
@onready var tower_shooter := $TowerShooter as TowerShooter

func _ready() -> void:
	self.state_machine = tower_state_machine
	self.state_machine.tower = self
