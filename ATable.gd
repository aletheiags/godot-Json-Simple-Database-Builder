extends Control

signal loadTable
signal editTable

func _on_View_pressed():
	global.onTable = get_node("TableName").get_text()
	emit_signal('loadTable')

func _on_Edit_pressed():
	global.onTable = get_node("TableName").get_text()
	emit_signal('editTable')
