extends Control

var plant_types = [
	preload("res://Plant/Resources/artichoke.tres"), 
	preload("res://Plant/Resources/broccoli.tres"), 
	preload("res://Plant/Resources/carrot.tres"), 
	preload("res://Plant/Resources/green_beans.tres"), 
	preload("res://Plant/Resources/kale.tres"), 
	preload("res://Plant/Resources/lettuce.tres"), 
	preload("res://Plant/Resources/onion.tres"), 
	preload("res://Plant/Resources/peas.tres"), 
	preload("res://Plant/Resources/pepper.tres"), 
	preload("res://Plant/Resources/pumpkin.tres"), 
	preload("res://Plant/Resources/sweet_potato.tres"), 
	preload("res://Plant/Resources/tomato.tres")
]
@onready var item_list = $ItemList

signal item_selected(plant_type : PlantProperties)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func get_data():
	item_list.set_item_text(0, '{val}x - Artichoke'.format({'val':GeneralStats.get_inventory_item(0)}))
	item_list.set_item_text(1, '{val}x - Broccoli'.format({'val':GeneralStats.get_inventory_item(1)}))
	item_list.set_item_text(2, '{val}x - Carrot'.format({'val':GeneralStats.get_inventory_item(2)}))
	item_list.set_item_text(3, '{val}x - Green Beans'.format({'val':GeneralStats.get_inventory_item(3)}))
	item_list.set_item_text(4, '{val}x - Kale'.format({'val':GeneralStats.get_inventory_item(4)}))
	item_list.set_item_text(5, '{val}x - Lettuce'.format({'val':GeneralStats.get_inventory_item(5)}))
	item_list.set_item_text(6, '{val}x - Onion'.format({'val':GeneralStats.get_inventory_item(6)}))
	item_list.set_item_text(7, '{val}x - Peas'.format({'val':GeneralStats.get_inventory_item(7)}))
	item_list.set_item_text(8, '{val}x - Pepper'.format({'val':GeneralStats.get_inventory_item(8)}))
	item_list.set_item_text(9, '{val}x - Pumpkin'.format({'val':GeneralStats.get_inventory_item(9)}))
	item_list.set_item_text(10, '{val}x - Sweet Potato'.format({'val':GeneralStats.get_inventory_item(10)}))
	item_list.set_item_text(11, '{val}x - Tomato'.format({'val':GeneralStats.get_inventory_item(11)}))



func _on_close_pressed():
	visible = false


func _on_item_list_item_selected(index):
	if GeneralStats.is_item_available(index):
		item_selected.emit(plant_types[index])
		GeneralStats.substract_from_inventory(index)
		visible = false
