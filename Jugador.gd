extends RigidBody2D

var balas=preload("res://Objetos/bala.tscn")

#determina la direccion del salto
export  var DireLateral:int
var disparar=true
var timer=null
var delay =0.2
var controlesActivos
var congelado
var arma
var animator

func _ready():
	DireLateral=50
	set_bounce(1)
	controlesActivos=true
	congelado=false
	
	animator=$Animator
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
	if global_position.y>630:
		tocarfondo()
	
	pass

func Movimiento():
	if Input.is_action_just_pressed("salto"):
		apply_central_impulse(Vector2(DireLateral,-300))
		animator.play("salto")
		get_node("Salto").play()
		
	global_position.y=clamp(global_position.y,-30,632)

func _on_Jugador_body_entered(body):
	if body.is_in_group("pared"):
		DireLateral*=-1#cambiar direccion
		get_node("CoquePared").play()
		get_parent().get_node("Camera2D").emit_signal("Shake")#shake
		VariablesGlobales.FrenarTiempo(0.05,0.6)#efecto congelar tiempo
		animator.play("choquePared")
		if DireLateral>0:
			body.emit_signal("cambiardireccionflecas",1.0)
		else:
			body.emit_signal("cambiardireccionflecas",-1.0)
		#print("colision")


func Disparando():
	if disparar:
		var balaarriba=balas.instance()
		var balaabajo=balas.instance()
		var baladerecha=balas.instance()
		var balaizquierda=balas.instance()
		#bala arriba
		balaarriba.direccion=Vector2(0,-1)
		balaarriba.position=$"pos balaarriba".global_position
		get_parent().add_child(balaarriba)
		#bala abajo
		balaabajo.direccion=Vector2(0,1)
		balaabajo.position=$"pos balaabajo".global_position
		get_parent().add_child(balaabajo)
		#bala derecha
		baladerecha.direccion=Vector2(1,0)
		baladerecha.position=$"pos baladerecha".global_position
		get_parent().add_child(baladerecha)
		#bala izquierda
		balaizquierda.direccion=Vector2(-1,0)
		balaizquierda.position=$"pos balaizquierdo".global_position
		get_parent().add_child(balaizquierda)
		print("bala creada")
		disparar=false
		get_node("Sonidos disparo").play()
		timer.start()


func _on_Disparo_timeout():
	arma=false

func _on_Congelado_timeout():
	controlesActivos=true
	congelado=false
	$BarraCongelado.visible=false
	set_sleeping(false)

func tocarfondo():
	if controlesActivos:
		get_node("morir").play()
	controlesActivos=false	
	get_parent().Perder()

func _on_Area2D_area_entered(area):
	#al colisionar con arma, el personaje dispara un perdio de tiempo
	if area.is_in_group("arma"):
		arma=true
		area.queue_free()
		$Disparo.start()
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
		apply_central_impulse(Vector2(0,-250))
		animator.play("morir")
		get_node("morir").play()
		get_parent().Perder()
	if area.is_in_group("moneda"):
		area.queue_free()
		VariablesGlobales.puntos+=1
		get_node("moneda").play()
		print("punto")

#Barra que muestra el tiempo que le queda congelado
func BarraCongeladaUI():
	$BarraCongelado.visible=true
	
	$BarraCongelado.value=$Congelado.get_time_left()



