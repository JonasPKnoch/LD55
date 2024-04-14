extends Node3D

class_name SummonManager

@onready var dialogue_manager = $DialogueManager
@onready var dialogue_ui = $SummonDialogueUI

func _ready():
	var children = get_children()
	for child in children:
		if child is SummonEvent:
			dialogue_manager.get_dialogue_events(child)
	
	dialogue_ui.start_dialogue()
