extends Node
class_name scene_loader

@onready var scene_root = $"../Scene_Root"
##TODO: Replace with packed scene references here
##@export var scene_name : PackedScene
##then assign in the inspector
@export var gameplay_scene : PackedScene

signal on_load
signal on_unload(scene_name : String)
signal on_add(scene_name : String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalReferences._scene_loader = self
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#unloads a current scene
func _unload_scene():
	on_unload.emit()
	var children = scene_root.get_children()
	for c in children:
		c.queue_free()

#erases the current scene and loads in a new one
func _load_scene(scene : PackedScene):
	on_load.emit(scene.resource_name)
	_unload_scene()
	var S = scene.instantiate()
	scene_root.add_child(S)
	print("added " + str(scene_root.get_child_count())  + " child object(s)")

#loads in a new scene without erasing the current one
func _load_scene_additive(scene : PackedScene):
	on_add.emit(scene.resource_name)
	var S = scene.instantiate()
	scene_root.add_child(S)
	print("added " + str(scene_root.get_child_count())  + " child object(s)")
