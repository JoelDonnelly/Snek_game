extends Control


@export var score_node : ScoreComponent
@export var length_node : ScoreComponent
@export var time_node : ScoreComponentFloat

var score_label : Label
var length_label : Label
var time_label : Label


func _ready():
	score_label = $PanelContainer/HBoxContainer/ScoreContainer/Label
	length_label = $PanelContainer/HBoxContainer/LengthContainer/Label
	time_label = $PanelContainer/HBoxContainer/TimeContainer/Label
	score_node.scoreChanged.connect(_on_score_updated)
	length_node.scoreChanged.connect(_on_length_updated)
	_on_score_updated(score_node.score)
	_on_length_updated(length_node.score)

func _on_score_updated(score : int):
	score_label.text = "%s" % score
	
func _on_length_updated(length : int):
	length_label.text = "%s" % length
	
func _on_time_updated(time : float):
	time_label.text = "%.1f" % time
	

