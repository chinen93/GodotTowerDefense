class_name LineObstacle
extends Obstacle

@onready var collision_shape := $CollisionPolygon2D as CollisionPolygon2D

func get_polygon() -> PackedVector2Array:
	var collisionpolygon_transform: Transform2D = collision_shape.get_global_transform()
	var collisionpolygon: PackedVector2Array = collision_shape.polygon
	var new_collision_outline: PackedVector2Array = collisionpolygon_transform * collisionpolygon

	return new_collision_outline
