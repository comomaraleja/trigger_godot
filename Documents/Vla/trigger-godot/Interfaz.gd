extends Control
@export var v_increased = 50
@export var v_decay = 300
signal trigger

var espichado = false

func _input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			espichado = true
		if event.button_index == 1 and not(event.pressed):
			trigger.emit()
			espichado = false
	
func _process(delta):
	if espichado:
		$ProgressBar.value += v_increased * delta
	else:
		$ProgressBar.value -= v_decay * delta	
	
	if espichado and $ProgressBar.value == $ProgressBar.max_value:
		trigger.emit()
		espichado = false

