extends Node2D
@export var player: CharacterBody2D
@export var canvas: CanvasModulate
@export var RetryButton: Button
@export var MainMenuButton: Button
@export var QuitButton: Button
@export var canvasPause: CanvasModulate
@export var ReturnButtonPause: Button
@export var MainMenuButtonPause: Button
@export var QuitButtonPause: Button

# Called when the node enters the scene tree for the first time.
func _ready():
		RetryButton.visible = false
		MainMenuButton.visible = false
		QuitButton.visible = false
		canvas.visible = false
		ReturnButtonPause.visible = false
		MainMenuButtonPause.visible = false
		QuitButtonPause.visible = false
		canvasPause.visible = false
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player == null :
		GameOver()
	
	if Input.is_action_just_pressed("esc") :
		ReturnButtonPause.visible = true
		MainMenuButtonPause.visible = true
		QuitButtonPause.visible = true
		canvasPause.visible = true

func _on_retry_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jeu/Jeu.tscn")

func _on_return_pressed():
	pass # Replace with function body.

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jeu/Menu.tscn")
	
func _on_pause_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jeu/Menu.tscn")

func _on_quit_pressed():
	get_tree().quit()
	
func _on_pause_quit_pressed():
	get_tree().quit()

func GameOver():
	RetryButton.visible = true
	MainMenuButton.visible = true
	QuitButton.visible = true
	canvas.visible = true
