extends Node2D


func _on_add_body_seg_timer_timeout():
	if $Snake.segCount >= $Snake.maxSegs:
		$AddBodySegTimer.stop()
	$Snake.attatch_body_seg()
	print("new body segment added.")
