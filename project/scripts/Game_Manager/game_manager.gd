extends Node2D
class_name game_manager

#definitions for the states
var current_state : game_state_base
@onready var gameplay : gameplay_state = $Game_State/Gameplay as gameplay_state
@onready var countdown : countdown_state = $Game_State/Count_Down as countdown_state
@onready var game_over : gameover_state = $Game_State/Game_over as gameover_state

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gameplay._initialize(self)
	countdown._initialize(self)
	game_over._initialize(self)
	
	current_state = gameplay
	current_state._enter_state()
	GlobalReferences._game_manager = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_state._update(delta)

func _physics_process(delta: float) -> void:
	current_state._fixed_update(delta)
