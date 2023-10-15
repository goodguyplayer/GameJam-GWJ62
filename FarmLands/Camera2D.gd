extends Camera2D

var _target_zoom : float = 1.0
const MIN_ZOOM : float = 0.1
const MAX_ZOOM: float = 1.0
const ZOOM_INCREMENT : float = 1.0
const ZOOM_RATE: float = 8.0

func _physics_process(delta) -> void:
	zoom = lerp(
		zoom,
		_target_zoom * Vector2.ONE,
		ZOOM_RATE * delta
	)
	set_physics_process(
		not is_equal_approx(zoom.x, _target_zoom)
	)



func _unhandled_input(event) -> void:
	if event is InputEventMouseMotion:
		if event.button_mask == MOUSE_BUTTON_MASK_MIDDLE:
			position -= event.relative * zoom
	
	if event is InputEventMouse:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom_in()
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom_out()

				

func zoom_in() -> void:
	_target_zoom = max(_target_zoom - ZOOM_INCREMENT, MIN_ZOOM)
	set_physics_process(true)
	
	
func zoom_out() -> void:
	_target_zoom = min(_target_zoom + ZOOM_INCREMENT, MAX_ZOOM)
	set_physics_process(true)


