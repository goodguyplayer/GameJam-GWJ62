extends CheckButton

var font_new = preload("res://Menus/Fonts/BBSesque.ttf")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	GlobalSignals.change_theme_font.emit(font_new)
