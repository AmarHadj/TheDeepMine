extends Node2D

func _on_area_2d_area_entered(area):
	PlayerVar.hasPick = true
	queue_free()
