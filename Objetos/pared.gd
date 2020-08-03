extends RigidBody2D

signal cambiardireccionflecas(value)

func _ready():
	$Sprite.material.set_shader_param("Espejado", -1)
	pass # Replace with function body.



func _on_Pared_cambiardireccionflecas(value):
	$Sprite.material.set_shader_param ( "Espejado", value)
	print("hola, esto funciona")
	pass # Replace with function body.
