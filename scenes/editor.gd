extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(materials)
	pass # Replace with function body.

@onready var cam: Camera2D = $Camera2D
var mouse_pos: Vector2 = Vector2()

func place(type, pos: Vector2):
	var block = Block.add(type)
	block.position = pos
	add_child(block)
	pass
	
func select(block):
	pass
	
func hover(block, pos: Vector2):
	pass

var materials = Block.BlockType.values()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_pos = get_global_mouse_position() #cam.get_viewport().get_mouse_position()
	
func _unhandled_input(input: InputEvent) -> void:
	if input is InputEventMouseButton:
		if input.pressed == true and input.button_index == MOUSE_BUTTON_LEFT:
			place(Block.BlockType.plastic, mouse_pos)
			print("placed")
	
