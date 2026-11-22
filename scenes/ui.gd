extends CanvasLayer

@export var selected: Block.BlockType
@onready var blockcont := $Panel/BlockButtons
@onready var Editor := $"../Editor"
@onready var button: Button = $Panel/BlockButtons/MatTemplate.duplicate()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Panel/BlockButtons/MatTemplate.queue_free()
	for blocks in Block.BlockType:
		if blocks != "none":
			var new = button.duplicate()
			new.text = blocks
			blockcont.add_child(new)

			
			new.pressed.connect(pressed.bind(blocks))
		pass
	pass # Replace with function body.

func pressed(mat):
	print(mat)
	print(Editor)
	Editor.selected = Block.BlockType[mat]
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
