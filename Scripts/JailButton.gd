extends Area2D

@export var catJail: Node2D
var buttonPressed :bool = false

func _ready() -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	if !buttonPressed && body.name == "Player" || body.is_in_group("Cats"):
		buttonPressed = true
		
		$AnimatedSprite2D.play("On") #animate button
		catJail.open_jail()
