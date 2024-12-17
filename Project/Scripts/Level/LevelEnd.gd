extends Node2D
@export var player: Node2D


func _on_area_2d_area_entered(area):
	if PlayerVar.TouchedCheckpoint :
		DirAccess.remove_absolute("res://Scenes/Game/SavedLevel.tscn")
		nextLevel()
	else :
		nextLevel()

func nextLevel():
	PlayerVar.level += 1
	PlayerVar.ReSave = true
	PlayerVar.TouchedCheckpoint = false
	PlayerVar.set_all_bonus_false()
	get_tree().change_scene_to_file("res://Scenes/Game/Level " +  str(PlayerVar.level) +  ".tscn")
