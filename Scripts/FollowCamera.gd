@tool
extends Camera2D

@export var background: Sprite2D

@export_group("New Limits")
@export var left_limit: int
@export var top_limit: int
@export var right_limit: int
@export var bottom_limit: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mapSize: Vector2 = background.get_texture().get_size()
	var mapScale: Vector2  = background.scale
	
	#the local vars of the Camera Node
	limit_right = int(mapSize.x * mapScale.x)
	limit_bottom = int(mapSize.y * mapScale.y)
	
	#updating the exported ones
	changeWhileRunning()
	
	print("mapsizes X and Y: ", mapSize.x, mapSize.y)
	
func changeWhileRunning() -> void:
	left_limit = limit_left
	top_limit = limit_right
	right_limit = limit_right
	bottom_limit = limit_bottom
