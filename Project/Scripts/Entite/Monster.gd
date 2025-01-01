extends CharacterBody2D

const SPEED = 150

@export var position1: Node2D
@export var position2: Node2D
@onready var animated_sprite_2d = $AnimatedSprite2D

@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
var verif1 
var verif2 
var verif3 
var verif4 

func _ready() -> void:
	if position1 and position2:
		verif1 = position1.global_position.x - 20
		verif2 = position2.global_position.x + 20
		verif3 = position1.global_position.y - 20
		verif4 = position2.global_position.y + 20
		makepath(position1.global_position)

func _physics_process(_delta: float) -> void:
	if position1 and position2:
		var direction = to_local(nav_agent.target_position).normalized()
		if direction.x > 0:
			animated_sprite_2d.flip_h = true
		
		elif direction.x < 0:
			animated_sprite_2d.flip_h = false
		velocity = direction * SPEED
		move_and_slide()

func makepath(position: Vector2)-> void:
	if position1 and position2:
		nav_agent.target_position = position

func _on_timer_timeout():
	if position1 and position2:
		if self.global_position.x > verif1 and self.global_position.y == position1.global_position.y:
			makepath(position2.global_position)
		if self.global_position.x < verif2 and self.global_position.y == position1.global_position.y:
			makepath(position1.global_position)
		
func be_bounced_upon(bouncer):
	if bouncer.has_method("bounce"):
		bouncer.bounce()
		queue_free()


func _on_hitbox_area_entered(area):
	PlayerVar.IsAlive = false
