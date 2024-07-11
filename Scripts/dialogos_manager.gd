extends Node2D

var dialogues = [
	{
		"character": "Jogador",
		"portrait": "res://path/to/character1_portrait.png",
		"text": "Desculpe a demora...",
		"duration": 3.0
	},
	{
		"character": "Amiga",
		"portrait": "res://path/to/character2_portrait.png",
		"text": "...
				 tudo bem...",
		"duration": 3.0
	},
	{
		"character": "Jogador",
		"portrait": "res://path/to/character1_portrait.png",
		"text": "(ela tá bolada)
				 hmm, então, voce notou alguma coisa estranha na cidade?",
		"duration": 3.0
	},
]

var current_dialogue_index = 0

@onready var dialog_label = $DialogBox/NinePatchRect/Label
@onready var character1_portrait = $retrato01
@onready var character2_portrait = $retrato02
@onready var dialogue_timer = $Timer

func _ready():
	show_dialogue()

func show_dialogue():
	var dialogue = dialogues[current_dialogue_index]
	dialog_label.text = dialogue["text"]
	
	if dialogue["character"] == "Character1":
		character1_portrait.texture = load(dialogue["portrait"])
		character2_portrait.texture = null
	else:
		character2_portrait.texture = load(dialogue["portrait"])
		character1_portrait.texture = null

	dialogue_timer.start(dialogue["duration"])

func _on_Timer_timeout():
	current_dialogue_index += 1
	if current_dialogue_index < dialogues.size():
		show_dialogue()
	else:
		# Final do diálogo
		hide_dialogue()

func hide_dialogue():
	dialog_label.text = ""
	character1_portrait.texture = null
	character2_portrait.texture = null


