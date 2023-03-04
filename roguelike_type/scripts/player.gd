class_name Player
extends CharacterBody2D

@export var speed : float = 300.0

@onready var gun = $Gun

# == Public Methods == #
func move_handler():
	_horizontal_handler()
	_vertical_handler()

func aim_handler():
	gun.aim(position)

# == Private Methods == #
func _physics_process(_delta):
	move_handler()
	aim_handler()
	move_and_slide()

func _horizontal_handler():
	var horizontal = Input.get_axis("move_left", "move_right")
	if horizontal:
		velocity.x = horizontal * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

func _vertical_handler():
	var vertical = Input.get_axis("move_up", "move_down")
	if vertical:
		velocity.y = vertical * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)

