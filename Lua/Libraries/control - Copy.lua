local timer=0
local effected=2
local knifehurted=0
local soundtimer=0
local killed=false
local colortime=0
local FPL=nil
local knifetime=5
local longtime=12
local wavetimery=0
local Possessed=Encounter.GetVar("Possessed")
local p1=Encounter.GetVar("PlayerHasSpared")
local p2=Encounter.GetVar("PlayerWasHurted")
local p3=Encounter.GetVar("PlayerHasFlirted")
local ghosts={}

	
function HeartChange(newcolor,sprite)
	Player.sprite.color=newcolor
	colortime=0
	if sprite==nil then
		FPL=CreateProjectile("ut-heart",Player.x,Player.y)
		FPL.sprite.color=newcolor
		else
		FPL=CreateProjectile(sprite,Player.x,Player.y)
		FPL.sprite.color={1,1,1}
	end
end


function coll(b)
	local x=b.x
	local y=b.y
	local px=Player.x
	local py=Player.y
	local w=b.width/2+4
	local h=b.height/2+4
	local hitted=false
	if px-w<x and px+w>x and py-h<y and px+h>y then
		hitted=true
	end
	return hitted
end

function TimeUpd(ingo)
wavetimery=wavetimery+1
local c=0
if not GetGlobal("curse") then	
	elseif Player.lv>1 then
	local c=GetGlobal("curse")
	if (p2>0 or p3>0) then
		if wavetimery%6==0 then
			if not GetGlobal("curse") then
				else
				c=c+1
				if c>Player.hp then
					c=Player.hp
				end
				SetGlobal("curse",c)
			end
		end
		else
		if wavetimery%3==0 then
			if not GetGlobal("curse") then
				else
				c=c+1
				if c>Player.hp then
					c=Player.hp
				end
				SetGlobal("curse",c)
			end
		end
	end
	if Player.hp==c and not Possessed then
		Arena.MoveToAndResize(320,95,565,130,true,true)
		Lower()
		Encounter.Call("Possess")
		State("NONE")
	end
end

if Possessed==true then
	if waverytimer%60==0 then
		ChangeLevel(1)
	end
	if c==0 then
		Possessed=false
		Encounter.SetVar("Possessed",false)
	end
end
if wavetimery==ingo then
	Arena.ResizeImmediate(565,130)
	Arena.MoveTo(320,95,true,true)
	Lower()
	EndWave()
end
end

function Flower()
	if not GetGlobal("curse") then
		else
		local c=GetGlobal("curse")-20
		if c<0 then
			c=0
		end
		SetGlobal("curse",c)
		if c==0 and p1 then
			ChangeLevel(-1)
		end
	end
	NewAudio.Play("Hits")
end

function ChangeLevel(ingo)
	local level=Player.lv
	local lv=level+ingo
	if lv>19 then
		lv=19
		elseif lv<1 then
		lv=1
	end
	if lv>level then
		--Audio.PlaySound("levelup")
		--NewAudio.Play("Hits")
		Audio.PlaySound("blip")
	end
	local MaxHP=16+(lv*4)
	Player.lv=lv
	Encounter.SetVar("MaxHP",MaxHP)
	Player.hp=MaxHP
end
	
function Lower()
	p1=false
	p2=p2-1
	if p2<0 then
		p2=0
	end
	p3=p3-1
	if p3<0 then
		p3=0
	end
	Encounter.SetVar("PlayerHasSpared",p1)
	Encounter.SetVar("PlayerWasHurted",p2)
	Encounter.SetVar("PlayerHasFlirted",p3)
end			
	