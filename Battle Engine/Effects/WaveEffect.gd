extends ColorRect


var WaveAmount = 0
var WaveSpeed = 10

var Amount = 0
var Speed = 10
var timer = 0

func _process(delta):
	WaveAmount = lerp(WaveAmount,0,WaveSpeed * delta)
	self.material.set_shader_param("shake_power",WaveAmount)
	
	Amount = lerp(Amount,0,Speed * delta)
	timer += 20 * delta
	self.material.set_shader_param("rxamount",sin(timer) * Amount)
	self.material.set_shader_param("ryamount",cos(timer) * Amount)
	self.material.set_shader_param("bxamount",sin(timer) * -Amount)
	self.material.set_shader_param("byamount",cos(timer) * -Amount)
