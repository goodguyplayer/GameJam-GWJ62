extends Control


func _ready():
	GlobalSignals.night_time.connect(choose_weapon)


func choose_weapon():
	visible = true


func _on_melee_choice_pressed():
	GlobalSignals.weapon_choice.emit(0)
	visible = false


func _on_ranged_choice_pressed():
	GlobalSignals.weapon_choice.emit(1)
	visible = false
