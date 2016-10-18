extends Control
var default = {
	"Value":false
}
func toggleDefault(value= null):
	default['Value'] = value

func _ready():
	get_node("Default").connect("toggled",self,"toggleDefault")
