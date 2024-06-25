extends Path2D

@export var wiggle_move_ratio : float = 0.02
@export var wiggle_amp : float = 5
@export var wiggle_node_offset_deg : float = 20



func _on_child_entered_tree(node):
	node.wiggle_amp = wiggle_amp
	node.wiggle_ratio = wiggle_move_ratio
	if get_child_count() < 2:
		node.t = 0
	else:
		var child = get_child(get_child_count()-2)
		node.t = wiggle_node_offset_deg + child.t
	
		
	pass # Replace with function body.
