extends Control


func _ready():
	GlobalSignals.night_time.connect(choose_weapon)


func choose_weapon():
	GlobalSignals.ammo_count_changed.emit(0)
	visible = true
	get_tree().paused = true


func _on_melee_choice_pressed():
	GlobalSignals.weapon_choice.emit(0)
	visible = false
	get_tree().paused = false


func _on_ranged_choice_pressed():
	GlobalSignals.weapon_choice.emit(1)
	visible = false
	get_tree().paused = false
