extends CharacterBody2D

class_name SnakeHeadSeg

signal feed

@export var max_speed : float = 300.0
@export var accelTime : float = 0.8
@export var decelTime : float = 0.8
var decelSpeed : float = max_speed/decelTime
var accelSpeed : float = max_speed/accelTime

@export var rot_speed_deg : float = 60.0
@export var const_rad_rot : bool = true

var speed : float = 0.0
var rot : float = 0.0

func collect(item : String) -> void:
	if item == "Apple":
		feed.emit()
		
func attack() -> float:
	return 30.0
	
func _process(_delta):
	$Polygon2D.rotation = rot

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	var direction = Vector2( Input.get_axis("Down", "Up"), Input.get_axis("Left", "Right"))
	
	if direction:
		speed = move_toward(speed, max_speed, accelSpeed*delta)
		var desired_angle = direction.angle()
		var rot_delta = delta*deg_to_rad(rot_speed_deg)
		if const_rad_rot:
			rot_delta *= (speed/max_speed)
		rot = rotate_toward(rot, desired_angle, rot_delta)
	else:
		speed = move_toward(speed, 0, decelSpeed*delta)

	velocity = Vector2(speed,0).rotated(rot - PI/2)
	move_and_slide()
		
func hit_by(body):
	if body.get_parent() is SnakeBodySeg:
		print("head hit by body")
		var damage = body.get_parent().attack()
		$Health.recieve_damage(damage)
	elif body.get_parent() is SnakeHeadSeg:
		print("head hit by head")
		var damage = body.get_parent().attack()
		$Health.recieve_damage(damage)
	pass # Replace with function body.
	
