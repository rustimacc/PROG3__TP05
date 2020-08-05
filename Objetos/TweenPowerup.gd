extends Tween

export var tiempo_min=0.4
export var tiempo_max=0.9

func _ready():
	randomize()
	var parent : =get_parent()
	
	interpolate_property(parent,
	"scale",
	Vector2.ZERO,
	Vector2.ONE,
	tiempo_min,
	Tween.TRANS_CUBIC,
	Tween.EASE_OUT,
	0)
	start()
	

