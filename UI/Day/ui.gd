extends CanvasLayer

@onready var money_number = $MarginContainer/Header/HBoxContainer/Money/VBoxContainer/MoneyNumber
@onready var days_number = $MarginContainer/Header/HBoxContainer/Days/VBoxContainer/DaysNumber
@onready var score_number = $MarginContainer/Header/HBoxContainer/Score/VBoxContainer/ScoreNumber
@onready var log_button = $MarginContainer/MarginContainer/HBoxContainer/LogButton
@onready var end_day = $MarginContainer/MarginContainer/HBoxContainer/EndDay

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignals.day_time.connect(_on_new_day)
	GlobalSignals.night_time.connect(_on_night_time)
	GlobalSignals.score_update.connect(_update_scoreboard)
	GlobalSignals.money_update.connect(_update_money)


func _on_new_day():
	days_number.text = str(DayStats.days_passed)
	log_button.visible = true
	end_day.visible = true


func _on_night_time():
	log_button.visible = false
	end_day.visible = false


func _update_scoreboard(score_points):
	score_number.text = str(score_points)
	

func _update_money(money_point):
	money_number.text = str(money_point)


func _on_log_button_pressed():
	pass # Replace with function body.


func _on_end_day_pressed():
	GlobalSignals.change_day.emit()
	GlobalSignals.night_time.emit()
