extends Node2D

@export var max_health : int :
	set = set_max_health, get = get_max_health
@export var current_health : int :
	set = set_current_health, get = get_current_health
signal died()

# Called when the node enters the scene tree for the first time.
func _ready():
	initialize()


func initialize():
	current_health = max_health
	

func set_max_health(new_health):
	max_health = new_health
	
	
func get_max_health():
	return max_health
	

func set_current_health(new_health):
	current_health = new_health
	
	
func get_current_health():
	return current_health
	

func damage(damage_val):
	current_health -= damage_val
	if current_health <= 0:
		emit_signal("died")


func heal(healing_val):
	current_health = clamp(healing_val + current_health, 1, max_health)