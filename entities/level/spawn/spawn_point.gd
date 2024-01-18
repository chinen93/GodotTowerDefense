class_name Spawn
extends Node2D

var enemy_scenes := {
	"basic_enemy": preload("res://entities/enemies/basic/basic_enemy.tscn"),
}

func spawn(enemy_name: String) -> void:
	var enemy: Enemy = enemy_scenes[enemy_name].instantiate()
	get_parent().add_child(enemy)
	enemy.global_position = position

func _process(delta: float) -> void:
	if Input.is_action_just_released("number_1"):
		spawn("basic_enemy")
