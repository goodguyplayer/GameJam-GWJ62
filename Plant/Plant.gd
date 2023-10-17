extends Node2D

var current_type : PlantProperties
var health : int = 100
var age : int = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func change_type(new_type):
	current_type = new_type
