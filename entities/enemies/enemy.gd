class_name Enemy
extends CharacterBody2D

@export var speed := 50
@export var health := 100:
	set = set_health
@export var kill_reward := 100

@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var collision_shape := $CollisionShape2D as CollisionShape2D

func _ready() -> void:
	nav_agent.max_speed = speed
	
	# Make sure to not await during _ready.
	call_deferred("_actor_setup")
	
func _actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame

	# Now that the navigation map is no longer empty, set the movement target.
	var map: Node2D = get_tree().get_nodes_in_group("maps")[0]
	var objective: Node2D = map.get_node("%Objective")
	nav_agent.set_target_position(objective.global_position)
	
func _physics_process(delta: float) -> void:
	if nav_agent.is_navigation_finished():
		return
	
	var next_path_pos: Vector2 = nav_agent.get_next_path_position()
	var cur_agent_pos: Vector2 = global_position
	velocity = cur_agent_pos.direction_to(next_path_pos) * speed
	move_and_slide()

func set_health(value: int) -> void:
	health = max(0, value)
	
func die() -> void:
	collision_shape.set_deferred("disabled", true)
	speed = 0
	nav_agent.set_velocity(Vector2.ZERO)
	queue_free()
	
