extends Node2D

@onready var timer = $Timer
@export var timer_night = 5

func _ready():
	GlobalSignals.night_time.connect(_night_time_warzone)


func _night_time_warzone():
	timer.start(timer_night)


func _on_timer_timeout():
	GlobalSignals.day_time.emit()
