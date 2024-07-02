extends Control

signal music_vol_changed(volume : float)
signal sfx_vol_changed(volume : float)
signal start_game_select


func _on_music_volume_slider_value_changed(value):
	music_vol_changed.emit(value)
	pass # Replace with function body.


func _on_sfx_volume_slider_value_changed(value):
	sfx_vol_changed.emit(value)
	pass # Replace with function body.


func _on_start_game_button_button_up():
	start_game_select.emit()
	pass # Replace with function body.
