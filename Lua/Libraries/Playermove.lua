local speed=0
local movespeed=0
local movi=false
		
if Encounter.GetVar("movefast")==true then
	speed=3
	else speed=2
end
Player.SetControlOverride(true)

function Moving()
	
if Input.Cancel==0 then
	movespeed=speed
	else
	movespeed=speed/2
end
if Input.Up==0 and Input.Down>0 then
	Player.MoveTo(Player.x,Player.y-movespeed,false)
	elseif Input.Up>0 and Input.Down==0 then
	Player.MoveTo(Player.x,Player.y+movespeed,false)
end
Player.MoveTo(Player.x,Player.y,false)

if Input.Right==0 and Input.Left>0 then
	Player.MoveTo(Player.x-movespeed,Player.y,false)
	elseif Input.Right>0 and Input.Left==0 then
	Player.MoveTo(Player.x+movespeed,Player.y,false)
end
end
function isMoving()
	local moving=false
	if (Input.Up>0 and Input.Down==0 and Player.y<(Arena.height/2-8)) then
		moving=true
	end
	if (Input.Down>0 and Input.Up==0 and Player.y>(-Arena.height/2+8)) then
		moving=true
	end
	if (Input.Right>0 and Input.Left==0 and Player.x<(Arena.width/2-8)) then
		moving=true
	end
	if (Input.Left>0 and Input.Right==0 and Player.x>(-Arena.width/2+8)) then
		moving=true
	end
	return moving
end

