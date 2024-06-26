extends Path2D

@export var wiggle_move_ratio : float = 0.02
@export var wiggle_node_offset_deg : float = 20



func _on_child_entered_tree(node):
	if get_child_count() < 2:
		node.t = 0
	else:
		var child = get_child(get_child_count()-2)
		node.t = deg_to_rad(wiggle_node_offset_deg) + child.t



func add_path_point(point : Vector2):
	var addedDist = point.distance_to(curve.get_point_position(0))
	curve.add_point(point, Vector2(), Vector2(), 0)
	for child in get_children():
		child.t += addedDist*wiggle_move_ratio
	

func remove_path_end():
	curve.remove_point(curve.point_count-1)
