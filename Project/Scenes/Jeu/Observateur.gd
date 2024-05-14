extends Node2D
@export var player: CharacterBody2D
@export var canvasGameOver: CanvasModulate
@export var RetryButton: Button
@export var MainMenuButton: Button
@export var QuitButton: Button
@export var canvasPause: CanvasModulate
@export var ReturnButtonPause: Button
@export var MainMenuButtonPause: Button
@export var QuitButtonPause: Button

var isPaused: bool

# Called when the node enters the scene tree for the first time.
func _ready():
		isPaused = false
		makeButtonAppear(canvasGameOver, RetryButton, MainMenuButton, QuitButton, false)
		makeButtonAppear(canvasPause, ReturnButtonPause, QuitButtonPause, MainMenuButtonPause, false)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !player.visible :
		makeButtonAppear(canvasGameOver, RetryButton, MainMenuButton, QuitButton, true)
	
	if Input.is_action_just_pressed("esc") && isPaused == false && player.visible:
		makeButtonAppear(canvasPause, ReturnButtonPause, QuitButtonPause, MainMenuButtonPause, true)
		isPaused = true
		get_tree().paused = true
	elif Input.is_action_just_pressed("esc") && isPaused == true && player.visible:
		makeButtonAppear(canvasPause, ReturnButtonPause, QuitButtonPause, MainMenuButtonPause, false)
		isPaused = false
		get_tree().paused = false

func _on_retry_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jeu/Jeu.tscn")

func _on_return_pressed():
	get_tree().paused = false
	makeButtonAppear(canvasPause, ReturnButtonPause, QuitButtonPause, MainMenuButtonPause, false)

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/Jeu/Menu.tscn")
	
func _on_pause_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Jeu/Menu.tscn")

func _on_quit_pressed():
	get_tree().quit()
	
func _on_pause_quit_pressed():
	get_tree().quit()


func makeButtonAppear(canvas: CanvasModulate, button1: Button, button2: Button, button3: Button, isVisible: bool) :
	button1.visible = isVisible
	button2.visible = isVisible
	button3.visible = isVisible
	canvas.visible = isVisible
