extends Node


# PLEASE DON'T USE THIS TO TIME YOUR GAME.
# This goes from 0 to 100 as a percentage of progress.
# It is not the standard timer.
# Your shit will break.
var timer = 0
var TIMER_FINISH = 0

# This is redundant, if you leave immediately after.
var timerToggle = false

# Set timer to 0.
func _ready():
	Global.is_minigame_ready = false
	$ConfirmButton.pressed.connect(_startGame)
	$ConfirmButton.show()
	$Instructions.show()
	$BlackoutScreen.show()
	$Countdown.hide()
	$Score.hide()
	$Timer.value = 0
	TIMER_FINISH = $Timer.get_meta("TimerDuration")

# Update timer, stop when done.
func _process(delta):
	if(timerToggle):
		timer += delta * 100 / TIMER_FINISH
		$Timer.value = timer
		if($Timer.value == 100):
			timerToggle = false
			_endGame()
	
func _startGame():
	$ConfirmButton.hide()
	$Instructions.hide()
	$BlackoutScreen.hide()
	_countdown()
	
func _countdown():
	$Countdown.show()
	$Countdown.text = "3"
	await get_tree().create_timer(0.75).timeout
	$Countdown.text = "2"
	await get_tree().create_timer(0.75).timeout
	$Countdown.text = "1"
	await get_tree().create_timer(0.75).timeout
	$Countdown.text = "GO!"
	Global.is_minigame_ready = true
	TIMER_FINISH = $Timer.get_meta("TimerDuration")
	await get_tree().create_timer(0.75).timeout
	$Countdown.hide()
	timerToggle = true
	set_meta("Toggle", timerToggle)
	
	
	
func _endGame():
	Global.is_minigame_ready = false
	$BlackoutScreen.show()
	$Score.text = "Score:\n" + str(self.get_meta("Score"))
	Global.totalScore = self.get_meta("Score")
	$Score.show()
	$ConfirmButton.pressed.disconnect(_startGame)
	$ConfirmButton.pressed.connect(_crash)
	$ConfirmButton.show()
	
	
func _crash():
	get_tree().change_scene_to_file("res://src/scenes/main.tscn")

