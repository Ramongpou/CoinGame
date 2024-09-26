extends Button


# Called when the node enters the scene tree for the first time.
var speed : int = 200
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed * delta
	if position.x >= 1300:
		_on_button_down()


func _on_button_down():
	queue_free()
