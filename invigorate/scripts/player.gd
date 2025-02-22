extends CharacterBody2D

@onready var animated_player = $AnimatedSprite2D
@export var SPEED = 150
const DASH = 300
#var timer = Timer.new()
var tween : Tween
var dash_vel = 0.0
var can_dash = true

func dash_cooldown():
	var timer = get_tree().create_timer(0.75)
	timer.timeout.connect(dash_timeout)

func dash_timeout():
	can_dash = true

func read_input():
	if Input.is_action_just_pressed("Roll") && can_dash:
		dash_vel = DASH
		if tween:
			tween.stop()
		tween = create_tween()
		tween.tween_property(self, "dash_vel", 0, 0.3).set_ease(Tween.EASE_OUT)
		can_dash = false
		dash_cooldown()
	
	if Input.is_action_pressed("Down"):
		animated_player.play("front_walk")
	else:
		animated_player.stop()
	
	var input_dir = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_dir * (SPEED + dash_vel)

	
func _physics_process(delta):
	read_input()
	move_and_slide()
