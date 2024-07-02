extends State

class_name StateTransition

signal trigger(state: StateNode)


@export var to_state : StateNode
var transition_enabled : bool = false


func _process(delta):
	if transition_enabled:
		frame(delta)
		
func frame(_delta): pass
	
func _physics_process(delta):
	if transition_enabled:
		physics_frame(delta)

func physics_frame(_delta): pass

func _on_state_entered(_state):
	transition_enabled = true
	enable()
	
func enable(): pass
	
func _on_state_exited(_state):
	transition_enabled = false
	disable()
		
func disable(): pass
	

func transition():
	trigger.emit(to_state)
	pass
	
	

