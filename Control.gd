extends Control



var textoPuntos

# Called when the node enters the scene tree for the first time.
func _ready():
	textoPuntos=get_node("textoPuntos")
	pass # Replace with function body.

func _process(delta):
	Textos()
	pass


func Textos():
	textoPuntos.set_text("puntos: "+str(VariablesGlobales.puntos))


func _on_Reiniciar_pressed():
	get_parent().reiniciarNivel()


func _on_Salir_pressed():
	get_tree().quit()
