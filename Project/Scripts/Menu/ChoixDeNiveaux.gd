extends Control


#region bouton de choix de niveaux
func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jeu/niveau 1.tscn")
func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jeu/niveau 2.tscn")
func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jeu/niveau 3.tscn")
func _on_level_4_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jeu/niveau 4.tscn")
func _on_level_5_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jeu/niveau 5.tscn")
func _on_level_6_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jeu/niveau 6.tscn")
func _on_level_7_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jeu/niveau 7.tscn")
func _on_level_8_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jeu/niveau 8.tscn")
func _on_level_9_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jeu/niveau 9.tscn")
func _on_level_10_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jeu/niveau 10.tscn")
#endregion

func _on_return_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jeu/Menu.tscn")
