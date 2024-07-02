extends Path2D

class_name SnakeTail

signal length_changed(new_length : int)

@export var defaultBodySeg : PackedScene
@export var tracking_node : Node2D

var minPathNodeDist = 1.0
const extraPathLength = 100.0
var requiredPathLength = extraPathLength


@export var wiggle_move_ratio : float = 0.05
@export var wiggle_node_offset_deg : float = 120



func _ready():
	child_entered_tree.connect(_on_child_entered_tree)
	child_exiting_tree.connect(_on_child_exiting_tree)
	child_order_changed.connect(_on_child_order_changed)
	if tracking_node.has_signal("feed"):
		tracking_node.feed.connect(_on_head_segment_feed)
	if !curve:
		curve = Curve2D.new()

func _physics_process(_delta):
	if curve.point_count == 0:
		add_path_point(tracking_node.position - self.position)
	elif tracking_node.position.distance_to(curve.get_point_position(0)) > minPathNodeDist:
		add_path_point(tracking_node.position - self.position)
	
	while curve.get_baked_length() > requiredPathLength:
		remove_path_end()

func apply_wiggle(distance : float):
	for child in get_children():
		if child is SnakeBodySeg:
			child.t += distance*wiggle_move_ratio

func add_snake_body():
	var new_seg = defaultBodySeg.instantiate()
	requiredPathLength += new_seg.seg_size 
	call_deferred("add_child",new_seg)

func _on_head_segment_feed():
	add_snake_body()

func _on_child_entered_tree(node):
	node.died.connect(_on_body_segment_died)
	var seg_num = get_child_count()
	node.seg_num = seg_num
	if seg_num < 2:
		node.t = 0
	else:
		var child = get_child(seg_num-2)
		node.t = deg_to_rad(wiggle_node_offset_deg) + child.t
	length_changed.emit(get_child_count())
		
func _on_child_order_changed():
	var i = 1
	for child in get_children():
		child.seg_num = i
		i += 1
	
func _on_child_exiting_tree(node):
	node.queue_free()
	length_changed.emit(get_child_count()-1)
	pass # Replace with function body.

func _on_body_segment_died(bodySeg):
	if bodySeg in get_children():
		call_deferred("remove_child", bodySeg)

func add_path_point(point : Vector2):
	if curve.point_count != 0:
		apply_wiggle(point.distance_to(curve.get_point_position(0)))
	curve.add_point(point, Vector2(), Vector2(), 0)
	
func remove_path_end():
	curve.remove_point(curve.point_count-1)
	
func shed_tail():
	for bodySeg in get_children():
		call_deferred("remove_child", bodySeg)
	
func reset_curve():
	curve._data.clear()

func _on_reset_snake():
	shed_tail()
	reset_curve()




