extends Control

class_name SummonDialogue

@onready var dialogue_text = $DialogueText
@onready var defy_button = $DefyButton
@onready var accept_button = $AcceptButton
@onready var continue_button = $ContinueButton

@export var dialogue_manger: DialogueManager

func start_dialogue():
	visible = true
	dialogue_text.text = dialogue_manger.get_current_dialogue().text
	set_continue_enabled(!dialogue_manger.get_current_dialogue().refutable)

func end_dialogue():
	visible = false

func _on_procede_button_pressed():
	dialogue_manger.progress_dialogue()
	if dialogue_manger.dialogue_finished():
		end_dialogue()
		return
	dialogue_text.text = dialogue_manger.get_current_dialogue().text
	set_continue_enabled(!dialogue_manger.get_current_dialogue().refutable)

func _on_defy_button_pressed():
	dialogue_text.text = dialogue_manger.get_current_dialogue().defy_text
	set_continue_enabled(true)

func _on_continue_button_pressed():
	_on_procede_button_pressed()
	set_continue_enabled(false)

func set_continue_enabled(enabled: bool):
	defy_button.visible = !enabled
	accept_button.visible = !enabled
	continue_button.visible = enabled
