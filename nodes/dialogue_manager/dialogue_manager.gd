extends Node

class_name DialogueManager

var dialogue_events: Array[DialogueEvent]
var dialogue_index: int = 0

func get_dialogue_events(summon_event: SummonEvent):
	var children =  summon_event.get_children()
	for child in children:
		if child is DialogueEvent:
			add_dialogue_event(child)

func add_dialogue_event(dialogue_event: DialogueEvent):
	if dialogue_event.priority >= 0:
		for i in range(len(dialogue_events)):
			if dialogue_events[i].priority > dialogue_event.priority:
				dialogue_events.insert(i, dialogue_event)
				return
	
	dialogue_events.append(dialogue_event)

func get_current_dialogue() -> DialogueEvent:
	if dialogue_finished() || dialogue_not_started():
		return null
	return dialogue_events[dialogue_index]

func progress_dialogue():
	dialogue_index += 1

func dialogue_finished():
	return dialogue_index >= len(dialogue_events)

func dialogue_not_started():
	return (dialogue_index < 0)
