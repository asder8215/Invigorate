extends CharacterBody2D


@export var speed = 150

func read_input():
	var input_dir = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_dir * speed
	
func _physics_process(delta):
	read_input()
	move_and_slide()
