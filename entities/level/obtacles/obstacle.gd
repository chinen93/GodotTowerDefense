class_name Obstacle
extends Node2D

@export var pixels_offset: float = 4

func _offset_polygon(polygon: PackedVector2Array):
	return Geometry2D.offset_polygon(polygon, pixels_offset)[0]

func get_polygon():
	pass
