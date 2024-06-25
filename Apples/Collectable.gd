extends Area2D

class_name collectable

@export var itemName : String = "Apple"
@export var collector_group : String = "hungry"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func collect():
	queue_free()
	
func _on_body_entered(body):
	if body.is_in_group(collector_group):
		body.collect(itemName)
		collect()
	pass # Replace with function body.
