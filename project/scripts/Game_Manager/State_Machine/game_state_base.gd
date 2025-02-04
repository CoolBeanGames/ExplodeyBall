extends Node
class_name game_state_base

#this is a basic game state for referencing from the other states
@export var _manager : game_manager
# Called when the node enters the scene tree for the first time.
func _init(manager : game_manager) -> void:
	_manager = manager
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update(delta: float) -> void:
	pass

func _fixed_update(delta: float) -> void:
	pass

func _enter_state() -> void:
	pass

func _exit_state() -> void:
	pass

func next_state(new_state : game_state_base) -> void:
	_exit_state()
	new_state._enter_state()
	pass
