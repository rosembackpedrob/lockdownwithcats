@tool
extends Area2D

@export var Player: Node2D
@export var doorNode: Node2D


@export var doorOpen: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func open_door():
	if !doorOpen:
		doorOpen = true
		doorNode.play("Opening")
	
	#$AnimatedSprite.play("On")#animate panel
		

func _on_body_entered(body: Node2D) -> void:
	if !doorOpen && body.name == "Player" && Player.atk:
		open_door()
	pass # Replace with function body.
