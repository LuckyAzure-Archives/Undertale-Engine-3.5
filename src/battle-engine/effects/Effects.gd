extends CanvasLayer

var WaveAmount = 0
var WaveSpeed = 10

var Amount = 0
var Speed = 10
var timer = 0

func RGB_Effect(Amountaa,Speedaa):
	Amount = Amountaa
	Speed = Speedaa

func Wave_Effect(Amountaa,Speedaa):
	WaveAmount = Amountaa
	WaveSpeed = Speedaa

func _process(delta):
	WaveAmount = lerp(WaveAmount,0,WaveSpeed * delta)
	$ColorRect.material.set_shader_param("shake_power",WaveAmount)
	
	Amount = lerp(Amount,0,Speed * delta)
	timer += 20 * delta
	$ColorRect.material.set_shader_param("rxamount",sin(timer) * Amount)
	$ColorRect.material.set_shader_param("ryamount",cos(timer) * Amount)
	$ColorRect.material.set_shader_param("bxamount",sin(timer) * -Amount)
	$ColorRect.material.set_shader_param("byamount",cos(timer) * -Amount)
