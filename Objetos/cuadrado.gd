extends Sprite


var animator

# Called when the node enters the scene tree for the first time.
func _ready():
	animator=$AnimationPlayer


func _on_Area2D_area_entered(area):
	if area.is_in_group("balas"):
		area.get_parent().queue_free()
		animator.play("destruir")
		VariablesGlobales.puntos+=2
		yield(animator,"animation_finished")
		queue_free()

