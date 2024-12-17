extends Node2D

@export var plateforme : Node2D




func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	plateforme.queue_free()
	queue_free()
