extends Node

class_name ScoreComponent

signal scoreChanged(score : int)
signal scoreIncreased(amount : int)
signal scoreDecreased(amount : int)
signal scoreReset

@export var initialScore : int = 0
@export var allowScoreIncrease : bool = true
@export var allowScoreDecrease : bool = true


var score : int:
	set(val):
		score = val
		scoreChanged.emit(score)
		
			

func _ready():
	score = initialScore

func set_score(new_score : int ) -> void:
	if ((new_score > score) && allowScoreIncrease) || ((new_score < score) && allowScoreDecrease):
		score = new_score
	
func increment_score() -> void:
	if allowScoreIncrease:
		score += 1
		scoreIncreased.emit(1)

func increment_n_score(inc : int) -> void:
	if allowScoreIncrease:
		score += inc
		scoreIncreased.emit(inc)
	
func decrement_score() -> void:
	if allowScoreDecrease:
		score -= 1
		scoreDecreased.emit(1)

func decrement_n_score(dec : int) -> void:
	if allowScoreDecrease:
		score -= dec
		scoreDecreased.emit(dec)

func reset_score() -> void:
	scoreReset.emit()
	score = initialScore

