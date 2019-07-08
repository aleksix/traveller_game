extends KinematicBody2D

export (int) var speed = 200

var target = Vector2()
var velocity = Vector2()
var moving = false

func _ready():
	target = position
	$camera.current = true

func _input(event):
	if Input.is_action_just_pressed('click'):
		moving = true
	if Input.is_action_just_released('click'):
		moving = false
	if Input.is_action_pressed('click') and moving:
		target = get_global_mouse_position()

func _physics_process(delta):
	if moving:
	    velocity = (target - position).normalized() * speed
	    if (target - position).length() > 5:
	        velocity = move_and_slide(velocity)

func _on_vision_area_entered(area):
	# Not sure if this way is good enough
	area.event_visible()

func _on_vision_area_exited(area):
	area.event_invisible()

func _on_event_collision_area_entered(area):
	area.fire_event()
