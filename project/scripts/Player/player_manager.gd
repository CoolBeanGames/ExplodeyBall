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

var input : Vector2
var direction : Vector2
@export var player_move_speed : float = 300

func _ready() -> void:
	idle_state._initialize(self)
	freeze_state._initialize(self)
	paused_state._initialize(self)
	gameplay_state._initialize(self)
	attacking_state._initialize(self)
	dead_state._initialize(self)
	
	current_state=gameplay_state #this will need changed to idle
	current_state._enter_state()
	

func _process(delta: float) -> void:
	current_state._update(delta)

func _physics_process(delta: float) -> void:
	current_state._fixed_update(delta)
