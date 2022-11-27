extends KinematicBody2D

var velocity = Vector2(0,0)
var speed = 100
var counter = 0

signal damaged

func _on_Enemy_body_entered(body):
	print("Damaged!")
	emit_signal("damaged")

func _physics_process(_delta):
	counter += 1
	velocity.x = speed
	velocity = move_and_slide(velocity, Vector2.UP)
	if counter >= 100:
		speed *= -1
		counter = 0
