extends CharacterBody2D

const SPEED = 200

@export var position1: Node2D
@export var position2: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _ready() -> void:
	makepath(position1.global_position)

func _physics_process(_delta: float) -> void:
	var dir = to_local(nav_agent.target_position).normalized()
	velocity = dir * SPEED
	move_and_slide()

func makepath(position: Vector2)-> void:
	nav_agent.target_position = position

func _on_timer_timeout():
	if self.global_position.x > position2.global_position.x && self.global_position.x < position1.global_position.x -50:
		makepath(position2.global_position)
	if self.global_position.x > position2.global_position.x && self.global_position.x < position1.global_position.x -300:
		makepath(position1.global_position)
		
func be_bounced_upon(bouncer):
	if bouncer.has_method("bounce"):
		bouncer.bounce()
		queue_free()
		

