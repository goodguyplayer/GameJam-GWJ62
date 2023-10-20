extends Node2D

var current_type : PlantProperties
@onready var health_component = $HealthComponent
@onready var age = $Age

var is_alive = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func change_type(new_type):
	is_alive = true
	current_type = new_type
	health_component.update_all(current_type.plant_max_health)
	


func _on_age_reached_max_age():
	is_alive = false


func _on_health_component_died():
	is_alive = false
