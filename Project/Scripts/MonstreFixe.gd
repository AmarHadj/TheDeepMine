extends CharacterBody2D

const SPEED = 200

		
func be_bounced_upon(bouncer):
	if bouncer.has_method("bounce"):
		bouncer.bounce()
		queue_free()


