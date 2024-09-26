extends RigidBody3D

@onready var ClickTimer : Timer = $"ClickTimer"
@onready var Animator : AnimationPlayer = $"AnimationPlayer"
@onready var Heads : MeshInstance3D = $"Heads"
@onready var Tails : MeshInstance3D = $"Tails"

@export var Colors : Array

var CanClick : bool
var force : float = 1
var StartPosition : Vector3



# Called when the node enters the scene tree for the first time.
func _ready():
	StartPosition = position
	CanClick = true
	first_push()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(position.x != StartPosition.x):
		position.x = StartPosition.x
	if(position.z != StartPosition.z):
		position.z = StartPosition.z
	if(rotation_degrees.y != 0):
			rotation_degrees.y = 0
	if(rotation_degrees.z != 0):
			rotation_degrees.z = 0
	if (angular_velocity.x > 0):
			angular_velocity.x -=  clamp(angular_velocity.x,0.1,10) * delta
	if (angular_velocity.x <  0):
			angular_velocity.x += clamp(angular_velocity.x,0.1,10) * delta
	#print('X: ', angular_velocity.x, " Y: ", angular_velocity.y, " Z: ", angular_velocity.z)
	pass 


func _on_area_3d_input_event(camera, event, myposition, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true and CanClick == true:
			CanClick = false
			ClickTimer.start()
			Animator.play("Flip")
			apply_impulse(Vector3.UP * force)
	pass # Replace with function body.


func _on_click_timer_timeout():
	CanClick = true
	pass # Replace with function body.

func get_random_color_Heads():
	var c1 : int = randi_range(0,Colors.size() -1 )
	print("C1: " , c1)
	Heads.get_surface_override_material(0).albedo_color = Colors[c1]

func get_random_color_Tails():
	var c1 : int = randi_range(0,Colors.size() - 1)
	Tails.get_surface_override_material(0).albedo_color  = Colors[c1]
	
func first_push():
	CanClick = false
	ClickTimer.start()
	Animator.play("Flip")
	apply_impulse(Vector3.UP * force)

func AddColors(newColors : Array):
	Colors = newColors
