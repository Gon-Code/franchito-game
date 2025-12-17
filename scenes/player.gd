extends CharacterBody2D

@export var speed = 250.0
@export var jump_velocity = -400.0
@export var gravity = 900.0

@onready var sprite_2d: Sprite2D = $Sprite2D

func _physics_process(delta):

	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = jump_velocity

	get_horizontal_input()
	move_and_slide()

func get_horizontal_input():

	var direction = Input.get_axis("left", "right")
	
	if direction:
		velocity.x = direction * speed
		flip_character(direction)
	else:
		velocity.x = move_toward(velocity.x, 0, speed)


func flip_character(side: int) -> void:
	if side > 0:
		sprite_2d.flip_h = false
	else:
		sprite_2d.flip_h = true
