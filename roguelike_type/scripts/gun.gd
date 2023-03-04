class_name Weapon
extends Node2D

@onready var sprite : Sprite2D = $Sprite
@onready var mira : Marker2D = $Ponta

@export var damage : int = 10
@export var bullet_speed : float = 2000.0

const BULLET_PATH = preload("res://scenes/bullet.tscn")

var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func aim(playerPos : Vector2):
	var pos = get_global_mouse_position()
	look_at(pos)
	position = playerPos / screen_size
	sprite_handler()

func shoot(playerPos : Vector2):
	var bullet = BULLET_PATH.instantiate()
	bullet.position = mira.global_position
	bullet.rotation_degrees = rotation_degrees
	bullet.linear_velocity = mira.global_position
	bullet.apply_force(Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet)

func sprite_handler():
	var aim_pos = get_global_mouse_position() / screen_size
	if (position.x < aim_pos.x):
		sprite.set_flip_v(false);
	else:
		sprite.set_flip_v(true);
