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

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	move_and_slide()


func _on_timer_timeout():
	hurtbox.set_deferred("monitoring", true)
	

func _on_die_animation_finished():
	queue_free()


func _on_hurtbox_damaged():
	print(health_component.current_health)


func _on_health_component_died():
	animation_player.play("die")
