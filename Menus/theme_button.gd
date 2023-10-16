extends CheckButton

var font_new = preload("res://Menus/Fonts/BBSesque.ttf")
# Called when the node enters the scene tree for the first time.

func _on_pressed():
	GlobalSignals.change_theme_font.emit(font_new)
