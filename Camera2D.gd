extends Camera2D

signal Shake()

var time=0
export var magnitud=5

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	pass # Replace with function body.


func _process(delta):
	ShakeCamara()

func ShakeCamara():
	var shake=Vector2(rand_range(-magnitud,magnitud),rand_range(-magnitud,magnitud))	
	set_offset(shake)


func _on_Camera2D_Shake():
	$"timer shake".start()
	set_process(true)
	pass # Replace with function body.


func _on_timer_shake_timeout():
	set_process(false)
	set_offset(Vector2.ZERO)
	pass # Replace with function body.
