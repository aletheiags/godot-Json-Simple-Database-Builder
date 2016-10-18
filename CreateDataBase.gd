extends Control
signal databaseCreated

var dataBase = {
	"tables":{}
}

var fileLoc

func setFileLocation(file):
	fileLoc = file.replacen('.json','')+'.json'
	global.saveFile(fileLoc,dataBase)
	global.dataBase = dataBase
	global.fileLoc = fileLoc
	emit_signal("databaseCreated")
	queue_free()
	
func _ready():
	get_node("DatabaseLocation").popup()
	get_node("DatabaseLocation").connect("file_selected",self,"setFileLocation")	

