extends Area2D

var animator

func _ready():
	$animator.play("idle")
	var t = Timer.new()
	t.set_wait_time(20)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	queue_free()
	pass # Replace with function body.

