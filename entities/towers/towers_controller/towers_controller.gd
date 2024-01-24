class_name TowersController
extends Node

var tower_scenes := {
	"base_tower": preload("res://entities/towers/base_tower/base_tower.tscn"),
}
var is_adding_tower: bool = false
var tower: Tower

func spawn(tower_name: String) -> Tower:
	var tower: Tower = tower_scenes[tower_name].instantiate()
	return tower
	
func _ready():
	tower = null

func _handle_inputs() -> void:
	if tower == null and Input.is_action_pressed("right_mouse_button"):
		self._add_tower()
		
	if Input.is_action_just_released("right_mouse_button"):
		self._release_tower()
		

func _add_tower() -> void:
	is_adding_tower = true
	tower = self.spawn("base_tower")
	get_parent().add_child(tower)
	print(tower)

func _release_tower() -> void:
	if tower.can_place():
		print("Released" + str(tower))
	else:
		tower.remove()
		
	is_adding_tower = false
	tower = null

func _handle_adding_tower() -> void:
	if is_adding_tower:
		var position: Vector2 = get_viewport().get_mouse_position()
		tower.position = position

func _process(delta:float) -> void:
	self._handle_inputs()
	self._handle_adding_tower()
