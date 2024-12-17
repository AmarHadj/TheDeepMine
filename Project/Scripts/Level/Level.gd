extends Node
@onready var player = $player

var savedScene
func _ready():
	if PlayerVar.TouchedCheckpoint : 
		player.global_position = PlayerVar.spawnPosition
		PlayerVar.hasWings = PlayerVar.hasWingsTemp
		PlayerVar.hasBoots = PlayerVar.hasBootsTemp
		PlayerVar.hasPick = PlayerVar.hasPickTemp
		
func _process(delta):
	if PlayerVar.TouchedCheckpoint and PlayerVar.ReSave :
		PlayerVar.ReSave = false
		savedScene = self
		var scene = PackedScene.new()
		scene.pack(savedScene)
		ResourceSaver.save(scene, "res://Scenes/Game/SavedLevel.tscn")







