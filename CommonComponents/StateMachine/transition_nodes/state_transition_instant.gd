extends StateTransition

class_name InstantTransition

func frame(_delta): pass
	
func physics_frame(_delta): pass
	
func enable(): 
	trigger_function()
	
func disable(): pass
	
func trigger_function():
	transition()
