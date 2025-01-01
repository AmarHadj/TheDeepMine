extends Node2D
@onready var animated_sprite_2d = $AnimatedSprite2D

var hasBeenTouched = false
func _on_area_2d_area_entered(_area):
	if not PlayerVar.TouchedCheckpoint and not hasBeenTouched:
		checkpoint()
		PlayerVar.TouchedCheckpoint = true
		
	elif PlayerVar.TouchedCheckpoint and not hasBeenTouched:
		checkpoint()
		PlayerVar.ReSave = true


func verifyBonus(bonus : bool) -> bool:
	if bonus:
		return true
	else : 
		return false
func checkpoint():
	animated_sprite_2d.play("touched")
	PlayerVar.spawnPosition = self.global_position
	PlayerVar.hasPickTemp = verifyBonus(PlayerVar.hasPick)
	PlayerVar.hasWingsTemp = verifyBonus(PlayerVar.hasWings)
	PlayerVar.hasBootsTemp = PlayerVar.hasBoots
	hasBeenTouched = true

	
