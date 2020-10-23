extends Node

var puntos
var puntajeMaximo
var perder
var record
var spawnearObs

func _ready():
	puntajeMaximo=0
	puntos=0
	perder=false
	record=false
	spawnearObs=true
	pass # Replace with function body.

#comprar puntaje actual con el puntaje maximo alcanzado
func MaximoPuntaje():
	if puntos> puntajeMaximo:
		puntajeMaximo=puntos
		if puntos>0:
			record=true
	else: 
		record=false

#metodo para generar efecto "camara lenta".
func FrenarTiempo(tiempo1,escalatiempo):
	Engine.time_scale=escalatiempo
	yield(get_tree().create_timer(tiempo1), "timeout")
	Engine.time_scale=1
	pass
	
