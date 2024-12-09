extends Node2D


func _on_hitbox_area_entered(area):
	PlayerVar.IsAlive = false
