extends StateNode

@export var backgroundScene : PackedScene

var backgroundSneks

func enter():
	$"../../CanvasLayer/StartMenu".visible = true
	backgroundSneks = backgroundScene.instantiate()
	add_child(backgroundSneks)
	pass
	
func exit():
	$"../../CanvasLayer/StartMenu".visible = false
	remove_child(backgroundSneks)
	backgroundSneks.queue_free()
	print("set background snakes to not visible")
	pass
	
func _physics_process(_delta):
	pass
	
func _process(_delta):
	pass
	


