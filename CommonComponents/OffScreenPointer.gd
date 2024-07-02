extends Polygon2D

@export var node : VisibleOnScreenNotifier2D
@export var only_when_off_screen : bool = true
@export var on_screen_rot : float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if !node:
		self.queue_free()
		return
		
	node.screen_entered.connect(_node_entered_screen)
	node.screen_exited.connect(_node_exited_screen)
	print("ready_finished")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !(node.is_on_screen() && only_when_off_screen):
		position = node.global_position
		position = position.clamp(Vector2.ZERO , get_viewport_rect().size )
		if !node.is_on_screen():
			rotation = self.position.angle_to_point(node.global_position) - PI/2
		else:
			rotation = on_screen_rot

func _node_entered_screen():
	print("entered screen")
	if only_when_off_screen:
		visible = false
		
func _node_exited_screen():
	print("exited screen")
	visible = true


