extends Node

enum DayType {DAY, NIGHT} 
@export var current_time : DayType = DayType.DAY :
	get: 
		return current_time
	set(value): 
		current_time = value
	
@export var days_passed : int = 1 : 
	set(value): days_passed = value
	get: return days_passed 
@export var night_passed : int = 1 :
	set(value): night_passed = value
	get: return night_passed 


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignals.change_day.connect(_change_day)


func _change_day():
	if current_time == DayType.DAY:
		days_passed += 1
		current_time = DayType.NIGHT
	else:
		night_passed += 1
		current_time = DayType.DAY
		GlobalSignals.day_changed.emit()
