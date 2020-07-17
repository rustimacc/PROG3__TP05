extends KinematicBody2D

var vel=400
var direccion=Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	
	direccion=Vector2(0,-1).normalized()*vel
	
	move_and_slide(direccion)
