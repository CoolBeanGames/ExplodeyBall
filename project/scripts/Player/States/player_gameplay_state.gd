extends player_state_base
class_name player_gameplay_state

func _initialize(manager : player_manager):
	super._initialize(manager)

func _update(delta: float):
	super._update(delta)

func _fixed_update(delta: float):
	super._fixed_update(delta)

func _enter_state():
	super._enter_state()

func _exit_state():
	super._exit_state()

func next_state(new_state : player_state_base):
	super.next_state(new_state)
