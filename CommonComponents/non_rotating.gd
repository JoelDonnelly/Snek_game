extends Marker2D

class_name RotationlessMarker

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	rotation = -get_parent().rotation
	pass
