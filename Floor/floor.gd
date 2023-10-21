extends Node2D

@export var floor_properties : FloorProperty = preload("res://Floor/Resources/Default.tres")
@onready var plant_seed = $PlantSeed
@onready var plant_status = $PlantStatus
@onready var plant = $Plant
@onready var click_area = $Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignals.day_time.connect(_enable_clickbox_nighttime)
	GlobalSignals.night_time.connect(_disable_clickbox_nighttime)



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


func _disable_clickbox_nighttime():
	click_area.visible = false
	

func _enable_clickbox_nighttime():
	click_area.visible = true
