extends player_state_base
class_name player_gameplay_state

func _initialize(manager : player_manager):
	super._initialize(manager)

func _update(delta: float):
	#update our input values
	_manager.input.x = Input.get_axis("left","right")
	_manager.input.y = Input.get_axis("up","down")
	
	#update the players direction
	if _manager.input != Vector2.ZERO:
		_manager.direction = _manager.input.normalized()
	
	#do movement
	if _manager.input:
		_manager.velocity = _manager.input * _manager.player_move_speed
	else:
		_manager.velocity.x = move_toward(_manager.velocity.x, 0, _manager.player_move_speed )
		_manager.velocity.y = move_toward(_manager.velocity.y, 0, _manager.player_move_speed )
	_manager.move_and_slide()
	
	#we pressed the attack button so now we attack
	if Input.is_action_just_released("attack"):
		next_state(_manager.attacking_state)
	super._update(delta)

func _fixed_update(delta: float):
	super._fixed_update(delta)

func _enter_state():
	super._enter_state()

func _exit_state():
	super._exit_state()

func next_state(new_state : player_state_base):
	super.next_state(new_state)
