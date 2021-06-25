extends KinematicBody2D

const MASS = 5
const MAX_SPEED = 500
const ACELERACION = 1000
const DESACELERACION = 2000
const VIDAS = 5

var speed: float = 175

var motion := Vector2()
var target_motion := Vector2()
var direction := Vector2()
var steering := Vector2()
var distance = Vector2()
var velocity = Vector2()
var gravity = 250
var jump_speed = 300
var derecha = true
var izquierda = true
var saltos = 2

var mov = false

func _ready():
	$Personaje.play()
	position = Vector2(600,400)

func _physics_process(delta):
	_move(delta)
	
# Controlador de todo lo relacionado con el movimiento
func _move(delta):
	# Dirección del jugador según la tecla presionada
	var direction_x = 0
	
	if int(Input.is_action_pressed("ui_right")):
		direction_x = 1
		$Personaje.flip_h = false
		mov = false
		$Personaje.animation = "Caminar"
		
		
	elif int(Input.is_action_pressed("ui_left")):
		direction_x = -1
		$Personaje.flip_h = true
		mov = true
		$Personaje.animation = "Caminar"
		
	else:
		$Personaje.animation = "Stop"
	# Formulas fisicas para obtener la velocidad y la gravedad
	
	distance.x = speed*delta
	velocity.y += gravity*delta
	velocity.x = (distance.x*direction_x)/delta
	
	# Aplicar el movimiento y ajustar un suelo
	move_and_slide(velocity, Vector2(0,-1))
	# Obtener las colisiones cada vez que chocamos con otro cuerpo
	#Si es necesario, elimina el # del código de abajo
	#var get_col = get_slide_collision(get_slide_count()-1)
	
	if is_on_floor():
		velocity.y = 0
		derecha = true
		izquierda = true
		saltos = 2
		gravity = 700
		
	if Input.is_action_just_pressed("ui_up") and saltos >= 1:
		velocity.y -= jump_speed
		saltos -= 1
			
	if velocity.y != 0:
		if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_right"):
			velocity.normalized()
		if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_right"):
			velocity.normalized()
			
		if Input.is_action_pressed("ui_down"):
			gravity += 200
			
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_right"):
		velocity.normalized()
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_right"):
		velocity.normalized()
		
	if mov == true:
		$Personaje.flip_h = true
		
	else:
		$Personaje.flip_h = false
	
	var vidas = VIDAS+GV.resta
	$Camara/HuesosLabel.text = "información= " + str(GV.monedas)
	$Camara/vidas.text = "Vidas= " + str(vidas)
	
	if vidas <=0:
		GV.reset = true
		GV.resta = 0
	
	if GV.reset == true:
		_ready()
		GV.reset = false
	
