extends KinematicBody2D

var cuadrado=preload("res://Objetos/cuadrado.tscn")

var vel=50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

	
func _physics_process(delta):
	
	Destruir()
	pass


func Destruir():
	if global_position.y>730:
		queue_free()
		print("destruido")
