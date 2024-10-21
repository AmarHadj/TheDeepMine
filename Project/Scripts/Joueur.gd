extends CharacterBody2D

@onready var bounce_raycasts = $BounceRayCasts
@onready var timer = $Timer

const SPEED = 200.0
const JUMP_VELOCITY = -250.0
const BOUNCE_VELOCITY = -200.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var CheckDamage
var float_timer = 2.0
var is_floating = false
var is_onWall = false


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor() and is_onWall : 
		velocity.y = 0
		
	elif not is_on_floor() and is_floating:
		velocity.y = gravity/100
		
	elif not is_on_floor():
		velocity.y += gravity * delta
		CheckDamage = velocity.y
	
	
	if is_on_floor() :
		if CheckDamage > 600 : # a ajuster quand je vais faire le level design
			self.visible = false
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("ui_up") and not is_on_floor() and PlayerVar.hasBoots:
		velocity.y = JUMP_VELOCITY
		PlayerVar.hasBoots = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction and not is_onWall:
		velocity.x = direction * SPEED
		
	elif direction and Input.is_action_just_pressed("ui_up") and is_onWall :
		is_onWall = false
		velocity.y = JUMP_VELOCITY
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_just_pressed("Use") and PlayerVar.hasWings :
		is_floating = true
		timer.start()
	
	if Input.is_action_just_pressed("UsePick") and PlayerVar.onWall and PlayerVar.hasPick :
		is_onWall = true
		PlayerVar.hasPick = false
		timer.start()
		

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
	PlayerVar.hasWings = false
	
	is_onWall = false
	PlayerVar.hasPick = false
	timer.stop()
