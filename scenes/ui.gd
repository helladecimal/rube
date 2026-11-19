extends Control

@export var selected: Block.BlockType
@onready var blockcont := $Panel/BlockButtons

@onready var button: Button = $Panel/BlockButtons/Button.duplicate()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Panel/BlockButtons/Button.queue_free()
	for blocks in Block.BlockType:
		if blocks != "none":
			var new = button.duplicate()
			new.text = blocks
			blockcont.add_child(new)
			print(blocks)
		pass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
