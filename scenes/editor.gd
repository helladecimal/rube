extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@onready var cam: Camera2D = $Camera2D
var mouse_pos: Vector2 = Vector2()

func place(block, pos: Vector2):
	pass
	
func select(block):
	pass
	
func hover(block, pos: Vector2):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_pos = cam.get_viewport().get_mouse_position()
	
	
