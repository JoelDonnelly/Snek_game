extends Node2D
var appleObj = preload("res://Apples/Apple.tscn")

signal score_update(score : int)
signal length_update(length : int)
signal time_update(time : float)



func _on_new_apple_timeout():
	var apple = appleObj.instantiate()
	
	var randx = randi_range(0, int(get_viewport_rect().size.x))
	var randy = randi_range(0, int(get_viewport_rect().size.y))
	apple.position = Vector2(randx,randy)
	add_child(apple)
	pass # Replace with function body.



