extends Node2D

var bloque=preload("res://obstaculo.tscn")
var bloqueCuadrado=preload("res://ObstaculoCuadrado.tscn")

var BalaPower=preload("res://PowerUpArma.tscn")
var CongeladorPower=preload("res://Congelador.tscn")

var tiempoSpawnPowerUp

# Called when the node enters the scene tree for the first time.
func _ready():
	VariablesGlobales.perder=true
	VariablesGlobales.puntos=0
	
	tiempoSpawnPowerUp=rand_range(5,15)
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("reiniciar"):
		reiniciarNivel()
	pass

func reiniciarNivel():
	get_tree().reload_current_scene()

func SpawnearPowerUps():
	var probabilidad=rand_range(0,100)
	if probabilidad <= 100:
		var tipo=rand_range(0,100)
		if tipo>=50:
			var congelador=CongeladorPower.instance()
			add_child(congelador)
			congelador.global_position=Vector2(rand_range(192,830),rand_range(100,550))
			
		else:
			var arma=BalaPower.instance()
			add_child(arma)
			arma.global_position=Vector2(rand_range(192,830),rand_range(100,550))
			
		tiempoSpawnPowerUp=rand_range(5,10)
		$"spawn powerups".wait_time=tiempoSpawnPowerUp
		$"spawn powerups".start()
	else:
		tiempoSpawnPowerUp=rand_range(5,10)
		$"spawn powerups".wait_time=tiempoSpawnPowerUp
		$"spawn powerups".start()
	pass

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


func _on_spawn_powerups_timeout():
	SpawnearPowerUps()
	pass # Replace with function body.
