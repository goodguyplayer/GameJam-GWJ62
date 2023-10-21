extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const TIMER_FLICKER : float = 1.2


@onready var timer = $Timer
@onready var hurtbox = $Hurtbox
@onready var progress_bar = $ProgressBar
@onready var animation_tree = $AnimationTree
@onready var animation_player = $AnimationPlayer
@onready var health_component = $HealthComponent

var rng = RandomNumberGenerator.new()
# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	GlobalSignals.day_time.connect(_end_it_all)


func _physics_process(delta):
	move_and_slide()

	
func _on_die_animation_finished():
	queue_free()


func _on_health_component_died():
	var new_item = rng.randi_range(0, 4)
	GeneralStats.add_to_inventory(new_item, 1)
	animation_player.play("die")


func _end_it_all():
	queue_free()


func _on_health_component_hurt(new_health):
	progress_bar.visible = true
	progress_bar.value = new_health
