extends KinematicBody2D

export var speed : int = 150

var velocity = Vector2.ZERO

onready var animation_tree : AnimationTree = $AnimationTree
onready var animation_mode = animation_tree.get("parameters/playback")

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	horizontal_movement()
	vertical_movement()
	animation_handler()
	move_and_slide(velocity)
	
func horizontal_movement():
	var strength = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = strength * speed

func vertical_movement():
	var strength = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity.y = strength * speed

func animation_handler():
	var direction := Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	animation_mode.start("Move")
	animation_tree.set("parameters/Move/blend_position", direction)
