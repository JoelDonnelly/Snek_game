extends Node

@export var node : SnakeHeadSeg

func _physics_process(_delta):
# Get the input direction and handle the movement/deceleration.
	var direction = Vector2( Input.get_axis("Down", "Up"), Input.get_axis("Left", "Right"))
	
	node.direction = direction

