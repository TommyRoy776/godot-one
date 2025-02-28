extends CharacterBody2D

@export var speed: int = 300
signal laser(pos)
var can_shoot: bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(640,600)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction*speed
	move_and_slide()
	if Input.is_action_pressed("shoot") and can_shoot:
		laser.emit($LaserStartPos.global_position)
		$LaserSound.play()
		can_shoot = false
		$LaserTimer.start()

func _on_laser_timer_timeout() -> void:
	can_shoot = true
	
func play_collision_sound():
	$DamageSound.play()
