extends Control

var option = ''
signal optionRemoved

func removeOption():
	get_parent().remove_child(self)
	emit_signal("optionRemoved",option)

func setOption(o):
	option = o
	get_node("Option").set_text(option)
	
func _ready():
	get_node("Remove").connect("pressed",self,"removeOption")