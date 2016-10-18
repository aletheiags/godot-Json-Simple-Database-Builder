extends Control

func loadSelectTables():
	var selectTable = load("res://SelectTable.tscn").instance()
	add_child(selectTable)

func _ready():
	var start = load("res://Start.tscn").instance()
	start.connect("databaseLoaded",self,"loadSelectTables")
	add_child(start)