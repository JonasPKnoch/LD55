extends Node3D

class_name SummonManager

@onready var dialogue_manager = $DialogueManager
@onready var dialogue_ui = $SummonDialogueUI

var defy_cooldown_length = 1
var current_defy_cooldown = 0

func _ready():
	var children = get_children()
	for child in children:
		if child is SummonEvent:
			dialogue_manager.get_dialogue_events(child)
	
	dialogue_ui.start_dialogue()


func _on_summon_dialogue_ui_correct_defy(value):
	pass # Replace with function body.

func _on_summon_dialogue_ui_wrong_defy():
	current_defy_cooldown = defy_cooldown_length
	defy_cooldown_length += 1
	dialogue_ui.set_can_defy(false)


func _on_summon_dialogue_ui_accept():
	if current_defy_cooldown > 0:
		current_defy_cooldown -= 1
		
	if current_defy_cooldown == 0:
		dialogue_ui.set_can_defy(true)
	
