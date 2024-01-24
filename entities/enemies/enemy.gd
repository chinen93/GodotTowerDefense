class_name Enemy
extends CharacterBody2D

@export var speed := 100
@export var kill_reward := 100
@export var damage := 100
@export var health := 100

@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var collision_shape := $CollisionShape2D as CollisionShape2D
@onready var health_component := $Health as Health

func _ready() -> void:
	nav_agent.max_speed = speed
	health_component._set_health(health)
	
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

	var cur_agent_pos: Vector2 = global_position
	var next_path_pos: Vector2 = nav_agent.get_next_path_position()

	velocity = cur_agent_pos.direction_to(next_path_pos) * speed
	move_and_slide()

func take_damage(damage: float) -> void:
	health_component.take_damage(damage)
	
	if health_component.is_dead():
		self.die()

func die() -> void:
	collision_shape.set_deferred("disabled", true)
	speed = 0
	nav_agent.set_velocity(Vector2.ZERO)
	queue_free()
	
