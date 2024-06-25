extends CharacterBody2D


signal feed

@export var speed : float = 300.0
@export var decelTime : float= 0.8
var decelSpeed : float = speed/decelTime

func collect(item : String) -> void:
	if item == "Apple":
		feed.emit()
	
func _process(_delta):
	$Polygon2D.rotation = velocity.angle() + PI/2

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Vector2(Input.get_axis("Left", "Right"), Input.get_axis("Up", "Down"))
	direction = direction.normalized()
	
	if direction:
		velocity = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, abs(velocity.normalized().x)*decelSpeed*delta) # linear sliding deceleration
		velocity.y = move_toward(velocity.y, 0, abs(velocity.normalized().y)*decelSpeed*delta) # linear sliding deceleration

	move_and_slide()
		
	
