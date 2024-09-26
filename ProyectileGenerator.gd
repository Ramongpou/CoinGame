extends Control

@export var Proyectile : PackedScene
var minY : int = 100
var maxY : int = 500
var StartX : int = -70
var minProytl : int = 3
var maxProytl : int = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(randi_range(3,8)).timeout
	Proyectile_Spell()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func Proyectile_Spell():
	var randi : int  = randi_range(minProytl, maxProytl) 
	for n in randi:
		Create_Proyectile()
	await get_tree().create_timer(randi_range(4,8)).timeout
	Proyectile_Spell()

func Create_Proyectile():
	var tempProyectile = Proyectile.instantiate()
	add_child(tempProyectile)
	tempProyectile.position.x = StartX
	tempProyectile.position.y = randi_range(minY,maxY)
	
