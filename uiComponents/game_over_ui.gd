extends Control

signal select_main_menu
signal select_play_again

const splashTexts = [
	"Better Luck Next Time.",
	"Annother One Bites The Dust.",
	"Not Quite An Ouroboros.",
	"I've Done Better.",
	"NEW HIGH SCORE! (maybe)",
	"You Made Your Mama Proud",
	"The Aim Is To AVOID Your Tail",
	"Nom Nom Nom Nom. OUCH!",
	"Upon your belly you shall go, \n and dust you will bite \n for all the days of your life.",
	"You Eat Ass",
	"Was That A JAZZ Snake?!",
	"I Can't Belive You Killed Gary."
	]
	
	
var SplashTextLabel : Label
var ApplesEatenLabel : Label
var LongestLengthLabel : Label
var TimeLabel : Label
var ScoreLabel : Label

# Called when the node enters the scene tree for the first time.
func _ready():
	SplashTextLabel = $PanelContainer/VBoxContainer/SplashTextLabel
	ApplesEatenLabel = $PanelContainer/VBoxContainer/GridContainer/ApplesEatenLabel
	LongestLengthLabel = $PanelContainer/VBoxContainer/GridContainer/LongestLengthLabel
	TimeLabel = $PanelContainer/VBoxContainer/GridContainer/TimeLabel
	ScoreLabel = $PanelContainer/VBoxContainer/GridContainer/ScoreLabel
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_main_menu_button_button_up():
	select_main_menu.emit()


func _on_play_again_button_button_up():
	select_play_again.emit()


func _on_durring_game_game_over(score, length, apples, time):
	SplashTextLabel.text = splashTexts.pick_random()
	#ApplesEatenLabel.text = "%s" % apples
	ApplesEatenLabel.text = "<working on it>"
	LongestLengthLabel.text = "%s" % length
	TimeLabel.text = "%.1f" % time
	ScoreLabel.text = "%s" % score
	
	pass # Replace with function body.
