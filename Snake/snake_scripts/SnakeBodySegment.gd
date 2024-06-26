extends PathFollow2D

@export var seg_num : int = 0 
@export var seg_pad : float = 10
@export var seg_rad : float = 10
var seg_size : float = seg_rad*2 + seg_pad
var prevPos : Vector2 = Vector2.ZERO

@export var wiggle_amp : float = 10
@export var wiggle_ratio : float = 0.05
var t = 0

func _ready():
	$StaticBody2D/CollisionShape2D.shape.radius = seg_rad
	progress = seg_num*seg_size

func _process(_delta):
	progress = seg_num*seg_size
	v_offset = 0
	t += position.distance_to(prevPos)*wiggle_ratio
	t = wrap(t, 0, 360)
	prevPos = position
	v_offset = sin(t) * wiggle_amp
	
	
	pass
