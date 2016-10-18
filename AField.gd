extends Control

var field = {}
signal fieldRemoved

func removeField():
	get_parent().remove_child(self)
	emit_signal("fieldRemoved",field)

func setField(f):
	field = f
	get_node("FieldName").set_text(field.FieldName)
	get_node("FieldType").set_text(field.FieldType)

func _ready():
	get_node("Remove").connect("pressed",self,"removeField")