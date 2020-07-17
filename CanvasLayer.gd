extends CanvasLayer


var textoPuntos

# Called when the node enters the scene tree for the first time.
func _ready():
	textoPuntos=get_node("textoPuntos")
	pass # Replace with function body.

func _process(delta):
	Textos()
	pass


func Textos():
	textoPuntos.set_text("saltos: "+str(VariablesGlobales.puntos))
	
