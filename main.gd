extends Node2D
var appleObj = preload("res://Apples/Apple.tscn")

signal score_update(score : int)
signal length_update(length : int)
signal time_update(time : float)

var score : int = 0
var length : int = 0
var time : float = 0.0

func _on_new_apple_timeout():
	var apple = appleObj.instantiate()
	
	var randx = randi_range(0, get_viewport_rect().size.x)
	var randy = randi_range(0, get_viewport_rect().size.y)
	apple.position = Vector2(randx,randy)
	add_child(apple)
	pass # Replace with function body.

func _on_tail_length_changed(_new_length):
	length = _new_length
	length_update.emit(length)

func _on_head_segment_feed():
	score += length
	score_update.emit(score)

func _on_start_game_reset_snake():
	time = 0.0
	$Timer.start()
	pass # Replace with function body.


func _on_timer_timeout():
	time += 1
	time_update.emit(time)
	pass # Replace with function body.
