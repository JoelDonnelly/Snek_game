extends Node2D
var appleObj : PackedScene = preload("res://Apples/Apple.tscn")

signal kill_apple


func _on_new_apple_timeout():
	var apple = appleObj.instantiate()
	
	var randx = randi_range(0, int(get_viewport_rect().size.x))
	var randy = randi_range(0, int(get_viewport_rect().size.y))
	apple.position = Vector2(randx,randy)
	add_child(apple)
	pass # Replace with function body.

func _on_game_over():
	for child in get_children():
		if child.is_in_group("food"):
			child.queue_free()
			remove_child(child)



