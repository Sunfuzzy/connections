extends Control
@onready var grid = $GridContainer
@onready var message_label = $MessageLabel
var words =[{"word": "omena", "group": "hedelmät"},
{"word": "banaani", "group": "hedelmät"},
{"word": "appelsiini", "group":"hedelmät"},
{"word": "mango", "group":"hedelmät"},
{"word": "liila", "group": "värit"},
{"word": "sininen", "group": "värit"},
{"word": "keltainen", "group": "värit"},
{"word": "punainen", "group": "värit"},
{"word": "sukka", "group": "vaatteet"},
{"word": "paita", "group": "vaatteet"},
{"word": "housut", "group": "vaatteet"},
{"word": "hanskat", "group": "vaatteet"},
{"word": "koira", "group": "kotieläimet"},
{"word": "kissa", "group": "kotieläimet"},
{"word": "lintu", "group": "kotieläimet"},
{"word": "kultakala", "group": "kotieläimet"}]
var selected_buttons = []
func _ready():
	words.shuffle()
	for data in words:
		var btn = Button.new()
		btn.text = data["word"]
		btn.connect("pressed", Callable(self, "_on_word_pressed").bind(btn))
		grid.add_child(btn) 
