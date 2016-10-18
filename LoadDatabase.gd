extends Control
signal databaseLoaded

var dataBase = {
	"tables":{}
}
var fileLoc

func setFileLocation(loc):
	global.fileLoc = loc
	global.dataBase = global.loadFile(loc)
	print('m about to load this you')
	emit_signal("databaseLoaded")
	queue_free()
	
func _ready():
	get_node("DatabaseLocation").popup()
	get_node("DatabaseLocation").connect("file_selected",self,"setFileLocation")
