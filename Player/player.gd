extends Node2D

@onready var player_melee = $PlayerMelee
@onready var player_ranged = $PlayerRanged
@onready var current
@export var day_time_flag = true

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignals.day_time.connect(day_time)
	GlobalSignals.weapon_choice.connect(night_time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = get_global_mouse_position()
	if not day_time_flag:
		if Input.is_action_just_pressed("mouse_click"):
			current.attack()
		if Input.is_action_just_pressed("reload"):
			current.reload()


func night_time(melee_ranged):
	day_time_flag = false
	if melee_ranged == 0: # 0 - Melee, 1 - ranged
		current = player_melee
		player_melee.visible = (true)
	else:
		current = player_ranged
		player_ranged.visible = (true)
		GlobalSignals.ammo_count_changed.emit(10)
		

func day_time():
	player_melee.visible = false
	player_ranged.visible = false
