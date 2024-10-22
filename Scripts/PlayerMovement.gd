extends CharacterBody2D

@export var speed = 5
var speedMult = 100 	
@export var jump_speed = 400.0
@export var custom_gravity = 1000

var atk: bool = false


# Get the gravity from the project settings so you can sync with rigid body nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if Input.is_action_just_pressed("attack_1"):
		atk = true
		
	player_movement(delta)
	
func player_movement(delta) -> void:
	# Add gravity.
	if not is_on_floor():
		velocity.y += custom_gravity * delta
	
	# Get the input direction.
	var direction = Input.get_axis("move_left", "move_right")
	
	#applying movement
	velocity.x = direction * (speed * speedMult)
	flip_sprite(direction)
	animate_player(direction, velocity)
	
	# Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y -= jump_speed
		$AnimatedSprite2D.play("Jump")


	move_and_slide() #process all vars and apply the movement
	
func flip_sprite(direction):
	if direction == 1:
		$AnimatedSprite2D.flip_h = false
	elif direction == -1:
		$AnimatedSprite2D.flip_h = true
		
func animate_player(direction, velocity):
	if direction == 0 && is_on_floor():
		$AnimatedSprite2D.play("Idle")
	elif is_on_floor():
		$AnimatedSprite2D.play("Walk")
		
	if velocity.y > 0:
		$AnimatedSprite2D.play("Idle")
	
