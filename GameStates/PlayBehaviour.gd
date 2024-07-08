extends StateNode

var appleObj = preload("res://Apples/Apple.tscn")

signal time_update(time : float)
signal score_inc(inc : int)
signal game_over


@export var GamePlayUi : Control
@export var appleTimer : Timer
@export var clockTimer : Timer
@export var snakeChar : SnakeHeadSeg
@export var tail: SnakeTail

func enter():
	GamePlayUi.visible = true


	time_update.emit(0)

	appleTimer.start()
	clockTimer.start()
	
	$"../../CanvasLayer2".visible = true


	pass
	
func exit():
	GamePlayUi.visible = false
	$"../../CanvasLayer2".visible = false
	appleTimer.stop()
	clockTimer.stop()
	game_over.emit()
	pass
	
func _physics_process(_delta):
	var direction = Vector2( Input.get_axis("Down", "Up"), Input.get_axis("Left", "Right"))
	snakeChar.direction = direction

	pass
	
func _process(_delta):
	#print("non-physics")
	pass

func _on_clock_timer_timeout():
	time_update.emit(clockTimer.wait_time)
	pass

func _on_head_segment_feed():
	score_inc.emit(tail.get_child_count()+1)



