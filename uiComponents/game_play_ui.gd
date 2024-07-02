extends Control


var score_label : Label
var length_label : Label
var time_label : Label


func _ready():
	score_label = $PanelContainer/HBoxContainer/ScoreContainer/Label
	length_label = $PanelContainer/HBoxContainer/LengthContainer/Label
	time_label = $PanelContainer/HBoxContainer/TimeContainer/Label
	_on_score_updated(0)
	_on_length_updated(0)

func _on_score_updated(score : int):
	score_label.text = "%s" % score
	pass
	
func _on_length_updated(length : int):
	length_label.text = "%s" % length
	pass
	
func _on_time_updated(time : float):
	time_label.text = "%s" % time
	

