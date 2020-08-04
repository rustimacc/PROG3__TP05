extends RigidBody2D

signal cambiardireccionflecas(value)

func _ready():
	#$Sprite.material.set_shader_param("espejado", -1.0)
	#get_node("Sprite").get_material().set_shader_param("Espejado", -1)
	
	pass # Replace with function body.



func _on_Pared_cambiardireccionflecas(value):
	#$Sprite.get_material().set_shader_param("Espejado", value)
	$Sprite.material.set_shader_param ( "espejado", value)
	print("hola, esto funciona")
	pass # Replace with function body.
