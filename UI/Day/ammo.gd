extends Control

var ammo : int = 10 :
	set = set_ammo_count, get = get_ammo_count
	
@onready var ammo_display = $AmmoDisplay


func _ready():
	GlobalSignals.ammo_count_changed.connect(set_ammo_count)
	GlobalSignals.day_time.connect(_visible_day)
	GlobalSignals.night_time.connect(_visible_night)


func set_ammo_count(new_val):
	ammo = new_val
	ammo_display.size.x = ammo * 9
	

func get_ammo_count():
	return ammo


func _visible_night():
	visible = true
	

func _visible_day():
	visible = false
