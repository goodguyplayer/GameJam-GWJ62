extends CanvasLayer

@onready var money_number = $MarginContainer/Header/HBoxContainer/Money/VBoxContainer/MoneyNumber
@onready var days_number = $MarginContainer/Header/HBoxContainer/Days/VBoxContainer/DaysNumber
@onready var score_number = $MarginContainer/Header/HBoxContainer/Score/VBoxContainer/ScoreNumber

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignals.day_changed.connect(_on_new_day)


func _on_new_day():
	days_number.text = str(DayStats.days_passed)


func _on_log_button_pressed():
	pass # Replace with function body.


func _on_end_day_pressed():
	GlobalSignals.change_day.emit()
