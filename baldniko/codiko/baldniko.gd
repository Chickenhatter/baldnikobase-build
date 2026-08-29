extends CharacterBody2D
var webshoot = false
var lunge = false

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
func _ready() -> void:
	legr(0)
	legl(0)

func _physics_process(delta: float) -> void:
	
	
	var movement = Vector2.ZERO
	if webshoot == false:
		if Input.is_action_pressed('ui_a'):
			$".".rotation_degrees -= 2
			legr(delta*0.5)
			legl(-delta*0.5)
		if Input.is_action_pressed('ui_d'):
			$".".rotation_degrees += 2
			legr(-delta*0.5)
			legl(delta*0.5)
		if Input.is_action_pressed('ui_w'):
			legr(delta)
			legl(delta)
			movement = Vector2.UP.rotated(deg_to_rad(rotation_degrees))
		if Input.is_action_pressed('ui_s'):
			legr(-delta)
			legl(-delta)
			movement = Vector2.DOWN.rotated(deg_to_rad(rotation_degrees))
	if webshoot == true:
		$webshooter/CharacterBody2D.global_position = $webshooter/Node2D2/Node2D.global_position
		$webshooter/Node2D.scale.y += 15
		$webshooter/Node2D2.global_position = $webshooter/Node2D/Sprite2D/Node2D.global_position
		#var lololo = Vector2.ZERO
		#lololo = Vector2.DOWN.rotated(deg_to_rad(rotation_degrees))
		#
		#$webshooter/CharacterBody2D.velocity = lololo * 1500
		#
		$webshooter/CharacterBody2D.move_and_slide()
		if ($webshooter/CharacterBody2D.is_on_wall()) or ($webshooter/CharacterBody2D.is_on_floor()) or ($webshooter/CharacterBody2D.is_on_ceiling()):
			var tween = create_tween()
			tween.tween_property(self, "global_position", $webshooter/CharacterBody2D.global_position, 1.0)
			var heen = create_tween()
			heen.tween_property($webshooter/Node2D, "scale:y", 0.012, 1.0)
			$webshooter/CharacterBody2D.global_position = $webshooter/Sprite2D2.global_position
			webshoot = false
	velocity = movement * 300
	
	if Input.is_action_pressed('ui_t'):
		webshoot = true
	move_and_slide()
	
	
	
	
	












var a = 0
var b = 0





func legr(delta):
	a += delta*9
	
	$legs/first/first.rotation_degrees = 20*sin(a)+20
	$legs/first/first/first.rotation_degrees = 20*sin(a-10)+20
	
	$legs/second/second.rotation_degrees = 20*sin(a-30)+10
	$legs/second/second/second.rotation_degrees = 20*sin(a-150)+20
	
	$legs/third/third.rotation_degrees = 20*sin(a-60)-10
	$legs/third/third/first.rotation_degrees = 20*sin(a-10)+20
	
	$legs/fourth/fourth.rotation_degrees = 20*sin(a-90)-30
	$legs/fourth/fourth/first.rotation_degrees = 20*sin(a-10)+20



func legl(delta):
	b += delta*9
	
	$legs/fifth/fifth.rotation_degrees = 20*sin(b)-20-180
	$legs/fifth/fifth/first.rotation_degrees = -( 20*sin(b-20)+20)
	
	$legs/sixth/sixth.rotation_degrees = 20*sin(b-30)-10-180
	$legs/sixth/sixth/first.rotation_degrees = -(20*sin(b-150)+20)
	
	$legs/seventh/seventh.rotation_degrees = 20*sin(b-60)+10-180
	$legs/seventh/seventh/first.rotation_degrees = -(20*sin(b-10)+20)
	
	$legs/eighth/eighth.rotation_degrees = 20*sin(b-90)+30-180
	$legs/eighth/eighth/first.rotation_degrees = -(20*sin(b-10)+20)
