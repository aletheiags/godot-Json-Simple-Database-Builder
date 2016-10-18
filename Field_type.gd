extends OptionButton

var types = ['Text','DropDown','TrueFalse','Number','DropDownFromField']

func _ready():
	for i in types:
		add_item(i)
	
	connect("item_selected", get_parent(),'typeSelected')
	
	get_parent().typeSelected(0)