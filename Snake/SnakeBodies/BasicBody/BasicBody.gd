extends SnakeBodySeg


func _on_health_out_of_health():
	died.emit(self)
	pass # Replace with function body.

func attack() -> float:
	return 10.0

func hit_by(body):
	var attacker = body.get_parent() 
	if attacker is SnakeBodySeg:
		if attacker.seg_num < self.seg_num:
			print("body %s hit by body %s" % [self.seg_num, attacker.seg_num])
			var damage = attacker.attack()
			$Health.recieve_damage(damage)
	elif attacker is SnakeHeadSeg:
		print("body %s hit by head" % self.seg_num)
		var damage = attacker.attack()
		$Health.recieve_damage(damage)
	pass # Replace with function body.
