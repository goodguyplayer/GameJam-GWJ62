extends CanvasLayer

@onready var timer_label = $MarginContainer/Header/HBoxContainer/Money/VBoxContainer/Label
@onready var time_left = $MarginContainer/Header/HBoxContainer/Money/VBoxContainer/TimeLeft
@onready var days_number = $MarginContainer/Header/HBoxContainer/Days/VBoxContainer/DaysNumber
@onready var score_number = $MarginContainer/Header/HBoxContainer/Score/VBoxContainer/ScoreNumber
@onready var log_button = $MarginContainer/MarginContainer/HBoxContainer/LogButton
@onready var end_day = $MarginContainer/MarginContainer/HBoxContainer/EndDay
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignals.day_time.connect(_on_new_day)
	GlobalSignals.night_time.connect(_on_night_time)
	GlobalSignals.score_update.connect(_update_scoreboard)


func _on_new_day():
	days_number.text = str(DayStats.days_passed)
	log_button.visible = true
	end_day.visible = true
	timer_label.visible = false
	time_left.visible = false
	timer.autostart = false


func _on_night_time():
	log_button.visible = false
	end_day.visible = false


func _update_scoreboard(score_points):
	score_number.text = str(score_points + int(score_number.text))
	

func update_timer(time_point):
	time_left.max_value = time_point
	time_left.value = time_point
	timer_label.visible = true
	time_left.visible = true
	timer.start()
	timer.autostart = true



func _on_log_button_pressed():
	pass # Replace with function body.


func _on_end_day_pressed():
	GlobalSignals.change_day.emit()
	GlobalSignals.night_time.emit()


func _on_timer_timeout():
	time_left.value = int(time_left.value) - 1
