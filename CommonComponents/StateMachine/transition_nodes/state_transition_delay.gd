extends StateTransition

class_name DelayTransition


@export var delay : float = 1.0
@export var process_always : bool = false
@export var physics_process : bool = true
@export var ignore_time_scale : bool = false

var timer : SceneTreeTimer
	
func enable():
	timer = get_tree().create_timer(delay, process_always, physics_process, ignore_time_scale)
	timer.timeout.connect(delay_expired)
	
func disable():
	timer.timeout.disconnect(delay_expired)
	timer.unreference()

func delay_expired():
	transition()

