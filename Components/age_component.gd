extends Node2D

@export var max_age : int :
	set = set_max_age, get = get_max_age
@export var current_age : int :
	set = set_current_age, get = get_current_age

signal reached_max_age()

func _ready():
	GlobalSignals.day_time.connect(_update_age)
	initialize()


func initialize():
	current_age = 0
	

func new_settings(new_max):
	max_age = new_max
	current_age = 0


func set_max_age(value):
	max_age = value
	

func get_max_age():
	return max_age


func set_current_age(value):
	current_age = value
	

func get_current_age():
	return current_age
	

func _update_age():
	current_age += 1 
	print("{curr} - {max}".format({"curr": str(current_age), "max": str(max_age)}))
	if current_age >= max_age:
		print("Reached max age")
		reached_max_age.emit()
	
	
