Arena.Resize(200, 128)
spawntimer = 0
k1 = {}
k2 = {}

require "Libraries/Playermove"
require "Libraries/hurt"

function Update() 

HurtUpd(600)
Moving()

	spawntimer = spawntimer + 1
	
	if spawntimer % 50 == 0 then 
		kD = CreateProjectile ('KnifeDown', 200, 32)
		kU = CreateProjectile ('KnifeUp', -200, -32)
		kD.sprite.alpha=0
		kU.sprite.alpha=0
		kD.SetVar("time",0)
		kU.SetVar("time",0)
		kD.SetVar("fadetime",0)
		kU.SetVar("fadetime",0)
		table.insert (k1, kD)
		table.insert (k2, kU)
	end 
	
	for i=1,#k1 do
    		local k = k1[i]
		if k.isactive then
	    		k.Move(-3,0)
			local time=k.GetVar("time")+1
			k.SetVar("time",time)
			if time<46 then
				k.sprite.alpha=math.sin(time*math.pi/90)
			end
			if k.x<-100 then
				local fade=k.GetVar("fadetime")+1
				k.SetVar("fadetime",fade)
				if fade<60 then
					k.sprite.alpha=math.cos(fade*math.pi/120)
					else
					k.Remove()
				end
			end
		end
		
		local x=k.x
		if x>50 then
			x=x-50
			elseif x<-50 then
			x=x+50
			else
			x=0
		end
		k.sprite.alpha=math.cos(x*math.pi/300)
		
	end
	
	for i=1,#k2 do
    		local k = k2[i]
		if k.isactive then
	    		k.Move(3,0)
			local time=k.GetVar("time")+1
			k.SetVar("time",time)
			if time<46 then
				k.sprite.alpha=math.sin(time*math.pi/90)
			end
			if k.x>100 then
				local fade=k.GetVar("fadetime")+1
				k.SetVar("fadetime",fade)
				if fade<60 then
					k.sprite.alpha=math.cos(fade*math.pi/120)
					else
					k.Remove()
				end
			end
		end
		
		local x=k.x
		if x>50 then
			x=x-50
			elseif x<-50 then
			x=x+50
			else
			x=0
		end
		k.sprite.alpha=math.cos(x*math.pi/300)
		
	end

end 

function OnHit(bullet)
	KnifeHurt(1)
end