extends Node

var level = 1
var hasWings = false
var hasBoots = 0
var hasPick = false
var hasWingsTemp = false
var hasBootsTemp = false
var hasPickTemp = false
var onWall 
var spawnPosition
var TouchedCheckpoint = false
var ReSave = true
var IsAlive = true

func set_all_bonus_false() :
	hasWings = false
	hasBoots = 0
	hasPick = false
	hasWingsTemp = false
	hasBootsTemp = false
	hasPickTemp = false


