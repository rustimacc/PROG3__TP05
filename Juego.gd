extends Node2D

var bloque=preload("res://obstaculo.tscn")
var bloqueCuadrado=preload("res://ObstaculoCuadrado.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	VariablesGlobales.perder=true
	VariablesGlobales.puntos=0
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("reiniciar"):
		reiniciarNivel()
	pass

func reiniciarNivel():
	get_tree().reload_current_scene()

func _on_spawnear_bloques_timeout():
	print("funciona reloj")
	var tipoBloque=randi()%2
	if tipoBloque==0:
		var bloquecito=bloque.instance()
		add_child(bloquecito)
		bloquecito.global_position=Vector2(rand_range(192,830),-250)
	elif tipoBloque==1:
		var bloque2=bloqueCuadrado.instance()
		add_child(bloque2)
		bloque2.global_position=Vector2(rand_range(192,830),-250)
