extends Node

@export var inventory_array = [
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
] : 
	set = set_inventory_array, get = get_inventory_array


func set_inventory_array(new_array):
	inventory_array = new_array
	

func get_inventory_array():
	return inventory_array


func get_inventory_item(index):
	return inventory_array[index]
	

func add_to_inventory(index, value):
	inventory_array[index] += value
	

func substract_from_inventory(index):
	inventory_array[index] -= 1


func is_item_available(index):
	if inventory_array[index] > 0:
		return true
	return false
	
