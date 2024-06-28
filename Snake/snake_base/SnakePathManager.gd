extends Node2D

var bodySeg : PackedScene = preload("res://Snake/SnakeBodies/BasicBody/BasicBody.tscn")
var segCount : int = 0
var maxSegs : int = 10

var minPathNodeDist = 1
const extraPathLength = 100.0
var requiredPathLength = extraPathLength

func attatch_body_seg():
	var new_seg = bodySeg.instantiate()
	
	requiredPathLength += new_seg.seg_size 
	$Tail.call_deferred('add_snake_body',new_seg)

func _ready():
	pass

func _process(_delta):
	# check that the next node is far enough away from previous
	if $HeadSegment.position.distance_to($Tail.curve.get_point_position(0)) > minPathNodeDist: 
		$Tail.add_path_point($HeadSegment.position)
	
	# remove excess path nodes
	while $Tail.curve.get_baked_length() > requiredPathLength:
		$Tail.remove_path_end()
		

func _on_head_segment_feed():
	attatch_body_seg()
	pass # Replace with function body.


func _on_timer_timeout():
	$HeadSegment/Health.recieve_healing(1)
	pass # Replace with function body.
