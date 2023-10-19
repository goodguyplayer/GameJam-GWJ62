extends Node2D


@onready var marker_2d = $Marker2D
@onready var marker_2d_2 = $Marker2D2
@onready var marker_2d_3 = $Marker2D3
@onready var marker_2d_4 = $Marker2D4
@onready var marker_2d_5 = $Marker2D5
@onready var marker_2d_6 = $Marker2D6
@onready var to_spawn = preload("res://Enemy/zombie.tscn")
@onready var timer = $Timer

@onready var array_markers = [
	marker_2d,
	marker_2d_2,
	marker_2d_3,
	marker_2d_4,
	marker_2d_5,
	marker_2d_6,
]

@export var timer_spawn = 2
@export var active_flag = false
@export var timer_allows = true
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignals.day_time.connect(_disable_spawns)
	GlobalSignals.night_time.connect(_enable_spawns)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active_flag and timer_allows:
		var enemies_qty = rng.randi_range(1, 6)
		for i in range(enemies_qty):
			var enemy = to_spawn.instantiate()
			array_markers.shuffle()
			#var chosen_marker = rng.randi_range(0, 5)
			print(array_markers[0])
			enemy.position = array_markers[0].global_position
			get_tree().get_current_scene().add_child(enemy)
		timer_allows = false
		timer.start(timer_spawn)
		

func _enable_spawns():
	active_flag = true
	

func _disable_spawns():
	active_flag = false


func _on_timer_timeout():
	timer_allows = true
