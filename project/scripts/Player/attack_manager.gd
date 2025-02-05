extends Node2D
class_name attack_manager


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("spawned attack")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _attack_done():
	GlobalReferences.player.attacking_state.attack_done.disconnect(_attack_done())
	pass
