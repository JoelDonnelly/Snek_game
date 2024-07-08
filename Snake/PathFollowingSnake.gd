extends Node2D

@export var headFollowCurve: Curve2D
		
@export var bodySegs : int = 6

@export var bodyScene : PackedScene
@export var headScene : PackedScene



@export var travel_speed : float = 200

@export var delay : float = 0

func _ready():
	$Path2D.curve = headFollowCurve
	$SnakeTail.defaultBodySeg = bodyScene
	var headNode = headScene.instantiate()
	$Path2D/PathFollow2D.add_child(headNode)
	for i in bodySegs:
		$SnakeTail.add_snake_body()
	
	$Path2D/PathFollow2D.progress = -1*delay*travel_speed

func _process(delta):
	$Path2D/PathFollow2D.progress += travel_speed*delta
