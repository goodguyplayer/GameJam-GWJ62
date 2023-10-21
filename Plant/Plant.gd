extends Node2D

var current_type : PlantProperties
const DEFAULT_PLANT : PlantProperties = preload("res://Plant/Resources/no_plant.tres")
@onready var health_component = $HealthComponent
@onready var age = $Age

var is_alive = false

# Called when the node enters the scene tree for the first time.
func _ready():
	current_type = DEFAULT_PLANT


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func change_type(new_type):
	is_alive = true
	current_type = new_type
	health_component.update_all(current_type.plant_max_health)
	age.new_settings(current_type.plant_max_age)
	


func _on_age_reached_max_age():
	is_alive = false
	if current_type.plant_name != "None":
		GlobalSignals.score_update.emit(current_type.plant_score)
		current_type = DEFAULT_PLANT
	


func _on_health_component_died():
	is_alive = false
	current_type = DEFAULT_PLANT
	
