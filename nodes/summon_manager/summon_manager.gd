extends Node3D

class_name SummonManager

@onready var dialogue_manager = $DialogueManager

func _ready():
	var children = get_children()
	for child in children:
		if child is SummonEvent:
			dialogue_manager.get_dialogue_events(child)
