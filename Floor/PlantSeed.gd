extends Control

var plant_types = [
	preload("res://Plant/Resources/brain.tres"),
	preload("res://Plant/Resources/eyes.tres"),
	preload("res://Plant/Resources/heart.tres"),
	preload("res://Plant/Resources/skull.tres"),
	preload("res://Plant/Resources/spine.tres"),
]
@onready var item_list = $ItemList

signal item_selected(plant_type : PlantProperties)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func get_data():
	item_list.set_item_text(0, "{val}x - Brain".format({"val": GeneralStats.get_inventory_item(0)}))
	item_list.set_item_text(1, "{val}x - Eyes".format({"val": GeneralStats.get_inventory_item(1)}))
	item_list.set_item_text(2, "{val}x - Heart".format({"val": GeneralStats.get_inventory_item(2)}))
	item_list.set_item_text(3, "{val}x - Skull".format({"val": GeneralStats.get_inventory_item(3)}))
	item_list.set_item_text(4, "{val}x - Spine".format({"val": GeneralStats.get_inventory_item(4)}))


func _on_close_pressed():
	visible = false


func _on_item_list_item_selected(index):
	if GeneralStats.is_item_available(index):
		item_selected.emit(plant_types[index])
		GeneralStats.substract_from_inventory(index)
		visible = false
