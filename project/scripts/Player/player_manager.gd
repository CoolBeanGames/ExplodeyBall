extends CharacterBody2D
class_name player_manager

@export var current_state : player_state_base
###states
@onready var idle_state : player_idle_state = $States/idle
@onready var freeze_state : player_freeze_state = $States/freeze
@onready var paused_state : player_paused_state = $States/paused
@onready var gameplay_state : player_gameplay_state = $States/gameplay
@onready var attacking_state : player_attacking_state = $States/attacking
@onready var dead_state : player_dead_state = $States/dead
###end states

func _ready() -> void:
	idle_state._initialize(self)
	freeze_state._initialize(self)
	paused_state._initialize(self)
	gameplay_state._initialize(self)
	attacking_state._initialize(self)
	dead_state._initialize(self)
	
	current_state=gameplay_state #this will need changed to idle
	current_state._enter_state()
	
	
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _process(delta: float) -> void:
	current_state._update(delta)

func _physics_process(delta: float) -> void:
	current_state._fixed_update(delta)
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
