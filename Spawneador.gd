extends Node2D

var bloque=[preload("res://Obstaculos/Obstaculo1.tscn"),
			preload("res://Obstaculos/Obstaculo2.tscn"),
			preload("res://Obstaculos/Obstaculo3.tscn"),
			preload("res://Obstaculos/Obstaculo4.tscn"),
			preload("res://Obstaculos/Obstaculo5.tscn"),
			preload("res://Obstaculos/Obstaculo6.tscn"),
			preload("res://Obstaculos/Obstaculo7.tscn"),
			preload("res://Obstaculos/Obstaculo8.tscn"),
			preload("res://Obstaculos/Obstaculo 9.tscn")
			]
#var bloqueCuadrado=preload("res://Obstaculos/Obstaculo2.tscn")

export var obstaculos:PackedScene

var BalaPower=preload("res://Objetos/PowerUpArma.tscn")
var CongeladorPower=preload("res://Objetos/Congelador.tscn")



func _ready():
	pass # Replace with function body.

func _process(delta):
	_on_spawnear_bloques_timeout()

func spawnObstaculos():
	#VariablesGlobales.spawnearObs=false
	var tipoBloque=randi()%2
	if tipoBloque==0:
		var bloquecito=bloque[rand_range(0,bloque.count())].instance()
		add_child(bloquecito)
		bloquecito.global_position=Vector2(0,-600)
	
	#print(VariablesGlobales.spawnearObs)

func _on_spawnear_bloques_timeout():
	#print("tiempo")
	while(VariablesGlobales.spawnearObs):
		var posobj=randi()%bloque.size()
		print(bloque.size())
		var bloquecito=bloque[posobj].instance()
		add_child(bloquecito)
		bloquecito.global_position=Vector2(0,-600)
		
		VariablesGlobales.spawnearObs=false

