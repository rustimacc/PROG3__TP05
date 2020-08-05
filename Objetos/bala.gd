extends KinematicBody2D

var vel=400
var direccion=Vector2()
var timer
export var tiempodestruir=0.1

func _ready():
	pass


func _physics_process(delta):
	
	direccion=direccion.normalized()*vel
	
	move_and_slide(direccion)



func _on_destruir_timeout():
	queue_free()


func _on_Area2D_area_entered(area):
	if area.is_in_group("pared"):
		queue_free()
