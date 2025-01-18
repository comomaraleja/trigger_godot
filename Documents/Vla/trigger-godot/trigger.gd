extends Node2D

func _on_interfaz_trigger():
	$PJ.explotar($Interfaz/ProgressBar.value)
