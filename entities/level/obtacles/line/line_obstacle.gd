class_name LineObstacle
extends Obstacle

@onready var collision_shape := $CollisionPolygon2D as CollisionPolygon2D

func get_polygon() -> PackedVector2Array:
	var collision_polygon_transform: Transform2D = collision_shape.get_global_transform()
	var collision_polygon: PackedVector2Array = collision_shape.polygon
	
	collision_polygon = _offset_polygon(collision_polygon)
	
	var new_collision_outline: PackedVector2Array = collision_polygon_transform * collision_polygon

	return new_collision_outline
