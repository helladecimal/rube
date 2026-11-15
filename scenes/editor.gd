extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(materials)
	pass # Replace with function body.

@onready var cam: Camera2D = $Camera2D
@export var grid = 8
@export var selected: Block.BlockType
var mouse_pos: Vector2 = Vector2()
@onready var col_check = $CollCheck
@onready var deb = $PlaceDebounce

func place(type, pos: Vector2):
	if type != Block.BlockType.none:
		var block = Block.add(type)
		block.position = Vector2(
			round(pos.x/grid) * grid,
			round(pos.y/grid) * grid
		)
		
		erase()
		
		add_child(block)
		pass

func erase():
	if col_check.has_overlapping_bodies():
			print(col_check.has_overlapping_bodies())
			
			for block_overlap: Block in col_check.get_overlapping_bodies():
				print(block_overlap.position, col_check.position)
				block_overlap.queue_free()

var hover_blk: Block
var hover_type: Block.BlockType

func hover(type: Block.BlockType, pos: Vector2):
	if type != Block.BlockType.none:
		hover_blk = Block.add(type)
		hover_blk.find_child("Sprite2D").modulate.a = 0.5
		hover_blk.position = Vector2(
			round(pos.x/grid) * grid,
			round(pos.y/grid) * grid
		)
		add_child(hover_blk)
		pass

var materials = Block.BlockType.values()
# Called every frame. 'delta' is the elapsed time since the previous frame.
@export var is_dragging = false
@export var is_erasing = false
func _process(delta: float) -> void:
	mouse_pos = get_global_mouse_position() #cam.get_viewport().get_mouse_position()
	
	if is_instance_valid(hover_blk):
		hover_blk.queue_free()
		
	if selected != hover_type:
		hover_type = selected
		
	if Input.is_action_just_pressed("Erase"):
		is_erasing = not is_erasing
	
	if Input.is_action_pressed("LMB") == true and deb.is_stopped():
		if not is_erasing:
			place(selected, mouse_pos)
			
			if not is_dragging: # are you rushing or are you dragging
				deb.start()
				is_dragging = true
		else:
			erase()
	
	if Input.is_action_just_pressed("LMB"):
		is_dragging = false
		
		#selected = Block.BlockType.none
	col_check.position = Vector2(
		round(mouse_pos.x/grid) * grid,
		round(mouse_pos.y/grid) * grid
	)
	
	if not is_erasing:
		hover(selected, mouse_pos)
	
	

var slots = [ ]
func _unhandled_input(input: InputEvent) -> void:
	if input is InputEventKey:
		for i in 10:
			if input.pressed == true and input.keycode == KEY_0 + i:
				selected = i
	
