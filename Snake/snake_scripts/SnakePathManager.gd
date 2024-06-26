extends Node2D

const bodySeg : PackedScene = preload("res://Snake/SnakeBodySegment.tscn")
var segCount : int = 0
var maxSegs = 10

var minPathNodeDist = 1
const extraPathLength = 100.0
var requiredPathLength = 0 + extraPathLength

func attatch_body_seg():
	var new_seg = bodySeg.instantiate()
	segCount += 1
	new_seg.seg_num = segCount
	requiredPathLength = segCount*new_seg.seg_size + extraPathLength
	$Tail.call_deferred('add_child',new_seg)

func _ready():
	pass

func _process(_delta):
	# check that the next node is far enough away from previous
	if $HeadSegment.position.distance_to($Tail.curve.get_point_position(0)) > minPathNodeDist: 
		$Tail.curve.add_point($HeadSegment.position, Vector2.ZERO, Vector2.ZERO, 0)
	
	# remove excess path nodes
	while $Tail.curve.get_baked_length() > requiredPathLength:
		$Tail.curve.remove_point($Tail.curve.point_count-1)
		



func _on_head_segment_feed():
	attatch_body_seg()
	pass # Replace with function body.
