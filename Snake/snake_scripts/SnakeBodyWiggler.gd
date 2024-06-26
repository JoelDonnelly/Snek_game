extends Path2D

class_name SnakeTail

@export var wiggle_move_ratio : float = 0.02
@export var wiggle_node_offset_deg : float = 20

func add_snake_body(new_seg : SnakeBodySeg):
	add_child(new_seg)
	
func apply_wiggle(distance : float):
	for child in get_children():
		if child is SnakeBodySeg:
			child.t += distance*wiggle_move_ratio

func _on_child_entered_tree(node):
	if get_child_count() < 2:
		node.t = 0
	else:
		var child = get_child(get_child_count()-2)
		node.t = deg_to_rad(wiggle_node_offset_deg) + child.t

func add_path_point(point : Vector2):
	apply_wiggle(point.distance_to(curve.get_point_position(0)))
	curve.add_point(point, Vector2(), Vector2(), 0)
	
func remove_path_end():
	curve.remove_point(curve.point_count-1)
