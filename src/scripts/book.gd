extends Node2D


var book = [
	"Test1",
	"Test2",
	"Test3",
	"Test4",
	"Test5",
	"Test6",
	"Test7"
]

var ind = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$LeftButton.pressed.connect(_pageDown)
	$RightButton.pressed.connect(_pageUp)
	_updateText()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass	
	
func _pageUp():
	if(ind < floor((book.size() - 1) / 2)):
		ind += 1
	_updateText()
	
func _pageDown():
	if(ind != 0):
		ind -= 1
	_updateText()
	
func _updateText():
	$Label1.text = book[ind*2]
	if(book.size() != ind*2+1):
		$Label2.text = book[ind*2+1]
	else:
		$Label2.text = ""
