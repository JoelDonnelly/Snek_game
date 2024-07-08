@tool
extends Path2D

class_name PathCreator

@export_enum("Wave","Spiral") var path_type : String = "Wave":
	set(val):
		path_type = val
		remake_path()

@export var in_betweens : int = 8 :
	set(val):
		in_betweens = val
		remake_path()

@export var reverse_direction : bool = false:
	set(val):
		reverse_direction = val
		remake_path()
		
@export_group("Wave vars")
@export var preriod_dist : float = 100:
	set(val):
		preriod_dist = val
		remake_path()

@export var amp : float = 100:
	set(val):
		amp = val
		remake_path()

@export var length : float = 1000:
	set(val):
		length = val
		remake_path()

@export var theta_offset : float = 0:
	set(val):
		theta_offset = val
		remake_path()

@export_group("Spiral vars")
@export var max_radius : float = 100:
	set(val):
		max_radius = val
		remake_path()

@export var rotations : float = 5.0:
	set(val):
		rotations = val
		remake_path()
		
@export_enum("CLOCKWISE","COUNTERCLOCKWISE") var direction : String = "CLOCKWISE":
	set(val):
		direction = val
		remake_path()

	
func _ready():
	if !curve:
		curve = Curve2D.new()
	remake_path()

func remake_path():
	print("remake called")
	if curve:
		curve.clear_points()
	else:
		curve = Curve2D.new()

	if path_type == "Wave":
		remake_wave()
			
	if path_type == "Spiral":
		remake_spiral()
		
	if reverse_direction:
		var new_curve = Curve2D.new()
		var i_old = curve.point_count-1
		var point_0 = curve.get_point_position(i_old)
		while i_old >= 0:
			var invec = curve.get_point_out(i_old)
			var outvec = curve.get_point_in(i_old)
			var pvec = curve.get_point_position(i_old) - point_0
			new_curve.add_point(pvec, invec, outvec)
			i_old -= 1
		curve = new_curve
			
func remake_wave():
	var subDist = preriod_dist/in_betweens
	var l : float = 0
	while l < length:
		var v_pos : float = amp*sin(((2*PI)/preriod_dist)*l + theta_offset)
		var gradient = amp*((2*PI)/preriod_dist)*cos(((2*PI)/preriod_dist)*l + theta_offset)
		var invec = Vector2(-1,-gradient).normalized()*subDist/3
		var outvec = Vector2(1,gradient).normalized()*subDist/3
		
		var pvec = Vector2(l , v_pos)
		
		curve.add_point(pvec,invec,outvec)
		l += subDist
	
	pass

func remake_spiral():
	
	var sub_angles = 2*PI/in_betweens
	
	var sub_radius = max_radius/(rotations*in_betweens)
	
	var r = sub_radius
	var ang = sub_angles
	
	curve.add_point(Vector2.ZERO)
	
	var xInv = 1
	if direction == "COUNTERCLOCKWISE":
		xInv = -1
	var prev_pvec
	var pvec = Vector2.ZERO
	var next_pvec = (r)*Vector2(xInv*sin(ang),cos(ang))
	
	while r < max_radius:
		
		prev_pvec = pvec
		pvec = next_pvec
		next_pvec = (r+sub_radius)*Vector2(sin(xInv*(ang+sub_angles)),cos(ang+sub_angles))
		
		var invec = (prev_pvec-next_pvec).normalized()*r*sub_angles/3
		var outvec = (next_pvec-prev_pvec).normalized()*r*sub_angles/3
		#var invec = Vector2(-1,0).rotated(-ang)*r*sub_angles/3
		#var outvec = Vector2(1,0).rotated(-ang)*r*sub_angles/3
		
		curve.add_point(pvec, invec, outvec)
		
		r += sub_radius
		ang += sub_angles
	
			
	
	
	
