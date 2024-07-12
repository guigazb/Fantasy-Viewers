extends Node2D

var inimigos : Array = []
# Called when the node enters the scene tree for the first time.
func _ready():
	inimigos = get_children()
	for i in inimigos.size():
		inimigos[i].position = Vector2(0,i*32)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
