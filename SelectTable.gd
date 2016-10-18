var tables = []
var aTable = load("res://ATable.tscn")

func _ready():
	var dataBase = global.dataBase
	for t in dataBase.tables:
		addTableToList(t)
		

func addTableToList(name):
	tables.append(name)
	var tB = aTable.instance()
	get_node("Tables").add_child(tB)
	tB.get_node("TableName").set_text(name)
	tB.set_pos(Vector2(0,tables.size()*30))

func _on_CreateTable_pressed():
	var newTable = load("res://CreateTable.tscn").instance()
	add_child(newTable)
	newTable.connect("tableSaved",self,'addTableToList')