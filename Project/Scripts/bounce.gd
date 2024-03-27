extends CharacterBody2D


func be_bounced_upon(bouncer):
	if bouncer.has_method("bounce"):
		bouncer.bounce()
		queue_free()
		
