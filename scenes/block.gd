class_name Block
extends Area2D

enum BlockType {plastic, wood}

var texture: Array[Texture2D] = [
	preload("res://assets/icon.svg")
]

@export var BlockMaterial: BlockType = BlockType.plastic
@onready var sprite: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.texture = texture[BlockMaterial]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
