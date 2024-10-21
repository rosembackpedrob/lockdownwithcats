extends Sprite2D

var veloc = 200
var posicaoX = 5
var chegou: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#moverEParar(delta)
	#chegouAgoraVolta(delta)
	
	#if Input.is_action_pressed("ui_right"):
	#	veloc = 0
	#if Input.is_action_just_released("ui_right"):
	#	veloc = 200
	
	movimentacao(delta)
	
	pass

func moverEParar(delta: float):
	position.x += posicaoX * veloc * delta
	#print(position.x)
	
	if (position.x >= 1700):
		#position.x = 1700;
		veloc = 0
		chegou = true

func chegouAgoraVolta(delta: float):
	if(chegou == true):
		print("CHEGUEI CARAI")
		chegou = false
		veloc -= 200

func movimentacao(delta: float):
	if Input.is_action_pressed("ui_right"):
		position.x += veloc * delta
		
	if Input.is_action_pressed("ui_left"):
		position.x -= veloc * delta
		
	if Input.is_action_pressed("ui_up"):
		position.y -= veloc * delta
		
	if Input.is_action_pressed("ui_down"):
		position.y += veloc * delta
