extends Node2D

@onready var animation_tree = $AnimationTree
@onready var animation_player = $AnimationPlayer
@export var ammo : int = 0
@export var max_ammo : int = 10
@export var damage : int = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	attack()


func attack():
	if ammo != 0:	
		animation_player.play("attack")
