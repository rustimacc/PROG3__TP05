extends KinematicBody2D

var cuadrado=preload("res://Objetos/cuadrado.tscn")

var vel=50

# Called when the node enters the scene tree for the first time.
func _ready():
	EstablecerRotacion()
	
	
	
	pass # Replace with function body.
func EstablecerRotacion():
	var probabilidad=rand_range(0,100)
	if probabilidad>50:
		set_rotation_degrees(0)
	else:
		set_rotation_degrees(90)
		$Cuadrado3.queue_free()
		$Cuadrado4.queue_free()
	
	
func _physics_process(delta):
	Movimiento()
	Destruir()
	pass

func Movimiento():
	var velocidad=Vector2(0,1)
	velocidad=velocidad.normalized()*vel
	
	move_and_slide(velocidad)
	
func Destruir():
	if global_position.y>730:
		queue_free()
		print("destruido")
