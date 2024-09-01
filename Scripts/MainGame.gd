extends Node3D

@onready var Animator : AnimationPlayer = $"AnimationPlayer"
@export var Coin : PackedScene
@export var Colors : Array

# Called when the node enters the scene tree for the first time.
func _ready():
	Animator.play("start_game")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play_clicked():
	Animator.play("start_Coin")
	
func Create_Coin():
	var tempCoin = Coin.instantiate()
	tempCoin.AddColors(Colors)
	add_child(tempCoin)
	tempCoin.position.x = 0
	tempCoin.position.y = 1.5
