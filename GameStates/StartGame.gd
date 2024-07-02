extends StateNode
signal reset_snake

func enter():
	reset_snake.emit()
	# enable control of snake
	pass
	
func exit():
	# stop control over snake
	pass
	
func _physics_process(_delta):
	pass
	
func _process(_delta):
	pass
	


