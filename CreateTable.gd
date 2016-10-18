extends Control

var tableData = {
	"tableName":"tableName",
	"fields":{}
}

var addFieldModal = load('res://Field.tscn')
var aField = load("res://AField.tscn")

signal tableSaved

func reOrderFields():
	var fields = get_node("Fields").get_children()
	for i in range(tableData.fields.size()):
		fields[i].set_pos(Vector2(0,i*30))
	print(tableData)
	
func removeField(field):
	tableData.fields.erase(field.FieldName)
	reOrderFields()

func addField(data):
	tableData.fields[data.FieldName] = data
	var aF = aField.instance()
	get_node("Fields").add_child(aF)
	aF.setField(data)
	aF.set_pos(Vector2(0,(get_node("Fields").get_children().size()-1)*30))
	aF.connect("fieldRemoved",self,"removeField")
	print(tableData)

func loadAddFieldModal():
	var aFM = addFieldModal.instance()
	add_child(aFM)
	aFM.connect("fieldCreated", self, "addField")

func _ready():
	get_node("AddField").connect("pressed",self,"loadAddFieldModal")

func _on_SaveTable_pressed():
	tableData.tableName = get_node("TableName").get_text()
	emit_signal("tableSaved", tableData.tableName)
	global.dataBase.tables[tableData.tableName] = tableData
	global.saveFile(global.fileLoc,global.dataBase)
	queue_free()