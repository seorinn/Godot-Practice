extends Area2D

func _on_Star_body_entered(body):
	if body is KinematicBody2D:
		queue_free()
