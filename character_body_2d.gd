
extends CharacterBody2D

@export var speed = 400

func _physics_process(_delta):
	var direction = Vector2.ZERO

	# Esquerda
	if Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_LEFT):
		direction.x -= 1

	# Direita
	if Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_RIGHT):
		direction.x += 1

	# Cima
	if Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_UP):
		direction.y -= 1

	# Baixo
	if Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_DOWN):
		direction.y += 1

	velocity = direction.normalized() * speed
	move_and_slide()
