extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const TIMER_FLICKER : float = 1.2


var health : int = 10
var damage : int = 1

@onready var timer = $Timer
@onready var hurtbox = $Hurtbox
@onready var progress_bar = $ProgressBar
@onready var animation_tree = $AnimationTree
@onready var animation_player = $AnimationPlayer

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	pass



func _on_hurtbox_area_entered(area):
	health = max(health-5, 0)
	if health == 0:
		animation_player.play("die")
	else:
		progress_bar.visible = true
		hurtbox.set_deferred("monitoring", false)
		progress_bar.value = health
		timer.start(TIMER_FLICKER)
	


func _on_timer_timeout():
	hurtbox.set_deferred("monitoring", true)
	

func _on_die_animation_finished():
	queue_free()
