extends Node2D
@export var player: CharacterBody2D
@onready var canvasGameOver = $"Game over/GameOver"
@onready var RetryButton = $"Game over/Retry"
@onready var RetryCPButton = $"Game over/RetryFromCheckpoint"
@onready var MainMenuButton = $"Game over/MainMenu"
@onready var QuitButton = $"Game over/Quit"
@onready var canvasPause = $Menu/Pause
@onready var ReturnButtonPause = $Menu/Return
@onready var MainMenuButtonPause: = $Menu/PauseMainMenu
@onready var RetryButtonPause = $Menu/Retry
@onready var RetryCPButtonPause = $Menu/RetryFromCheckpoint

var isPaused: bool

# Called when the node enters the scene tree for the first time.
func _ready():
		isPaused = false
		makeButtonAppear(canvasGameOver, RetryButton, MainMenuButton, QuitButton, RetryCPButton, false)
		makeButtonAppear(canvasPause, ReturnButtonPause, RetryButtonPause, MainMenuButtonPause, RetryCPButtonPause, false)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !player :
		makeButtonAppear(canvasGameOver, RetryButton, MainMenuButton, QuitButton, RetryCPButton, true)
	
	if Input.is_action_just_pressed("esc") && isPaused == false && player.visible:
		makeButtonAppear(canvasPause, ReturnButtonPause, RetryButtonPause, MainMenuButtonPause,RetryCPButtonPause, true)
		isPaused = true
		get_tree().paused = true
	elif Input.is_action_just_pressed("esc") && isPaused == true && player.visible:
		makeButtonAppear(canvasPause, ReturnButtonPause, RetryButtonPause, MainMenuButtonPause,RetryCPButtonPause, false)
		isPaused = false
		get_tree().paused = false

func _on_retry_pressed():
	get_tree().paused = false
	PlayerVar.TouchedCheckpoint = false
	PlayerVar.IsAlive = true
	get_tree().change_scene_to_file("res://Scenes/Game/Level " + str(PlayerVar.level) + ".tscn")
	
func _on_return_pressed():
	get_tree().paused = false
	makeButtonAppear(canvasPause, ReturnButtonPause, RetryButtonPause, MainMenuButtonPause, RetryCPButtonPause, false)

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game/Menu.tscn")
	PlayerVar.IsAlive = true
	
func _on_pause_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Game/Menu.tscn")
	PlayerVar.IsAlive = true

func _on_quit_pressed():
	get_tree().quit()
	
func _on_pause_quit_pressed():
	get_tree().quit()

func _on_retry_from_checkpoint_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Game/SavedLevel.tscn")
	PlayerVar.IsAlive = true

func makeButtonAppear(canvas: CanvasModulate, button1: Button, button2: Button, button3: Button,
button4 : Button, isVisible: bool) :
	button1.visible = isVisible
	button2.visible = isVisible
	button3.visible = isVisible
	button4.visible = isVisible
	canvas.visible = isVisible
