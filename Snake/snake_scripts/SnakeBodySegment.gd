extends PathFollow2D

class_name snake_body_seg

var seg_num : int = 0 
@export var seg_pad : float = 10:
	set(value):
		seg_pad = value
		seg_size= seg_rad*2 + seg_pad
		
@export var seg_rad : float = 10:
	set(value):
		seg_rad = value
		seg_size = seg_rad*2 + seg_pad
var seg_size : float = seg_rad*2 + seg_pad

@export var wiggle_amp : float = 10

var t : float = 0:
	set(value):
		value = wrap(value,0,2*PI)
		_set_wiggle(value)
		t = value


func _ready():
	progress = seg_num*seg_size

func _process(_delta):
	progress = seg_num*seg_size
	
func _set_wiggle(theta):
	v_offset = sin(theta) * wiggle_amp


	
