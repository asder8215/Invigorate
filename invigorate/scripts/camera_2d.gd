extends Camera2D

func _on_window_resized(width, height):

	var new_zoom = camera.zoom * (get_viewport().get_size().x / previous_width)

	camera.zoom = new_zoom 

	

	# Update previous_width for next resize calculation

	previous_width = width 
