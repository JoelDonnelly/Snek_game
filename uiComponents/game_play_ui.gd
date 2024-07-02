extends Control

signal end_time(running_time : int)

var score_label : Label
var length_label : Label
var time_label : Label

var time_value : int = 0

func _ready():
	score_label = $PanelContainer/HBoxContainer/ScoreContainer/Label
	length_label = $PanelContainer/HBoxContainer/LengthContainer/Label
	time_label = $PanelContainer/HBoxContainer/TimeContainer/Label
	_on_score_updated(0)
	_on_length_updated(0)
	time_label.text = "%s" % time_value

func _on_score_updated(score : int):
	score_label.text = "%s" % score
	pass
	
func _on_length_updated(length : int):
	length_label.text = "%s" % length
	pass
	
func _on_start_timer():
	$ClockTimer.start()
	pass
	
func _on_stop_timer():
	$ClockTimer.stop()
	end_time.emit(time_value)
	pass
	
func _on_timer_timeout():
	time_value += 1
	time_label.text = "%s" % time_value
	pass # Replace with function body.
