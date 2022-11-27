extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()
var points = 0
var health
var collectibles = 15

func get_input():
	velocity = Vector2()
# set velocity based on the keys pressed
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
# use normalized vector (length = 1) so that the velocity 
# is calculated correctly based on the speed.
	velocity = velocity.normalized() * speed
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

		
func _ready():	
	$Label3.visible = false;
	randomize()
	health = randi() % 101 + 100
	$Label/Label.set_text(str(points))
	$Label2/Label.set_text(str(health))
	$Label.set_as_toplevel(true)
	$Label2.set_as_toplevel(true)
	$Label3.set_as_toplevel(true)
	
func _on_Heart_body_entered(body):
	health += 10
	collectibles -= 1
	$Label2/Label.set_text(str(health))
	print("Picked a heart! Health: " + str(health))
	if collectibles == 0:
		get_tree().paused = true
		$Label3.visible = true
	
func _on_Star_body_entered(body):
	points += 50
	$Label/Label.set_text(str(points))
	collectibles -= 1
	print("Picked a star! Points: " + str(points))
	if collectibles == 0:
		get_tree().paused = true
		$Label3.visible = true

func _on_Light_body_entered(body):
	speed *= 2	
	collectibles -= 1
	yield(get_tree().create_timer(1.0), "timeout")
	speed *= 0.5
	if collectibles == 0:
		get_tree().paused = true
		$Label3.visible = true

func _on_Enemy_damaged():
	print("You were hit by the enemy!")
	health -= 30
	$Label2/Label.set_text(str(health))
	if health <= 0:
		health = 0		
		$Label2/Label.set_text(str(health))
		get_tree().paused = true
		$Label3.visible = true
