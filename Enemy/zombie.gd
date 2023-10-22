extends CharacterBody2D


const SPEED = 100.0
const TIMER_FLICKER : float = 1.2


@onready var timer = $Timer
@onready var hurtbox = $Hurtbox
@onready var progress_bar = $ProgressBar
@onready var animation_tree = $AnimationTree
@onready var animation_player = $AnimationPlayer
@onready var health_component = $HealthComponent
@onready var detection_area = $DetectionArea

var track_it : Area2D = null
var rng = RandomNumberGenerator.new()
# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	GlobalSignals.day_time.connect(_end_it_all)
	animation_player.play("idle")


func _physics_process(delta):
	if track_it != null:
		var direction = track_it.global_position - global_position
		velocity = velocity.move_toward(direction * SPEED, delta)
		move_and_slide()

	
func _on_die_animation_finished():
	queue_free()


func _on_health_component_died():
	var new_item = rng.randi_range(0, 11)
	GeneralStats.add_to_inventory(new_item, 1)
	animation_player.play("die")


func _end_it_all():
	queue_free()


func _on_health_component_hurt(new_health):
	progress_bar.visible = true
	progress_bar.value = new_health


func _on_detection_area_area_entered(area):
	detection_area.visible = false
	track_it = area
	


func _on_attack_area_area_entered(area):
	animation_player.play("attack")
