extends StaticBody2D
var timeBeforeDestroyed = 1;
@export var player: Node2D


func _on_area_2d_area_exited(area):
	queue_free()
