extends Node2D

@onready var timer = $Timer
@onready var ui = $UI
@onready var sprite_2d = $Sprite2D
@onready var day_texture = preload("res://FarmLands/back.png")
@onready var night_texture = preload("res://FarmLands/stage-preview.png")
@export var timer_night = [
	1,
	2,
	3,
	4
]

func _ready():
	GlobalSignals.night_time.connect(_night_time_warzone)
	GlobalSignals.day_time.connect(_on_day_time)
	GlobalSignals.night_time.connect(_on_night_time)


func _night_time_warzone():
	timer.start(20)
	ui.update_timer(20)
	


func _on_timer_timeout():
	GlobalSignals.day_time.emit()


func _on_day_time():
	sprite_2d.texture = day_texture


func _on_night_time():
	sprite_2d.texture = night_texture
