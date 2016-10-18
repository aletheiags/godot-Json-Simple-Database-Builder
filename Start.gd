extends Control

signal databaseLoaded
func databaseLoaded():
	print(' I got here yo')
	emit_signal("databaseLoaded")
	queue_free()

func _on_LoadDatabase_pressed():
	var loadDb = load("res://LoadDatabase.tscn").instance()
	loadDb.connect("databaseLoaded",self,"databaseLoaded")
	add_child(loadDb)

func _on_CreateDatabase_pressed():
	var createDb = load("res://CreateDataBase.tscn").instance()
	createDb.connect("databaseCreated",self, 'databaseLoaded')
	add_child(createDb)