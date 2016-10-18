extends Panel

var fieldType
var extra = {}
signal fieldCreated 

func typeSelected(type= null):
	fieldType = get_node("Field_Type").types[type]
	var children = get_node("Extras").get_children()
	for child in children:
		child.queue_free()
	extra = {}
	call(fieldType+'Selected')

func TextSelected():
	print('So you selected a '+fieldType+'. Now what do you want ot do')

func DropDownFromFieldSelected():
	print("I need to make a dropdown from the Table/ Field")
	
func DropDownSelected():
	print('So you selected a '+fieldType+'. Now what do you want ot do')
	var DDS = load("res://DropDownExtras.tscn").instance()
	get_node("Extras").add_child(DDS)
	extra["DropDownOptions"] = DDS.options

func TrueFalseSelected():
	var TF = load("res://TrueFalseExtras.tscn").instance()
	print('So you selected a '+fieldType+'. Now what do you want ot do')
	get_node("Extras").add_child(TF)
	
	extra["Default"] = TF.default
	
func NumberSelected():
	print('So you selected a '+fieldType+'. Now what do you want ot do')

func createField():
	var field = {
		"FieldName":get_node("Field_Name").get_text(),
		"FieldType":fieldType,
		"Extras":extra
	}
	
	emit_signal("fieldCreated",field)
	queue_free()

func _ready():
	get_node("AddField").connect("pressed",self, "createField")
	get_node("Cancel").connect("pressed",self,"queue_free")