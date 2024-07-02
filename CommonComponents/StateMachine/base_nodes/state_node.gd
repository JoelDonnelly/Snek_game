extends State

class_name StateNode

signal entered(state : State)
signal exited(state : State)

var active : bool = false:
	set(val):
		active = val
		print("setting Processes %s" % val)
		set_process(active)
		set_physics_process(active)
		

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is StateTransition:
			child.trigger.connect(_on_state_transition_trigger)
			entered.connect(child._on_state_entered)
			exited.connect(child._on_state_exited)
	set_process(active)
	set_physics_process(active)

func _enter():
	print("[%s] entered" % name)
	active = true
	entered.emit(self)
	enter()

func enter():
	pass
	
func _exit():
	active = false
	exited.emit(self)
	exit()
	print("[%s] exited" % name)
	
func exit():
	pass

func _on_state_transition_trigger(to_state : State):
	self._exit()
	to_state._enter()
	
