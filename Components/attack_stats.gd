extends Node2D

@export var damage : int :
	set = set_damage, get = get_damage
@export var attack_type : int :
	set = set_attack_type, get = get_attack_type


func set_damage(new_damage):
	damage = new_damage
	

func get_damage():
	return damage
	

func set_attack_type(new_attack_type):
	attack_type = new_attack_type
	

func get_attack_type():
	return attack_type
