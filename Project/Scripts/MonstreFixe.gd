extends CharacterBody2D
@export var player: Node2D

const SPEED = 200

		
func be_bounced_upon(bouncer):
	if bouncer.has_method("bounce"):
		bouncer.bounce()
		queue_free()

func _on_hitbox_area_entered(area):
	if area.overlaps_body(player) :
		player.queue_free()
