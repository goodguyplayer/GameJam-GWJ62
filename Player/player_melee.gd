extends Node2D

@onready var animation_tree = $AnimationTree
@onready var animation_player = $AnimationPlayer
@export var damage : int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func reload():
	pass


func attack():
	animation_player.play("attack")
	


func attack_stop():
	animation_player.play("idle")
