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
func on_word_pressed(btn):
	if btn in selected_buttons:
		btn.modulate = Color. DARK_SLATE_BLUE
		selected_buttons.erase(btn)
	else :
		if selected_buttons.size() < 4:
			btn.modulate = Color.ALICE_BLUE
			selected_buttons.append(btn)
		if selected_buttons.size() == 4:
			_check_selection()
func _check_selection():
	var groups = []
	for btn in selected_buttons:
		var word_data = words.find({"word": btn.text, "group": null}) #ei toimi näin suoraan, parempi:
		for data in words:
			if data["word"] == btn.text:
				groups.append(data["group"])
				break
	if groups.all(func(g): return g == groups[0]):
		message_label.text= "Oikein! Ryhmä: %s" % groups[0]
		for btn in selected_buttons:
			btn.disabled = true
			btn.modulate = Color.DARK_MAGENTA
	else :
		message_label.text = "Väärin! Yritä uudestaan."
		for btn in selected_buttons :
			btn.modulate = Color.CRIMSON
			selected_buttons.clear()
