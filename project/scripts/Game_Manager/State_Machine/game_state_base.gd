extends Node
class_name game_state_base

#this is a basic game state for referencing from the other states
@export var _manager : game_manager
signal state_entered
signal state_exited
signal state_change_requested
# Called when the node enters the scene tree for the first time.
func _initialize(manager : game_manager):
	_manager = manager
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update(delta: float):
	pass

func _fixed_update(delta: float):
	pass

func _enter_state():
	state_entered.emit()
	pass

func _exit_state():
	state_exited.emit()
	pass

func next_state(new_state : game_state_base):
	state_change_requested.emit()
	_exit_state()
	new_state._enter_state()
	pass
