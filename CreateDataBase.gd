extends Control
signal databaseCreated

var dataBase = {
	"tables":{}
}
var fileLoc

func setFileLocation(loc):
	fileLoc = loc.replacen('.json','')+'.json'
	get_node("DatabaseFileLocation/FileLocation").set_text(fileLoc)
	
func _ready():
	get_node("DatabaseLocation").connect("file_selected",self,"setFileLocation")

func _on_databaseFileLocation_pressed():
	get_node("DatabaseLocation").popup()
	
func _on_CreateDatabase_pressed():
	global.saveFile(fileLoc,dataBase)
	global.dataBase = dataBase
	global.fileLoc = fileLoc
	emit_signal("databaseCreated")
	queue_free()
	
	