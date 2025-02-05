extends game_state_base
class_name countdown_state
#made this change to test commit
#a second change to test SSH

func _initialize(manager : game_manager) -> void:
	super._initialize(manager)

func _update(delta: float) -> void:
	super._update(delta)

func _fixed_update(delta: float) -> void:
	super._fixed_update(delta)

func _enter_state() -> void:
	super._enter_state()

func _exit_state() -> void:
	super._exit_state()

func next_state(new_state : game_state_base) -> void:
	super.next_state(new_state)
