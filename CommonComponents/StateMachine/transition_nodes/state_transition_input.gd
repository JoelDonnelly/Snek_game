extends StateTransition

class_name InputTransition


@export var input : StringName
@export var on_press : bool = true
@export var if_pressed : bool = false
@export var on_release : bool = false
@export var if_released : bool = false

func physics_frame(_delta):
	if InputMap.has_action(input):
		if Input.is_action_just_pressed(input) && on_press:
			input_entered()
		elif Input.is_action_just_released(input) && on_release:
			input_entered()
		elif Input.is_action_pressed(input) && if_pressed:
			input_entered()
		elif not(Input.is_action_pressed(input)) && if_released:
			input_entered()
	else:
		push_error("Input transition input does not exist")
	
func enable():
	pass
	
func disable():
	pass

func input_entered():
	transition()

