extends CharacterBody2D

@onready var bounce_raycasts = $BounceRayCasts
@onready var TimerWings = $TimerWings
@onready var animated_sprite_2d = $AnimatedSprite2D

const SPEED = 200.0
const JUMP_VELOCITY = -260.0
const BOUNCE_VELOCITY = -200.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var CheckDamage
var is_floating = false
var is_stuck_onWall = false


func _process(delta):
	if not PlayerVar.IsAlive:
		queue_free()
		
func _physics_process(delta):
 
	# Add the gravity.
	if not is_on_floor() and is_stuck_onWall : 
		velocity.y = 0
		
	elif not is_on_floor() and is_floating:
		velocity.y = gravity/100
		
	elif not is_on_floor():
		velocity.y += gravity * delta
		CheckDamage = velocity.y
	
	
	if is_on_floor() :
		if CheckDamage > 600 : # a ajuster quand je vais faire le level design
			PlayerVar.IsAlive = false
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("ui_up") and not is_on_floor() and PlayerVar.hasBoots > 0:
		velocity.y = JUMP_VELOCITY
		PlayerVar.hasBoots -= 1
	
	if velocity.y < 0 and not is_on_floor():
		animated_sprite_2d.play("saut")
	if velocity.y > 0 and not is_on_floor():
		animated_sprite_2d.play("descente")
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right") 
	
	if direction > 0 and not is_stuck_onWall:
		animated_sprite_2d.flip_h = false
		
	elif direction < 0 and not is_stuck_onWall:
		animated_sprite_2d.flip_h = true
		
	if direction == 0 and is_on_floor():
		animated_sprite_2d.play("idle")
		
	elif is_on_floor():
		animated_sprite_2d.play("marche")
		
	if direction and not is_stuck_onWall: 
		velocity.x = direction * SPEED
		
	elif direction and Input.is_action_just_pressed("ui_up") and is_stuck_onWall :
		animated_sprite_2d.position.x = 0
		is_stuck_onWall = false
		velocity.y = JUMP_VELOCITY
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_just_pressed("Use") and PlayerVar.hasWings :
		is_floating = true
		PlayerVar.hasWings = false
		TimerWings.start()
	
	if Input.is_action_just_pressed("UsePick") and PlayerVar.onWall and PlayerVar.hasPick :
		if not animated_sprite_2d.flip_h :
			animated_sprite_2d.play("acrochage")
			animated_sprite_2d.position.x = 8
			
		elif animated_sprite_2d.flip_h :
			animated_sprite_2d.play("acrochage")
			animated_sprite_2d.position.x = -8
			
		is_stuck_onWall = true
		PlayerVar.hasPick = false
		

	_check_bounce(delta)
	move_and_slide()
	
func _check_bounce(delta):
	if velocity.y > 0:
		for raycast in bounce_raycasts.get_children():
			raycast.target_position = Vector2.DOWN * velocity * delta + Vector2.DOWN
			raycast.force_raycast_update()
			if raycast.is_colliding() && raycast.get_collision_normal() == Vector2.UP:
				velocity.y = (raycast.get_collision_point() - raycast.global_position - Vector2.DOWN).y / delta
				raycast.get_collider().entity.call_deferred("be_bounced_upon", self)
				break
		


func bounce (bounce_velocity = BOUNCE_VELOCITY):
	velocity.y = bounce_velocity



func _on_timer_timeout():
	is_floating = false
	TimerWings.stop()
