extends StaticBody2D
var timeBeforeDestroyed = 1;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timeBeforeDestroyed == 0 :
		queue_free()


func be_bounced_upon(bouncer):
	timeBeforeDestroyed - 1
