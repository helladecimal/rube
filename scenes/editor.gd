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

func hover(type: Block.BlockType, pos: Vector2):
	hover_blk = Block.add(type)
	hover_blk.find_child("Sprite2D").modulate.a = 0.5
	hover_blk.position = Vector2(
		round(pos.x/grid) * grid,
		round(pos.y/grid) * grid
	)
	pass

var materials = Block.BlockType.values()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(selected)
	mouse_pos = get_global_mouse_position() #cam.get_viewport().get_mouse_position()
	
	if selected == Block.BlockType.none and hover_blk is Block:
			hover_blk.queue_free()
		
	if selected != hover_type:
		hover_blk = Block.add(selected)
			
	hover(selected, mouse_pos)
	
	if Input.is_action_pressed("LMB") == true:
		place(selected, mouse_pos)
		print("placed")
		#selected = Block.BlockType.none
			
	

var slots = [ ]
func _unhandled_input(input: InputEvent) -> void:
	if input is InputEventKey:
		for i in 10:
			if input.pressed == true and input.keycode == KEY_0 + i:
				selected = i
	
