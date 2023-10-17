extends Node2D

@export var floor_properties : FloorProperty = preload("res://Floor/Resources/Default.tres")
@export var plant_used : PlantProperties
@export var internal_timer : int = 0
@onready var plant_seed = $PlantSeed
@onready var plant_status = $PlantStatus
@onready var plant = $Plant


const DEFAULT_PLANT :String = "res://Plant/Resources/no_plant.tres"

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignals.day_changed.connect(_update_seeds_new_day)


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


func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("mouse_click"):
			if plant_used.plant_name == "None":
				plant_seed.visible = true
			else:
				plant_status.update_status(plant, internal_timer)
				plant_status.visible = true



func _on_plant_seed_item_selected(plant_type):
	plant_used = plant_type
	plant.change_type(plant_type)
