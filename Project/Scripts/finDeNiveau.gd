extends Node2D
@export var player: Node2D

func _on_area_2d_area_entered(area):
	PlayerVar.level += 1
	get_tree().change_scene_to_file("res://Scenes/Jeu/niveau " +  str(PlayerVar.level) +  ".tscn")
