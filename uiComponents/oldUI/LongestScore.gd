extends Label

var count : int = 0

func _on_tail_length_changed(new_length):
	count = max(count,new_length)
	text = "%s" % count
	pass # Replace with function body.
