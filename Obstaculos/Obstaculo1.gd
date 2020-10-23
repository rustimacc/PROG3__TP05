extends Node2D

export var vel:int=50



var pasolimite
# Called when the node enters the scene tree for the first time.
func _ready():
	pasolimite=false
	pass # Replace with function body.

func _process(delta):
	global_position+=Vector2(0,1)*vel*delta
	
	if(global_position.y>0 ):
		print("nuevo obj")
		if !pasolimite:
			VariablesGlobales.spawnearObs=true;
			pasolimite=true
	if(global_position.y>600):
		queue_free()
		print("destruido")
	print(VariablesGlobales.spawnearObs)
	#print(global_position.y)
