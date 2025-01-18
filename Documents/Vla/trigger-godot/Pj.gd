extends Node2D
@export var rad = 5


func _process(delta):
	queue_redraw()

func _draw():
	draw_circle(Vector2.ZERO, rad, Color.CORNFLOWER_BLUE)

func explotar(i):
	var exp = create_tween()
	exp.set_trans(Tween.TRANS_ELASTIC)
	exp.tween_property(self, "rad", i, 0.3)
	
	await exp.finished
	
	var cont = create_tween()
	cont.set_trans(Tween.TRANS_CUBIC)
	cont.tween_property(self, "rad", 5, 0.3)
