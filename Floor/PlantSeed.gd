extends Control

var plant_types = [
	preload("res://Plant/Resources/brain.tres"),
	preload("res://Plant/Resources/eyes.tres"),
	preload("res://Plant/Resources/heart.tres"),
	preload("res://Plant/Resources/skull.tres"),
	preload("res://Plant/Resources/spine.tres"),
]

signal item_selected(plant_type : PlantProperties)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_close_pressed():
	visible = false


func _on_item_list_item_selected(index):
	item_selected.emit(plant_types[index])
	visible = false
