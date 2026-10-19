
extends CharacterBody2D

@export var speed: float = 400.0

@onready var animated_sprit: AnimatedSprite2D = $AnimatedSprite2D
@onready var camera: Camera2D = $AnimatedSprite2D/Camera2D
@onready var background: TextureRect = $"../Background"


func _ready() -> void:
	if background.texture == null:
		return

	var bg_size = background.size
	var bg_pos = background.global_position

	camera.limit_left = int(bg_pos.x)
	camera.limit_top = int(bg_pos.y)
	camera.limit_right = int(bg_pos.x + bg_size.x)
	camera.limit_bottom = int(bg_pos.y + bg_size.y)


func _physics_process(_delta: float) -> void:
	var direction = Vector2.ZERO

	if Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_LEFT):
		direction.x -= 1

	if Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_RIGHT):
		direction.x += 1

	if Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_UP):
		direction.y -= 1

	if Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_DOWN):
		
		direction.y += 1

	velocity = direction.normalized() * speed
	move_and_slide()

	if direction.y > 0:
		animated_sprit.play("down")
	else:
		animated_sprit.play("idle")
