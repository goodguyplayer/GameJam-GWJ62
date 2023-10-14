extends Node2D

@export var floor_properties : FloorProperty = preload("res://Floor/Resources/Default.tres")
@export var plant_used : PlantProperties
@export var internal_timer : int = 0
const DEFAULT_PLANT :String = "res://Plant/Resources/no_plant.tres"

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignals.day_changed.connect(_update_seeds_new_day)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _update_seeds_new_day():
	if plant_used.plant_max_age != -1:
		if internal_timer == plant_used.plant_max_age:
			internal_timer = 0
			plant_used = preload(DEFAULT_PLANT)
			print("Your plant has died! Oh yes!")
			pass # Kill plant
		else:
			internal_timer += 1
			print("{name}:{days} days have passed for this plant!".format({"days": internal_timer, "name": name})) 
