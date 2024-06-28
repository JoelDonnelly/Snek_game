extends Node
class_name HealthComponent

signal out_of_health
signal healed(ammount : float)
signal damaged(ammount : float)
signal fully_healed

@export var max_health : float = 100

@export var health : float = 100:
	set(val):
		health = val
		if health <= 0: 
			out_of_health.emit()
		if health >= max_health: fully_healed.emit()

func recieve_damage(damage : float, allow_over_flow : bool = false) -> void:
	var damage_applied = damage
	if allow_over_flow == false:
		damage_applied = min(damage, health)
	health -= damage_applied
	damaged.emit(damage_applied)

func recieve_healing(heal : float, allow_over_flow : bool = false) -> void:
	var heal_applied = heal
	if allow_over_flow == false:
		heal_applied = min(heal, max_health-health)
	health += heal_applied
	healed.emit(heal_applied)
	
func set_health(value : float) -> void:
	if value > health:
		healed.emit(value-health)
	elif value < health:
		damaged.emit(health-value)
	health = value

func get_percent() -> float:
	return (health/max_health)

func get_health() -> float:
	return health
func get_slash_string() -> String:
	return "%s/%s" % [health, max_health]
