extends Node2D

@onready var player_melee = $PlayerMelee
@onready var player_ranged = $PlayerRanged
var current
var day_time_flag = true

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignals.day_time.connect(day_time)
	GlobalSignals.weapon_choice.connect(night_time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = get_global_mouse_position()
	if not day_time_flag:
		if Input.is_action_pressed("mouse_click"):
			current.attack()


func night_time(melee_ranged):
	if melee_ranged == 0: # 0 - Melee, 1 - ranged
		current = melee_ranged
		player_melee.visible = (true)
	else:
		current = player_ranged
		player_ranged.visible = (true)
		

func day_time():
	player_melee.visible = false
	player_ranged.visible = false
