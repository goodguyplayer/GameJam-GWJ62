extends Control

@onready var build_version = $Title/MarginContainer/HBoxContainer2/HBoxContainer/Subtitle2

func _ready():
	$Buttons/MarginContainer/VBoxContainer/Start.grab_focus()
	if OS.has_feature("debug"):
		build_version.text = "Debug mode activated"
	elif OS.has_feature("release"):
		if OS.has_feature("Windows"):
			build_version.text = "v0.1 - Build Version - Windows - Boring but works"
		if OS.has_feature("X11"):
			build_version.text = "v0.1 - Build Version - Linux - I don't use Arch BTW"
		if OS.has_feature("OSX"):
			build_version.text = "v0.1 - Build Version - macOS - But why tho"
		if OS.has_feature("HTML5"):
			build_version.text = "v0.1 - Build Version - Web Browser - As long as it works..."



func _on_start_pressed():
	get_tree().change_scene_to_file("res://FarmLands/farm_lands.tscn")


func _on_options_pressed():
	pass # Replace with function body.


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://Menus/credits.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _on_endless_pressed():
	pass # Replace with function body.
