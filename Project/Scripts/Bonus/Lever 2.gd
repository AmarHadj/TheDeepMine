extends Node2D

@export var plateforme : Node2D
@export var x : float
@export var y : float



func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	plateforme.position.x = x
	plateforme.position.y = y
	queue_free()
