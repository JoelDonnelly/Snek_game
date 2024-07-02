extends StateNode


func enter():
	$"../../CanvasLayer/GameOverUi".visible = true
	pass
	
func exit():
	$"../../CanvasLayer/GameOverUi".visible = false
	pass
	
func _physics_process(_delta):
	pass
	
func _process(_delta):
	pass
	


