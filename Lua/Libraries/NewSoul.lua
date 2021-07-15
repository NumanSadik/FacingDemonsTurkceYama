local shades={}
Player.sprite.color={1,0,1}
num=1
for i=1,10 do
	shades[i]=CreateProjectile("ut-heart",Player.x,Player.y,"BelowPlayer")
	shades[i].sprite.color=Player.sprite.color
	shades[i].sprite.alpha=0
	shades[i].SetVar("time",90)
	shades[i].SetVar("color","none")
	shades[i].SetVar("top",50)
	shades[i].SetVar("x",0)
	shades[i].SetVar("y",0)
end

function ShadeSoul(ingo)
if ingo%8==1 then
	local sh=shades[num]
	sh.x=Player.x
	sh.y=Player.y
	sh.SetVar("time",0)
	sh.SetVar("top",30)
	sh.SetVar("x",Player.x)
	sh.SetVar("y",Player.y)
	num=num+1
	if num==11 then
		num=1
	end
end
for i=1,#shades do
	local s=shades[i]
	local time=s.GetVar("time")+1
	s.SetVar("time",time)
	local top=s.GetVar("top")
	if time<top+1 then
		s.sprite.alpha=1-math.sin(time*math.pi/(2*top))
	end
end
end

return shades