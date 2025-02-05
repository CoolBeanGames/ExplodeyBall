extends player_state_base
class_name player_attacking_state

signal attack_done

func _initialize(manager : player_manager):
		super._initialize(manager)
		
		func _update(delta: float):
				super._update(delta)
				
				func _fixed_update(delta: float):
						super._fixed_update(delta)
						
						func _enter_state():
								_manager.velocity=Vector2.ZERO
									spawn_attack()
										$"attack timer".start(0.5)
											print("entered attack state")
												super._enter_state()
												
												func _exit_state():
														$"attack timer".stop()
															super._exit_state()
															
															func next_state(new_state : player_state_base):
																	super.next_state(new_state)
																	
																	func _on_attack_timer_timeout() -> void:
																			attack_done.emit()
																				next_state(_manager.prev_state)
																					pass # Replace with function body.
																					
																					func spawn_attack():
																							print("spawn attack  ")
		func _update(delta: float):
				super._update(delta)
				
				func _fixed_update(delta: float):
						super._fixed_update(delta)
						
						func _enter_state():
								_manager.velocity=Vector2.ZERO
									spawn_attack()
										$"attack timer".start(0.5)
											print("entered attack state")
												super._enter_state()
												
												func _exit_state():
														$"attack timer".stop()
															super._exit_state()
															
															func next_state(new_state : player_state_base):
																	super.next_state(new_state)
																	
																	func _on_attack_timer_timeout() -> void:
																			attack_done.emit()
																				next_state(_manager.prev_state)
																					pass # Replace with function body.
																					
																					func spawn_attack():
																							print("spawn attack  
																							")
		func _update(delta: float):
				super._update(delta)
				
				func _fixed_update(delta: float):
						super._fixed_update(delta)
						
						func _enter_state():
								_manager.velocity=Vector2.ZERO
									spawn_attack()
										$"attack timer".start(0.5)
											print("entered attack state")
						
	var atk : PackedScene = load("res://scenes/Player/attack.tscn")
	var atk_i : Node2D = atk.instantiate()
	atk_i.position = _manager.position + ( _manager.direction * 2 )
	var atk_m : attack_manager = atk_i
	attack_done.connect(atk_m._attack_done())
	_manager.add_child(atk_i)
