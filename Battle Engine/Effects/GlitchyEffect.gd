extends ColorRect


var Amount = 0
var Speed = 1
var timer = 0

func _process(delta):
	Amount = lerp(Amount,0,Speed * delta)
	timer += 20 * delta
	self.material.set_shader_param("rxamount",sin(timer) * Amount)
	self.material.set_shader_param("ryamount",cos(timer) * Amount)
	self.material.set_shader_param("bxamount",sin(timer) * -Amount)
	self.material.set_shader_param("byamount",cos(timer) * -Amount)
