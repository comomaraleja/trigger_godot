extends Control

signal trigger
var t 
@export var intervalo = 1
@export var int_decay = 0.2

func _input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			t = create_tween()
			t.set_trans(Tween.TRANS_SPRING)
			t.tween_property($ProgressBar, "value", $ProgressBar.max_value, intervalo)
			t.tween_callback(release)
			
		if event.button_index == 1 and not(event.pressed):
			release()
			t.stop()

func release():
	trigger.emit()
	var r = create_tween()
	r.tween_property($ProgressBar, "value", $ProgressBar.min_value, int_decay)
