extends CharacterBody2D

const SPEED = 150

@export var position1: Node2D
@export var position2: Node2D

@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var verif1 = position1.global_position.x - 20
@onready var verif2 = position2.global_position.x + 20
@onready var verif3 = position1.global_position.y - 20
@onready var verif4 = position2.global_position.y + 20

func _ready() -> void:
	makepath(position1.global_position)

func _physics_process(_delta: float) -> void:
	var dir = to_local(nav_agent.target_position).normalized()
	velocity = dir * SPEED
	move_and_slide()

func makepath(position: Vector2)-> void:
	nav_agent.target_position = position

func _on_timer_timeout():
	if self.global_position.x > verif1 and self.global_position.y == position1.global_position.y:
		makepath(position2.global_position)
	if self.global_position.x < verif2 and self.global_position.y == position1.global_position.y:
		makepath(position1.global_position)
		
	if self.global_position.y > verif3 and self.global_position.x == position1.global_position.x:
		makepath(position2.global_position)
	if self.global_position.y < verif4 and self.global_position.x == position1.global_position.x:
		makepath(position1.global_position)
		
		
		
func be_bounced_upon(bouncer):
	if bouncer.has_method("bounce"):
		bouncer.bounce()
		queue_free()


func _on_hitbox_area_entered(area):
	PlayerVar.IsAlive = false
