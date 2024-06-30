extends State

class_name StateMachine

@export var initial_state : State

# Called when the node enters the scene tree for the first time.
func _ready():
	if !initial_state:
		for child in get_children():
			if child is State:
				initial_state = child
				break
		if !initial_state:
			push_error("State Machine Has No States")
			return
	
	initial_state._enter()
