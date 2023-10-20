extends Node2D

@export var floor_properties : FloorProperty = preload("res://Floor/Resources/Default.tres")
@onready var plant_seed = $PlantSeed
@onready var plant_status = $PlantStatus
@onready var plant = $Plant


# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("mouse_click"):
			if plant.is_alive:
				plant_status.update_status(plant)
				plant_status.visible = true
			else:
				plant_seed.visible = true



func _on_plant_seed_item_selected(plant_type):
	plant.change_type(plant_type)
