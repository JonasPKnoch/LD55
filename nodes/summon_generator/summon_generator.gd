extends Node

class_name SummonGenerator

var events_dir: DirAccess = DirAccess.open("res://summon_events")
var events: Array[SummonEvent] = []

func _ready():
	var files = events_dir.get_files()
	for file in files:
		events.append(load(file).instantiate())

func _process(delta):
	pass
