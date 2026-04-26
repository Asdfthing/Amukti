extends CharacterBody2D
class_name Player

@export_group("movement")
@export var speed: float;

@export var acceleration: float;
@export var deceleration: float;


@export_group("STATS")
@export var hp: float = 100.0;
@export var shield_hp: float = 0.0;

@export var defense: int = 0;


func _ready() -> void:
	global_position = get_viewport_rect().size/2


func _physics_process(delta):
	move();
	move_and_slide();

func get_direction() -> Vector2:
	return Input.get_vector("left", "right", "up", "down");

func move() -> void:
	if get_direction():
		velocity = velocity.lerp(get_direction() * speed, acceleration);
	else:
		velocity = velocity.lerp(Vector2.ZERO, deceleration);
	
