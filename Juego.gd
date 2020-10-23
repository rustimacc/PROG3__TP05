extends Node2D



var jugadormuerto
# Called when the node enters the scene tree for the first time.
func _ready():
	VariablesGlobales.perder=false
	VariablesGlobales.puntos=0
	VariablesGlobales.spawnearObs=true
	#una cámara lenta que da tiempo de reaccion al jugador y queda piola
	VariablesGlobales.FrenarTiempo(.2,.5)
	
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

