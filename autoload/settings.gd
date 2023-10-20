extends Node

var theme = preload("res://Menus/Fonts/font_theme.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignals.change_theme_font.connect(_theme_font_change)




func _theme_font_change(theme_font):
	theme.set_font("BBesque", "", theme_font)
