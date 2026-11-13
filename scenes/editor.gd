extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(materials)
	pass # Replace with function body.

@onready var cam: Camera2D = $Camera2D
@export var grid = 8
@export var selected: Block.BlockType
var mouse_pos: Vector2 = Vector2()

func place(type, pos: Vector2):
	var block = Block.add(type)
	block.position = Vector2(
		round(pos.x/grid) * grid,
		round(pos.y/grid) * grid
	)
	add_child(block)
	pass

var hover_blk: Block
var hover_type: Block.BlockType

func hover(block, pos: Vector2):
	pass

var materials = Block.BlockType.values()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_pos = get_global_mouse_position() #cam.get_viewport().get_mouse_position()
	
func _unhandled_input(input: InputEvent) -> void:
	if input is InputEventMouseButton:
		if selected == Block.BlockType.none:
			remove_child(hover_blk)
		
		if selected != hover_type:
			hover_blk = Block.add(selected)
			
		
		if input.pressed == true and input.button_index == MOUSE_BUTTON_LEFT:
			place(selected, mouse_pos)
			print("placed")
	
