extends Node2D



var jugadormuerto

var empezar

func _ready():
	VariablesGlobales.perder=false
	VariablesGlobales.puntos=0
	VariablesGlobales.spawnearObs=true
	#una cámara lenta que da tiempo de reaccion al jugador y queda piola
	VariablesGlobales.FrenarTiempo(.2,.5)
	
	#Panel inicio
	empezar=false
	Engine.time_scale=0
	

func _process(delta):
	if Input.is_action_just_pressed("reiniciar"):
		reiniciarNivel()
	if Input.is_action_just_pressed("pausa"):
		Pausa()
	EmpezarPartida()

func EmpezarPartida():
	if Input.is_action_just_pressed("salto")and !empezar:
		$"Control/Comenzar a jugar".visible=false;
		Engine.time_scale=1
		empezar=true
	pass

func reiniciarNivel():
	get_tree().reload_current_scene()
	empezar=false
	Engine.time_scale=0

func Pausa():
	get_tree().paused=!get_tree().paused
	
	if get_tree().paused:
		
		$"Control/Manue Paus".visible=true
		Engine.time_scale=0;
	else:
		
		$"Control/Manue Paus".visible=false
		Engine.time_scale=1;
	


func Perder():
	if !VariablesGlobales.perder:
		$Camera2D.magnitud=13
		get_node("Camera2D").emit_signal("Shake")#shake de la camara
	VariablesGlobales.perder=true
	VariablesGlobales.FrenarTiempo(1,.5)
	VariablesGlobales.MaximoPuntaje()
	yield(get_tree().create_timer(.8), "timeout")
	get_node("Control/Menu Pausa").visible=true
	get_node("Control/Menu Pausa/puntajefinal").visible=true
	if VariablesGlobales.record:
		get_node("Control/Menu Pausa/puntajefinal").set_text("RECORD!!!! "+str(VariablesGlobales.puntos))
	else:
		get_node("Control/Menu Pausa/puntajefinal").set_text("Puntos: "+str(VariablesGlobales.puntos)+"\n"+"Puntaje máximo: "+str(VariablesGlobales.puntajeMaximo))

