extends Node2D

var bloque=preload("res://Objetos/obstaculo.tscn")
var bloqueCuadrado=preload("res://Objetos/ObstaculoCuadrado.tscn")

var BalaPower=preload("res://Objetos/PowerUpArma.tscn")
var CongeladorPower=preload("res://Objetos/Congelador.tscn")

var tiempoSpawnPowerUp

var jugadormuerto
# Called when the node enters the scene tree for the first time.
func _ready():
	VariablesGlobales.perder=false
	VariablesGlobales.puntos=0
	
	#una cámara lenta que da tiempo de reaccion al jugador y queda piola
	VariablesGlobales.FrenarTiempo(.2,.5)
	
	
	tiempoSpawnPowerUp=rand_range(5,15)
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("reiniciar"):
		reiniciarNivel()
	if Input.is_action_just_pressed("pausa"):
		Pausa()

func reiniciarNivel():
	get_tree().reload_current_scene()
	get_tree().paused=false

func Pausa():
	get_tree().paused=!get_tree().paused
	
	if get_tree().paused:
		$"Control/Manue Paus".visible=true
	else:
		$"Control/Manue Paus".visible=false
	

func SpawnearPowerUps():
	var probabilidad=rand_range(0,100)
	if probabilidad <= 100:
		var tipo=rand_range(0,100)
		if tipo>=50:
			var congelador=CongeladorPower.instance()
			add_child(congelador)
			congelador.global_position=Vector2(rand_range(80,500),rand_range(100,550))
			
		else:
			var arma=BalaPower.instance()
			add_child(arma)
			arma.global_position=Vector2(rand_range(80,500),rand_range(100,550))
			
		tiempoSpawnPowerUp=rand_range(5,10)
		$"spawn powerups".wait_time=tiempoSpawnPowerUp
		$"spawn powerups".start()
	else:
		tiempoSpawnPowerUp=rand_range(5,10)
		$"spawn powerups".wait_time=tiempoSpawnPowerUp
		$"spawn powerups".start()
	pass

func _on_spawnear_bloques_timeout():
	
	var tipoBloque=randi()%2
	if tipoBloque==0:
		var bloquecito=bloque.instance()
		add_child(bloquecito)
		bloquecito.global_position=Vector2(RandPosBloque())
		RandPosBloque()
	elif tipoBloque==1:
		var bloque2=bloqueCuadrado.instance()
		add_child(bloque2)
		bloque2.global_position=Vector2(RandPosBloque())
		RandPosBloque()

func RandPosBloque()->Vector2:
	var numaleatorio=randi()%3
	var pos
	
	if(numaleatorio==0):
		pos =Vector2(150,-250)
		print(pos)
		return pos
	if(numaleatorio==1):
		pos =Vector2(300,-250)
		print(pos)
		return pos
	if(numaleatorio==2):
		pos =Vector2(450,-250)
		print(pos)
		return pos
	
	return pos

func Perder():
	if !VariablesGlobales.perder:
		$Camera2D.magnitud=13
		get_node("Camera2D").emit_signal("Shake")#shake
	VariablesGlobales.perder=true
	VariablesGlobales.FrenarTiempo(1,.5)
	VariablesGlobales.MaximoPuntaje()
	yield(get_tree().create_timer(.8), "timeout")
	get_node("Control/Manue Paus").visible=true
	get_node("Control/Manue Paus/puntajefinal").visible=true
	if VariablesGlobales.record:
		get_node("Control/Manue Paus/puntajefinal").set_text("RECORD!!!! "+str(VariablesGlobales.puntos))
	else:
		get_node("Control/Manue Paus/puntajefinal").set_text("Puntos: "+str(VariablesGlobales.puntos)+"\n"+"Puntaje máximo: "+str(VariablesGlobales.puntajeMaximo))

func _on_spawn_powerups_timeout():
	if !VariablesGlobales.perder:
		SpawnearPowerUps()
	pass # Replace with function body.
