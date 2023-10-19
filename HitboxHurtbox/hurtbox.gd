extends Area2D

@export var health_status : Node2D

signal damaged()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_area_entered(area):
	if health_status != null:
		health_status.damage(area.attack_object.damage)
		emit_signal("damaged")
