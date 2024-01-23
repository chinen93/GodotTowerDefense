class_name NavigationMap
extends NavigationRegion2D

func _ready() -> void:	
	add_obstacle(get_node("LineObstacle"))
	add_obstacle(get_node("LineObstacle2"))
	add_obstacle(get_node("LineObstacle3"))
	add_obstacle(get_node("LineObstacle4"))
	add_obstacle(get_node("LineObstacle5"))

func add_obstacle(obstacle: Obstacle) -> void:	
	var new_nav_polygon: NavigationPolygon = navigation_polygon.duplicate()
	
	var collision_outline: PackedVector2Array = obstacle.get_polygon()
	
	new_nav_polygon.add_outline(collision_outline)
	NavigationServer2D.bake_from_source_geometry_data(new_nav_polygon, NavigationMeshSourceGeometryData2D.new());
	navigation_polygon = new_nav_polygon
