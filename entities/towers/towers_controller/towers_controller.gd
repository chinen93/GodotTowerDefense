class_name TowersController
extends Node

@export var tower_parent_path: NodePath

var tower_scenes := {
	"base_tower": preload("res://entities/towers/base_tower/base_tower.tscn"),
}

var is_adding_tower: bool = false
var tower: Tower

func spawn(tower_name: String) -> Tower:
	return tower_scenes[tower_name].instantiate()
	
func _ready():
	tower = null
	assert(not tower_parent_path.is_empty())

func _handle_inputs() -> void:
	if tower == null and Input.is_action_pressed("right_mouse_button"):
		self._add_tower()

	if tower != null and Input.is_action_just_released("right_mouse_button"):
		self._release_tower()

func _add_tower() -> void:
	is_adding_tower = true
	tower = self.spawn("base_tower")
	get_node(tower_parent_path).add_child(tower)
	
	tower.placing_state()

func _release_tower() -> void:
	if not tower.can_place():
		tower.remove()
	
	tower.placed_state()
	is_adding_tower = false
	tower = null

func _process(_delta: float) -> void:
	self._handle_inputs()
