extends Node

var puntos
var puntajeMaximo
var perder

func _ready():
	puntajeMaximo=0
	puntos=0
	perder=false
	pass # Replace with function body.

#comprar puntaje actual con el puntaje maximo alcanzado
func MaximoPuntaje():
	if puntos> puntajeMaximo:
		puntajeMaximo=puntos

#metodo para generar efecto "camara lenta".
func FrenarTiempo(tiempo1,escalatiempo):
	Engine.time_scale=escalatiempo
	yield(get_tree().create_timer(tiempo1), "timeout")
	Engine.time_scale=1
	pass
	
