extends Control
var optionModal = load('res://AddOption.tscn')
var anOption = load("res://AnOption.tscn")

var options = []

func reOrderOptions():
	var opts = get_node("Options").get_children()
	for i in range(options.size()):
		opts[i].set_pos(Vector2(0,i*30))

func removeOption(option):
	options.erase(option)
	reOrderOptions()
	
func addOption(option):
	var aO = anOption.instance()
	get_node("Options").add_child(aO)
	aO.setOption(option)
	aO.set_pos(Vector2(0,(get_node("Options").get_children().size()-1)*30))
	options.append(option)
	aO.connect("optionRemoved",self,"removeOption")


func showModal():
	var modal = optionModal.instance()
	add_child(modal)
	modal.connect('optionCreated', self,'addOption')

func _ready():
	get_node("AddOptionButton").connect("pressed",self,'showModal')
