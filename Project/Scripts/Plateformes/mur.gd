extends Node2D

func _on_area_2d_area_entered(area):
	PlayerVar.onWall = true


func _on_area_2d_area_exited(area):
	PlayerVar.onWall = false
