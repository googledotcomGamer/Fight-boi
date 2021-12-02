extends ProgressBar

export (Color) var healthy_color = Color.green
export (Color) var caution_color = Color.yellow
export (Color) var danger_color = Color.red
export (float, 0 , 1, 0.05) var caution_zone = 0.05
export (float, 0 , 1, 0.05) var danger_zone = 0.02

func _on_health_updated(health, amount):
	health_over.valve = health
	update_tween.interpolated_property(health_under, "valve", health_under.valve, health, 0.4, tween.TRANS_SINE, tween.EASE_IN_OUT_)
	update_tween.start()
	
	_assign_color(health)
	
func _assign_color(health)
	if health < health_over .max_value * danger_zone:
		health_over .tint_progres = danger_color
	elif health < health_over.max_value * caution_zone:
		health_over.tint_progress = caution_color
	else
		health_over .tint_progress = health_color
	
	
	
	func on_max_health_updated(max_health):
		health_over .max_value = max_health
		health_under .max_value = max_heath
