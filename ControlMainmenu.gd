extends Control

export (PackedScene) var Escenajuego

func _ready():
	pass # Replace with function body.



func _on_Jugar_pressed():
	get_tree().change_scene_to(Escenajuego)



func _on_Salir_pressed():
	get_tree().quit()
