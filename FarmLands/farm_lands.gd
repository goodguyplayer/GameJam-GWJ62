extends Node2D

@onready var timer = $Timer
@onready var ui = $UI

@export var timer_night = [
	1,
	2,
	3,
	4
]

func _ready():
	GlobalSignals.night_time.connect(_night_time_warzone)


func _night_time_warzone():
	timer.start(20)
	ui.update_timer(20)
	


func _on_timer_timeout():
	GlobalSignals.day_time.emit()
