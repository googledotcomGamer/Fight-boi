extends KinematicBody2D

var velocity = Vector2 (0,0)
const SPEED = 180
const GRAVITY = 30
const JUMPFORCE = -900

func _physics_process(delta):
	if Input.is_action_pressed("p2right"):
		velocity.x = SPEED
		$kentrup.flip_h = false
		
	if Input.is_action_pressed("p2left"):
		velocity.x = -SPEED
		$kentrup.flip_h = false
		
	if Input.is_action_just_pressed("p2right"):
		self.scale.x *= -1
	
	if Input.is_action_just_pressed("p2left"):
		self.scale.x *= -1
	
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("p2jump") and is_on_floor():
		velocity.y = JUMPFORCE
		
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)
	
	if Input.is_action_pressed("p2attack"):
		$AnimationPlayer.play("attack")
		
