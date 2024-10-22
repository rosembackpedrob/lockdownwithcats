@tool
extends StaticBody2D

@export var catToSpawn: PackedScene
@export var player: Node2D  # Adjust the path to your player node

var spawnPosition: Vector2

func _ready() -> void:
	spawnPosition = position
	

#func _process(delta: float) -> void:
#	hide()
	
func open_jail() -> void:
	#disable collision
	collision_layer = 0
	collision_mask = 0
	
	spawn_cat()
	
func spawn_cat():
	if catToSpawn: #check if is assigned
		var cat_instance = catToSpawn.instantiate()
		cat_instance.position = Vector2(0, -180)
		cat_instance.z_index = -1  # Set a higher z_index to render it on top of the player

		player.add_child(cat_instance)
		print("Cat Instantiated")
		
	else:
		print("No cat scene assigned.")


func _on_door_animation_finished() -> void:
	pass # Replace with function body.
