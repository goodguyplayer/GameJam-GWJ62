extends Control

@onready var name_seed = $Name
@onready var age_plant = $Age
@onready var seed_type = $SeedType
@onready var health = $Health
@onready var internal_health = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func update_status(plant, age :int):
	name_seed.text = plant.current_type.plant_name
	age_plant.text = "Age.: {age}".format({"age": str(plant.age)})
	seed_type.text = "Seed.: {seed}".format({"seed":plant.current_type.plant_type})
	health.text = "Health.: {internal_health}".format({"internal_health":internal_health})


func _on_close_pressed():
	visible = false
