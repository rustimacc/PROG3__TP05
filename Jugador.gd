extends RigidBody2D

var balas=preload("res://bala.tscn")

#determina la direccion del salto
export  var DireLateral:int
var disparar=true
var timer=null
var delay =0.2
var controlesActivos
var congelado
var arma

func _ready():
	DireLateral=50
	set_bounce(1)
	controlesActivos=true
	congelado=false
	$BarraCongelado.visible=congelado
	timer=Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(delay)
	timer.connect("timeout",self,"PuedeDisparar")
	add_child(timer)
	
	arma=false
	
	pass # Replace with function body.

func PuedeDisparar():
	disparar=true	
	pass

func _physics_process(delta):
	if controlesActivos:
		Movimiento()
	if arma:
		Disparando()
	if congelado:
		BarraCongeladaUI()
	pass

func Movimiento():
	if Input.is_action_just_pressed("salto"):
		apply_central_impulse(Vector2(DireLateral,-300))
		VariablesGlobales.puntos+=1
	global_position.y=clamp(global_position.y,-30,630)

func _on_Jugador_body_entered(body):
	if body.is_in_group("pared"):
		DireLateral*=-1
		print("colision")


func Disparando():
	if disparar:
		var bala=balas.instance()
		bala.position=$"pos bala".global_position
		get_parent().add_child(bala)
		print("bala creada")
		disparar=false
		timer.start()


func _on_Disparo_timeout():
	arma=false

func _on_Congelado_timeout():
	controlesActivos=true
	congelado=false
	$BarraCongelado.visible=false
	set_sleeping(false)

func _on_Area2D_area_entered(area):
	#al colisionar con arma, el personaje dispara un perdio de tiempo
	if area.is_in_group("arma"):
		arma=true
		$Disparo.start()
		print("arma activada")
	#al colisionar con congelador, se detiene se congela el personaje
	if area.is_in_group("congelador"):
		area.queue_free()
		congelado=true
		set_sleeping(true)
		controlesActivos=false		
		$Congelado.start()
		#print("colision")
	#al colisionar con obstaculo, se pierde la partida
	if area.is_in_group("danio"):
		controlesActivos=false
		$Area2D.disconnect("area_entered",self,"_on_Area2D_area_entered")
		apply_central_impulse(Vector2(0,-400))
		VariablesGlobales.perder=true
		VariablesGlobales.FrenarTiempo(1.5,.5)
		VariablesGlobales.MaximoPuntaje()

#Barra que muestra el tiempo que le queda congelado
func BarraCongeladaUI():
	$BarraCongelado.visible=true
	$BarraCongelado.value=$Congelado.get_time_left()



