extends Area2D

class_name HitBox

func _ready():
	connect("area_entered",_on_area_entered)


func _on_area_entered(area):
	get_parent().hit_by(area)
	pass # Replace with function body.
