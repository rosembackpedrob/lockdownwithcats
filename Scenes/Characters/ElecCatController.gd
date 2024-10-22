extends CharacterBody2D

func _process(delta: float) -> void:
	zap_attack()

func zap_attack():
	if Input.is_action_just_pressed("attack_1"):
		$AnimatedSprite.play("Attack")
		
	if Input.is_action_just_released("attack_1"):
		$AnimatedSprite.play("Idle")
