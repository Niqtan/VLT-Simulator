extends Area2D

@export var item_scene: PackedScene

# Change to integers (int) representing column indices
@export var min_tile_x: int = -2
@export var max_tile_x: int = 5
@export var spawn_tile_y: int = -1 
@export var tile_size: int = 64

@onready var spawn_timer: Timer = $SpawnTimer

func _ready() -> void:
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)

func _on_spawn_timer_timeout() -> void:
	if item_scene == null:
		return
		
	var new_item = item_scene.instantiate()
	
	# 1. Pick a random column index
	var random_block_x: int = randi_range(min_tile_x, max_tile_x)
	
	# 2. Convert grid index to centered pixel coordinates
	var pixel_x: float = (random_block_x * tile_size) + (tile_size / 2.0)
	var pixel_y: float = (spawn_tile_y * tile_size) + (tile_size / 2.0)
	
	new_item.position = Vector2(pixel_x, pixel_y)
	
	add_child(new_item)
