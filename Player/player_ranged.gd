extends Node2D

@onready var animation_tree = $AnimationTree
@onready var animation_player = $AnimationPlayer
@export var ammo : int = 10
@export var max_ammo : int = 10
@export var damage : int = 7

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func reload():
	#animation_player.play("reload")
	ammo = max_ammo
	GlobalSignals.ammo_count_changed.emit(ammo)


func attack():
	if ammo != 0:	
		animation_player.play("attack")
		ammo = ammo - 1
		GlobalSignals.ammo_count_changed.emit(ammo)
		
		
func attack_stop():
	animation_player.play("idle")
