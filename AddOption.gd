extends Panel
signal optionCreated
func addOption():
	emit_signal("optionCreated",get_node("Option").get_text())
	queue_free()

func _ready():
	get_node("Cancel").connect('pressed', self, "queue_free")
	get_node("AddOption").connect("pressed",self,'addOption')