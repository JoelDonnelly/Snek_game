extends Node2D
var appleObj = preload("res://Apples/Apple.tscn")


func _on_new_apple_timeout():
	var apple = appleObj.instantiate()
	
	var randx = randi_range(0, 1000)
	var randy = randi_range(0, 600)
	apple.position = Vector2(randx,randy)
	add_child(apple)
	pass # Replace with function body.
