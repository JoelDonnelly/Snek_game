extends Path2D

class_name SnakeTail

@export var wiggle_move_ratio : float = 0.05
@export var wiggle_node_offset_deg : float = 120

func _ready():
	child_entered_tree.connect(_on_child_entered_tree)
	child_exiting_tree.connect(_on_child_exiting_tree)
	child_order_changed.connect(_on_child_order_changed)

func add_snake_body(new_seg : SnakeBodySeg):
	add_child(new_seg)
	
func apply_wiggle(distance : float):
	for child in get_children():
		if child is SnakeBodySeg:
			child.t += distance*wiggle_move_ratio

func _on_child_entered_tree(node):
	print("child enter tree")
	node.died.connect(_on_body_segment_died)
	var seg_num = get_child_count()
	node.seg_num = seg_num
	if seg_num < 2:
		node.t = 0
	else:
		var child = get_child(seg_num-2)
		node.t = deg_to_rad(wiggle_node_offset_deg) + child.t
		
func _on_child_order_changed():
	var i = 1
	for child in get_children():
		child.seg_num = i
		i += 1
	
	pass # Replace with function body.

func add_path_point(point : Vector2):
	apply_wiggle(point.distance_to(curve.get_point_position(0)))
	curve.add_point(point, Vector2(), Vector2(), 0)
	
func remove_path_end():
	curve.remove_point(curve.point_count-1)
	
func _on_child_exiting_tree(node):
	node.queue_free()
	pass # Replace with function body.

func _on_body_segment_died(bodySeg):
	if bodySeg in get_children():
		call_deferred("remove_child", bodySeg)
	pass # Replace with function body.






