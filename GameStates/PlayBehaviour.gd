extends StateNode

var appleObj = preload("res://Apples/Apple.tscn")

signal score_update(score : int)
signal length_update(length : int)
signal time_update(time : float)

signal game_over(score: int, length: int, apples: int, time:float)

var score : int = 0
var length : int = 0
var time : float = 0.0

@export var GamePlayUi : Control
@export var appleTimer : Timer
@export var clockTimer : Timer
@export var snakeChar : SnakeHeadSeg

func enter():
	GamePlayUi.visible = true
	score = 0
	time = 0.0
	score_update.emit(0)
	length_update.emit(0)
	time_update.emit(0)

	appleTimer.start()
	clockTimer.start()


	pass
	
func exit():
	GamePlayUi.visible = false
	appleTimer.stop()
	clockTimer.stop()
	game_over.emit(score, length, 0, time)
	pass
	
func _physics_process(_delta):
	var direction = Vector2( Input.get_axis("Down", "Up"), Input.get_axis("Left", "Right"))
	snakeChar.direction = direction

	pass
	
func _process(_delta):
	#print("non-physics")
	pass

func _on_clock_timer_timeout():
	time += clockTimer.wait_time
	time_update.emit(time)
	pass

func _on_tail_length_changed(_new_length):
	length = _new_length
	length_update.emit(length)

func _on_head_segment_feed():
	score += length
	score_update.emit(score)



