class_name Weapon
extends Node2D

const DAMAGE : int = 10
const FIRE_RATE : float = 1.0

var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func aim(playerPos : Vector2):
	var pos = get_local_mouse_position()
	var gpos = get_global_mouse_position()
	look_at(gpos)
	position = playerPos / screen_size
