class_name Block
extends Area2D

enum BlockType {none, plastic, wood, air}

var textarr = [
	"",
	"res://assets/icon.svg",
	"res://assets/icon.svg",
	""
]

@export var BlockMaterial: BlockType = BlockType.plastic
@onready var sprite: Sprite2D = $Sprite2D

static func add(type: BlockType):
	var new: Block = load("res://scenes/block.tscn").instantiate()
	new.BlockMaterial = type
	return new


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.texture = load(textarr[BlockMaterial])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
