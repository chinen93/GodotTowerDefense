class_name NavigationMap
extends NavigationRegion2D

var viewport_points: PackedVector2Array
var nav_polygon: NavigationPolygon

func _create_navigation_region() -> void:
	var viewport_size = get_viewport().get_visible_rect().size
	viewport_points = PackedVector2Array([
		Vector2(0, 0),
		Vector2(0, viewport_size.y),
		Vector2(viewport_size.x, viewport_size.y), 
		Vector2(viewport_size.x, 0)
	])

	nav_polygon.add_outline(viewport_points)
	nav_polygon.make_polygons_from_outlines()
	set_navigation_polygon(nav_polygon)

func _ready() -> void:
	viewport_points = PackedVector2Array()
	nav_polygon = NavigationPolygon.new()
	_create_navigation_region()
	
	add_obstacle(get_node("LineObstacle"))

func add_obstacle(obstacle:Obstacle) -> void:
	var new_nav_polygon = nav_polygon.duplicate()
	
	var collision_outline: PackedVector2Array = obstacle.get_polygon()
	new_nav_polygon.add_outline(collision_outline)
	
	nav_polygon =  new_nav_polygon
	nav_polygon.make_polygons_from_outlines()
	set_navigation_polygon(nav_polygon)
