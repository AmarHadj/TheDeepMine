extends Node2D

@export var plateforme : Node2D
@export var x : float
@export var y : float
@onready var animated_sprite_2d = $AnimatedSprite2D
var activated = false



func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if !activated :
		plateforme.position.x = x
		plateforme.position.y = y
		animated_sprite_2d.play("activated")
		activated = true
