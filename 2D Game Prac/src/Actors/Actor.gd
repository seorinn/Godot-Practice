extends KinematicBody2D
class_name Actor

var FLOOR_NORMAL = Vector2.UP

export var speed = Vector2(300.0, 1000.0)
export var gravity = 3000.0

var velocity: = Vector2.ZERO

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
