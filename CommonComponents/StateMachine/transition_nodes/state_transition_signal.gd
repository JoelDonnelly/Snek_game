extends StateTransition

class_name SignalTransition

func _on_signal():
	if transition_enabled:
		signal_recieved()

func enable():
	pass
	
func disable():
	pass

func signal_recieved():
	transition()
