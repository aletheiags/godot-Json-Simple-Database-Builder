extends Node

var dataBase = {}
var fileLoc
var onTable

func saveFile(location,data):
	var file = File.new()
	file.open(location, file.WRITE)
	file.store_string(data.to_json())
	file.close()

func loadFile(file):
	var dataFile = File.new()
	if dataFile.file_exists(file):
		var dict = {}
		dataFile.open(file, File.READ)
		dict.parse_json(dataFile.get_as_text())
		return dict