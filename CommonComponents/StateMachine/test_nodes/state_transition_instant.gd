extends StateTransition

class_name InstantTransition

func frame(delta): pass
	
func physics_frame(delta): pass
	
func enable(): 
	trigger_function()
	
func disable(): pass
	
func trigger_function():
	transition()
