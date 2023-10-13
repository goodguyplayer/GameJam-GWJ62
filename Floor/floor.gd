extends Node2D

@export var floor_properties : FloorProperty = preload("res://Floor/Resources/Default.tres")
@export var plant_used : PlantProperties = preload("res://Plant/Resources/no_plant.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignals.day_changed.connect(_update_seeds_new_day)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _update_seeds_new_day():
	if plant_used.plant_current_age == plant_used.plant_max_age:
		pass # Kill plant
	else:
		pass 
