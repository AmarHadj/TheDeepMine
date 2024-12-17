extends Control


#region bouton de choix de niveaux
func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game/Level 1.tscn")
func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game/Level 2.tscn")
func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game/Level 3.tscn")
func _on_level_4_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game/Level 4.tscn")
func _on_level_5_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game/Level 5.tscn")
func _on_level_6_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game/Level 6.tscn")
func _on_level_7_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game/Level 7.tscn")
func _on_level_8_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game/Level 8.tscn")
func _on_level_9_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game/Level 9.tscn")
func _on_level_10_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game/Level 10.tscn")
#endregion

func _on_return_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game/Menu.tscn")
