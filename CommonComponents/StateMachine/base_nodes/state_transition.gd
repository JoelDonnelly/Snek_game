extends State

class_name StateTransition

signal trigger(state: State)


@export var to_state : State
var transition_enabled : bool = false


func _process(delta):
	if transition_enabled:
		frame(delta)
		
func frame(delta): pass
	
func _physics_process(delta):
	if transition_enabled:
		physics_frame(delta)
func physics_frame(delta): pass

func _on_state_entered(state):
	transition_enabled = true
	enable()
	
func enable(): pass
	
func _on_state_exited(state):
	transition_enabled = false
	disable()
		
func disable(): pass
	

func transition():
	trigger.emit(to_state)
	pass
	
	

