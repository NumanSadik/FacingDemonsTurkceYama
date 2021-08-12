bodymax=0
headmax=0
lasttimer = 0
timestamp1 = 0
sleep=false
distance=5
distance2=9
hpbar=false
standnow=1
standnew=1
standtime=0
timestamp2=0
animtimer=0
timer2={}
deltx=0
trsx=0
trsy=0
lgsx=0
lgsy=0
hdx=0
hdy=0
local savesoulx=0
eyeswhite=false
eyesred=false
smile=false
sleepletters={}
local soulpos=0
trs_sp = currentspr.."/chara/Chara_body0_color"
lgs_sp = currentspr.."/chara/Chara_legs_color"
head_sp = currentspr.."/chara/Chara_head03_color"
eyes_sp="empty"
legspoint=0
determination = CreateSprite(lang.."/Battle/determination")
determination.x = 320
determination.y = 240
determination.alpha = 0
eyes=CreateSprite("empty")
charatorso = CreateSprite(trs_sp)
charalegs = CreateSprite(lgs_sp)
charahead = CreateSprite(head_sp)
blood=CreateSprite("empty")
mouthblood=CreateSprite("empty")
charasoul = CreateSprite(currentspr.."/chara/chara_soul1")
charasoul.alpha=0
charasoulleft=CreateSprite("empty")
charasoulleft.x=0
charasoulleft.y=0
charasoulright=CreateSprite("empty")
charasoulright.x=0
charasoulright.y=0
shadow=CreateSprite(currentspr.."/shadow","BelowArena",0,0)
shadow.SendToBottom()
evadelevel=1
endevade=false
local facing=115
mouthblood.Scale(2,2)
charalegs.Scale(2, 2)
charatorso.Scale(2, 2)
charahead.Scale(2,2)
blood.Scale(2,2)
eyes.Scale(2,2)

Changing=false
lastang={}
lastingspr={}
local timer=0
local loop=150+math.random(90)
legshift = 0
num=1

charatorso.SetParent(charalegs)
charahead.SetParent(charatorso)
blood.SetParent(charahead)
shadow.SetParent(charalegs)
eyes.SetParent(charahead)
mouthblood.SetParent(charahead)
mouthblood.x=0
mouthblood.y=0
shadow.MoveTo(0,-(charalegs.height/2*charalegs.yscale)+1)
function CheckPointSprite(ingo)
	if ingo=="1.1.7" then
		lgsy=267
		trsy=37
		hdy=71
		elseif ingo=="1.2" then
		trsy=55
		hdy=50
		lgsy=276
		elseif ingo=="1.1.6" then
		trsy=30
		hdy=50
		lgsy=260
	end
end
function SetFace(ingo,fac,eye,mouth)
	charahead.Set(currentspr..ingo..clmd)
	head_sp=currentspr..ingo
	eyes.Set("empty")
	if currentspr=="1.1.6" then
		facing=0
		else
		facing=fac
		eyesanim=eye
	end
	local hp=enemies[1].GetVar("hp")
	if hp<1199 then
		mouthblood.Set(currentspr.."/chara/mouths/"..mouth)
		else
		mouthblood.Set("empty")
	end
	SetGlobal("facial_expression", 999)
end
local ready={}
--[[lgsx = 345
lgsy = 267
hdy = 71 --The head's height is relative to the torso it's parented to.
hdx = -20
trsy = 37--The torso's height is relative to the legs they're parented to.
trsx = 1]]
--We set the torso's pivot point to halfway horizontally, and on the bottom vertically, 
--so we can rotate it around the bottom instead of the center.
--Faces
timerlast={}
for i=1,180 do
	local spr=CreateSprite("empty")
	spr.x=0
	spr.y=0
	ready[i]=false
	table.insert(lastingspr,spr)
	spr.Scale(2,2)
end

function inc()
	if num==178 then
		num=1
		else num=num+3
	end
end
function FaceCheck()
	local face = NextFace
	local newface=GetGlobal("facial_expression")
	if not GetGlobal("evasion") then
		elseif GetGlobal("evasion")%2==1 then
		timer=0
		loop=150+math.random(90)
	end
	if newface<0 then
		Changing=true
		NextFace=newface
	end
	if not face then
		elseif face<99 then
		eyes_sp="empty"
		eyes.Set("empty")
		timer=0
		loop=150+math.random(90)
	end
	if Changing==true then
		local NextGoes=false
		if facing==0 then
			NextGoes=true
		end
		if facing==100 then
			if timer<loop-16 then
				timer=loop-16
			end
			if timer>loop-10 then
				local go=timer-loop+10
				timer=loop-10-go
			end
			if timer==loop-10 then
				NextGoes=true
				timer=loop-6
			end
		end
		if facing==102 then
			if timer<loop-9 then
				timer=loop-9
			end
			if timer==loop-9 then
				elseif timer=loop-5
		if face==0 then
			SetFace("/chara/Chara_normal",0)
		elseif face == 1 then
			SetFace("/chara/Final_1",100,"white","none")
		elseif face == 2 then
			SetFace("/chara/Final_2",100,"whiteleft","right")
		elseif face == 3 then
			SetFace("/chara/Final_3",106,"white","right")
		elseif face == 4 then
			SetFace("/chara/Final_4",0,"","both")
		elseif face == 5 then
			SetFace("/chara/angry",102,"","right")
			timer=999
		elseif face == 6 then
			SetFace("/chara/Chara_head04",0,"","up")
		elseif face == 7 then
			SetFace("/chara/Chara_head",100,"redboth","right")	
		elseif face == 8 then
			SetFace("/chara/Final_0",100,"redright","up")
		elseif face == 9 then
			SetFace("/chara/Chara_smile",100,"redleft","both")
		elseif face == 10 then
			SetFace("/chara/battle",0,"","none")
		elseif face == 11 then
			SetFace("/chara/cry",0,"","left")
		elseif face == 12 then
			SetFace("/chara/angry",102,"","right")
			timer=999
		elseif face == 13 then
			SetFace("/chara/Chara_tired0",0,"","none")
		elseif face == 14 then
			SetFace("/chara/Chara_tired",100,"redboth","right")
		elseif face == 15 then
			SetFace("/chara/Chara_normal",100,"brownboth","right")
		elseif face == 16 then
			SetFace("/chara/Chara_normal_eyes",100,"brownbothright","right")
	        elseif face == 17 then
			SetFace("/chara/suprise1",100,"white","none")
	        elseif face == 18 then
			SetFace("/chara/angry",102,"","right")
			timer=999
	        elseif face == 19 then
			SetFace("/chara/Chara_head03",0,"","right")
	        elseif face == 20 then
			SetFace("/chara/suprise2",100,"whiteleft","right")
	        elseif face == 21 then
			SetFace("/chara/Chara_bad",100,"redboth","both")
	        elseif face == 22 then
			SetFace("/chara/Chara_head05",0,"","up")
	        elseif face == 23 then
			SetFace("/chara/Chara_danger",100,"darkboth","right")
	        elseif face == 24 then
			SetFace("/chara/Chara_head_final3",0,"","both")
	        elseif face == 25 then
			SetFace("/sleepy/sleepy0",105,"","right")
			sleep=0
			timer=0
			loop=150+math.random(90)
			SetGlobal("nosleeping",false)
        	elseif face == 26 then
			SetFace("/chara/Chara_head_final5",0,"","up")
        	elseif face == 27 then
			SetFace("/sleepy/sleepy0",100,"redboth","right")
			CheckPointSprite(currentspr)
        	elseif face == 28 then
			SetFace("/chara/Final_5",0,"","none")
        	elseif face == 29 then
			SetFace("/chara/wink",100,"redbigleft","both")
        	elseif face == 30 then
			SetFace("/charanohope/Chara_head",100,"redboth","right")
        	elseif face == 31 then
			SetFace("/charanohope/Chara_sad",0,"","none")
        	elseif face == 32 then
			SetFace("/charanohope/Chara_tears",0,"","none")
        	elseif face == 33 then
			SetFace("/charanohope/Chara_head_hurt",0,"","none")
        	elseif face == 34 then
			SetFace("/charanohope/Chara_angry",100,"redboth","none")
        	elseif face == 35 then
			SetFace("/chara/cry",0,"","left")
		elseif face == 36 then
			SetFace("/chara/Chara_mercy",100,"white","up")
		elseif face==37 then
			if currentspr=="1.1.6" then
				else
				eyeswhite=CreateProjectileAbs(currentspr.."/chara/eyeswhite",charahead.x+charatorso.x+charalegs.x,charahead.y+charatorso.y+charalegs.y)
				eyesred=CreateProjectileAbs(currentspr.."/chara/eyesred",charahead.x+charatorso.x+charalegs.x,charahead.y+charatorso.y+charalegs.y)
				eyeswhite.sprite.Scale(2,2)
				eyesred.sprite.Scale(2,2)
			end
			SetGlobal("facial_expression",999)
			SetFace("/chara/angry",104)
			animtimer=0
			timer=999
		elseif face == 38 then
			SetFace("/chara/Final_6",100,"white","right")
		elseif face == 39 then
			SetFace("/chara/Final_7",0,"","both")
		elseif face==40 then
			SetFace("/chara/thoughts",100,"redboth","right")
		elseif face==41 then
			SetFace("/chara/thoughtsright",100,"redboth","right")
		elseif face==42 then
			SetFace("/chara/thoughtsleft",100,"redboth","right")
		elseif face==43 then
			SetFace("/chara/look",100,"redboth","right")
		elseif face==44 then
			SetFace("/chara/lookleft",100,"redboth","right")
		elseif face==45 then
			SetFace("/chara/trigered",100,"triger","right")
		elseif face==46 then
			SetFace("/chara/trigered_closed",0,false,"right")
		elseif face==47 then
			SetFace("/chara/thinking",100,"redbothright","both")
		elseif face==48 then
			SetFace("/chara/remembering",100,"whitebothright","right")
		end
	local boool=false
	if facing==0 then
		elseif facing==102 then
		boool=true
		if timer%15==0 then
			if (timer/15)%4==0 then
				charahead.Set(currentspr.."/chara/angry1"..clmd)
				elseif (timer/15)%4==1 then
				charahead.Set(currentspr.."/chara/angry2"..clmd)
				elseif (timer/15)%4==2 then
				charahead.Set(currentspr.."/chara/angry1"..clmd)
				elseif (timer/15)%4==3 then
				charahead.Set(head_sp..clmd)
			end
		end
		elseif facing==104 then
		boool=true
		eyeswhite.MoveToAbs(charahead.x+charatorso.x+charalegs.x,charahead.y+charatorso.y+charalegs.y)
		eyeswhite.sprite.SendToTop()
		eyesred.sprite.SendToTop()
		eyesred.MoveToAbs(charahead.x+charatorso.x+charalegs.x,charahead.y+charatorso.y+charalegs.y)
		animtimer=animtimer+1
		if animtimer<61 then
			local blacky=0
			if animtimer<31 then
				blacky=math.cos(animtimer*math.pi/120)
				else
				blacky=1-math.sin(animtimer*math.pi/120)
			end
			eyeswhite.sprite.color={blacky,blacky,blacky}
			elseif animtimer==61 then
			eyeswhite.sprite.Set(currentspr.."/chara/eyesblack")
			eyeswhite.sprite.color={0,0,0}
			eyeswhite.sprite.Scale(2,2)
			elseif animtimer>60 and animtimer<106 then
			if animtimer>60 and animtimer<91 then
				local blacky=math.sin((animtimer-60)*math.pi/60)
				eyeswhite.sprite.color={blacky,blacky,blacky}
			end
			if animtimer>75 and animtimer<106 then
				local blacky=1-math.sin((animtimer-75)*math.pi/60)
				eyesred.sprite.color={blacky,blacky,blacky}
			end
			elseif animtimer==106 then
			animtimer=0
			eyesred.Remove()
			eyeswhite.Remove()
			SetGlobal("facial_expression", 12)
			eyeswhite=false
			eyesred=false
		end
		elseif facing==105 then
		if sleep==-1 then
			charahead.Set(currentspr.."/sleepy/sleepy0"..clmd)
			head_sp=currentspr.."/sleepy/sleepy0"
			timer=0
			standtime=0
			trsy = 37
			hdy = 71
			sleep=0
		end
		if sleep==true then
			elseif sleep<5 then
			if timer==loop-41 then
				if sleep==0 then
					charahead.Set(currentspr.."/sleepy/sleepy0"..clmd)
				end
				elseif timer==loop-36 then
				if sleep<2 then
					charahead.Set(currentspr.."/sleepy/sleepy1"..clmd)
				end
				elseif timer==loop-31 then
				if sleep<3 then
					charahead.Set(currentspr.."/sleepy/sleepy2"..clmd)
				end
				elseif timer==loop-26 then
				if sleep<4 then
					charahead.Set(currentspr.."/sleepy/sleepy3"..clmd)
				end
				elseif timer==loop-21 then
				charahead.Set(currentspr.."/sleepy/end"..clmd)
				if Player.absy==25 then
					sleep=sleep+1
				end
				if sleep==4 then
					timer=0
					head_sp=currentspr.."/sleepy/end"
					elseif sleep==3 then
					head_sp=currentspr.."/sleepy/sleepy3"
					elseif sleep==2 then
					head_sp=currentspr.."/sleepy/sleepy2"
					elseif sleep==1 then
					head_sp=currentspr.."/sleepy/sleepy1"
					elseif sleep==0 then
					head_sp=currentspr.."/sleepy/sleepy0"
				end
				elseif timer==loop-16 then
				if sleep<4 then
					charahead.Set(currentspr.."/sleepy/sleepy3"..clmd)
				end
				elseif timer==loop-11 then
				if sleep<3 then
					charahead.Set(currentspr.."/sleepy/sleepy2"..clmd)
				end
				elseif timer==loop-6 then
				if sleep<2 then
					charahead.Set(currentspr.."/sleepy/sleepy1"..clmd)
				end
				elseif timer==loop-1 then
				if sleep==0 then
					charahead.Set(currentspr.."/sleepy/sleepy0"..clmd)
				end
			end
			else 
			if timer<3 then
				charahead.Set(currentspr.."/sleepy/almostend"..clmd)
				head_sp=currentspr.."/sleepy/almostend"
				elseif timer==105 then
				charahead.Set(currentspr.."/sleepy/end"..clmd)
				head_sp=currentspr.."/sleepy/end"
				sleep=true	
				timer=0
				loop=20000
				facing=11
			end
		end	
		elseif facing==106 then
		if timer==loop-9 then
			eyes_sp=currentspr.."/chara/eyes/"..eyesanim.."2"
			eyes.Set(eyes_sp..clmd)
			elseif timer==loop-1 then
			eyes_sp="empty"
			eyes.Set("empty")
		end
		else
		if timer==loop-16 then
			eyes_sp=currentspr.."/chara/eyes/"..eyesanim.."1"
			eyes.Set(eyes_sp..clmd)
			elseif timer==loop-11 then
			eyes_sp=currentspr.."/chara/eyes/"..eyesanim.."2"
			eyes.Set(eyes_sp..clmd)
			elseif timer==loop-6 then
			eyes_sp=currentspr.."/chara/eyes/"..eyesanim.."1"
			eyes.Set(eyes_sp..clmd)
			elseif timer==loop-1 then
			eyes_sp="empty"
			eyes.Set("empty")
		end
	end
	if facing>0 then
		timer=timer+1
	end
	if timer>loop-1 and boool==false then
		timer=0
		loop=150+math.random(90)
	end
		
	
end

function KnifeOut()
	charatorso.Set(currentspr.."/chara/Chara_body"..clmd)
	trs_sp = currentspr.."/chara/Chara_body"
	trsx = trsx
	hdx = hdx
	SetGlobal("knifeinhand", false)
end

function EvadeSpeed(input)
	local output=0
	if input==1 or input==2 then
		output=4
		elseif input==3 then
		output=3.5
		elseif input==4 then
		output=3.25
		elseif input==5 then
		output=3
	end
	return output
end

function EndedEvade()	
	charatorso.Set(currentspr.."/chara/Chara_body"..clmd)
	trs_sp = currentspr.."/chara/Chara_body"
	endevade=0
end

function LeaveShadow()
	local alpha=0
	if evadelevel==1 then
		alpha=0.75
		elseif evadelevel==2 then
		alpha=0.6
		elseif evadelevel==3 then
		alpha=0.4
	end
	local last1 = lastingspr[num]
	last1.Set(head_sp..clmd)
	ready[num]=true
	last1.y=hdy+trsy+lgsy
	last1.x=hdx+trsx+lgsx
	local last2=lastingspr[num+1]
	last2.Set(trs_sp..clmd)
	last2.y=trsy+lgsy
	last2.x=trsx+lgsx
	ready[num+1]=true
	local last3=lastingspr[num+2]
	last3.Set(lgs_sp..clmd)
	last3.y=lgsy
	last3.x=lgsx
	ready[num+2]=true
	last3.SendToTop()
	last2.SendToTop()
	last1.SendToTop()
	charalegs.SendToTop()
	charatorso.SendToTop()
	charahead.SendToTop()
	blood.SendToTop()
	last1.alpha=alpha
	last2.alpha=alpha
	last3.alpha=alpha
	inc()
end



function WasHitted(ammount)
	distance=distance+ammount/2
	distance2=distance2+ammount
end
function AnimateChara()
standtime=standtime+1
for i=1,#lastingspr do
	local last=lastingspr[i]
	if ready[i]==true then
		last.alpha=last.alpha-0.05
		if last.alpha==0 then
			ready[i]=false
		end
	end
end
	if sleep==true then
		if timer%180==0 or timer%180==30 or timer%180==60 then
			local zz=CreateSprite("sleepy/zzz")
			table.insert(sleepletters,zz)
			zz.x=360
			zz.y=400
		end
	end
	for i=1,#sleepletters do
		local zzz=sleepletters[i]
		if not timer2[i] then
			timer2[i]=0
			elseif timer2[i]<300 then
			timer2[i]=timer2[i]+1
		end
		zzz.Scale(1.75+0.75*math.sin((timer2[i])*math.pi/60),1.75+0.75*math.sin((timer2[i])*math.pi/60))
		if timer2[i]%120<60 then
			zzz.x=zzz.x+1*math.sin(timer2[i]*math.pi/60)
			zzz.y=zzz.y+0.5*math.sin(timer2[i]*math.pi/60)
			else 
			zzz.x=zzz.x-0.5*math.sin(timer2[i]*math.pi/60)
			zzz.y=zzz.y-0.5*math.sin(timer2[i]*math.pi/60)
		end
	end
	if distance2>0 then
		timestamp2=timestamp2+1
		deltx=distance*math.sin(timestamp2*math.pi/6)
		if timestamp2%6==0 then
			if distance>0 then
				distance=distance-0.5
				else
				distance=0
			end
			distance2=distance2-0.5
		end
		if distance2<0 then
			SetGlobal("hitted",false)
			timestamp2=0	
			distance=5
			deltx=0
			distance2=9
		end
	end
	lasttimer = lasttimer+1
	if not GetGlobal("charaisdead") then
		elseif GetGlobal("charaisdead")>1 and not GetGlobal("dying") then
		charasoul.y=trsy+lgsy+21
		charasoul.x=trsx+lgsx-1
	end
	--[[if sleep==false then
		trsy = trsy+0.08*math.sin(5*standtime + 2)
		hdy = hdy+0.07*math.sin(5*standtime + 2)
		elseif sleep==true then
		trsy = trsy+0.02*math.sin((5*standtime + 2)*math.pi/12)
		hdy = hdy+0.01*math.sin((5*standtime + 2)*math.pi/12)
		else
		trsy = trsy+(0.08-sleep*0.01)*math.sin(5*standtime + 2)
		hdy = hdy+(0.07-sleep*0.01)*math.sin(5*standtime + 2)
	end]]
	if standnow==1 then
		if standtime<46 then
			trsy=bodymax-0.75*math.cos(standtime*math.pi/45)
			hdy=headmax-0.75*math.cos(standtime*math.pi/45)
			elseif standtime>74 and standtime<121 then
			trsy=bodymax-0.75*math.cos((standtime-30)*math.pi/45)
			hdy=headmax-0.75*math.cos((standtime-30)*math.pi/45)
		end
		if standtime==150 then
			standtime=0
			standnow=standnew
		end	
		elseif standnow==2 then
		trsy=bodymax-1*math.cos(standtime*math.pi/45)
		hdy=headmax-1*math.cos(standtime*math.pi/45)
		if standtime==90 then
			standtime=0
			standnow=standnew
		end	
		elseif standnow==3 then
		if standtime<31 then
			trsy=bodymax-1.5*math.cos(standtime*math.pi/30)
			hdy=headmax-1.5*math.cos(standtime*math.pi/30)
			elseif standtime<36 then
			elseif standtime<66 then
			trsy=bodymax-1.5*math.cos((standtime-5)*math.pi/30)
			hdy=headmax-1.5*math.cos((standtime-5)*math.pi/30)
		end
		if standtime==75 then
			standtime=0
			standnow=standnew
		end	
		elseif standnow==4 then	
		if standtime<46 then
			trsy=bodymax-1.5*math.cos(standtime*math.pi/45)
			hdy=headmax-1.5*math.cos(standtime*math.pi/45)
			elseif standtime<61 then
			elseif standtime<92 then
			trsy=bodymax+1.5-3*math.sin((standtime-60)*math.pi/60)
			hdy=headmax+1.5-3*math.sin((standtime-60)*math.pi/60)
		end
		if standtime==120 then
			standtime=0
			standnow=standnew
		end
		elseif standnow==5 then
		if standtime<61 then
			trsy=bodymax-1.5*math.cos(standtime*math.pi/60)
			hdy=headmax-1.5*math.cos(standtime*math.pi/60)
			elseif standtime<91 then
			elseif standtime<122 then
			trsy=bodymax-1.5*math.cos((standtime-60)*math.pi/30)
			hdy=headmax-1.5*math.cos((standtime-60)*math.pi/30)
		end
		if standtime==120 then
			standtime=0
			standnow=standnew
		end
	end
	FaceCheck()
	local eva = GetGlobal("evasion")
	if eva == 1 then
		eyes_sp="empty"
		eyes.Set("empty")
		if endevade==false then
			if trs_sp ~= "chara/Chara_body_d"  then
				charatorso.Set(currentspr.."/chara/Chara_body_d"..clmd)
				trs_sp = currentspr.."/chara/Chara_body_d"
			end
           		if  head_sp  ==(currentspr.."/chara/Chara_head") and evadelevel==1 then
           		     	charahead.Set(currentspr.."/chara/Chara_smile"..clmd)
           	    		head_sp=currentspr.."/chara/Chara_smile"
                		SetGlobal("FaceChange",1)
                	end
			legshift = legshift+0.075
			if evadelevel<4 then
				LeaveShadow()
			end
			if legshift< 0.94*math.pi then
				lgsx=lgsx-EvadeSpeed(evadelevel)*math.sin(legshift/2+0.5*math.pi)
				else 
				lgsx=lgsx-EvadeSpeed(evadelevel)*0.15
			end
			if charalegs.x<maxleft then--246
				endevade=true
				legshift=0
				EndedEvade()
			end
			charahead.Set(head_sp..clmd)
			else
			legshift=legshift+1
			if legshift==20 then
				EndedEvade()
				elseif legshift==60 then
				legshift=0
				if not GetGlobal("FaceChange") then
					elseif GetGlobal("FaceChange")==1 then
	           		     	charahead.Set(currentspr.."/chara/Chara_head"..clmd)
        	   	    		head_sp=currentspr.."/chara/Chara_head"
					SetGlobal("FaceChange",0)
				end
				SetGlobal("evasion",2)
				endevade=false
			end
		end
                elseif eva==3 then
		eyes_sp="empty"
		eyes.Set("empty")
		if endevade==false then
			if trs_sp ~= "chara/Chara_body_d"  then
				charatorso.Set(currentspr.."/chara/Chara_body_d"..clmd)
				trs_sp = currentspr.."/chara/Chara_body_d"
			end
           		if  head_sp  ==(currentspr.."/chara/Chara_head") and evadelevel==1 then
           		     	charahead.Set(currentspr.."/chara/Chara_smile"..clmd)
           	    		head_sp=currentspr.."/chara/Chara_smile"
                		SetGlobal("FaceChange",1)
                	end
			if evadelevel<4 then
				LeaveShadow()
			end
			legshift = legshift+0.075
			if legshift< 0.94*math.pi then
				lgsx=lgsx+EvadeSpeed(evadelevel)*math.sin(legshift/2+0.5*math.pi)
				else 
				lgsx=lgsx+EvadeSpeed(evadelevel)*0.15
			end
			if charalegs.x>maxright then--344
				endevade=true
				legshift=0
				EndedEvade()
			end
			charahead.Set(head_sp..clmd)
			else
			legshift=legshift+1
			if legshift==20 then
				EndedEvade()
				elseif legshift==60 then
				legshift=0
				if not GetGlobal("FaceChange") then
					elseif GetGlobal("FaceChange")==1 then
	           		     	charahead.Set(currentspr.."/chara/Chara_head"..clmd)
        	   	    		head_sp=currentspr.."/chara/Chara_head"
					SetGlobal("FaceChange",0)
				end
				SetGlobal("evasion",0)
				endevade=false
			end
		end
	end
	local hurt = GetGlobal("hurtanim") 
		if hurt == 1 then 		
			legshift = legshift+0.628 
		if legshift > 4*math.pi then 
			legshift = 0 
	SetGlobal("hurtanim", 0) 
	end 
lgsx = lgsx + 0.7*math.floor(math.sin(legshift)+0.5) 
end
	local knife = GetGlobal("knifeinhand")
	if knife == true then
		KnifeOut()
	end
	if GetGlobal("charaisdead") == 1 and timestamp1 == 0 then
		charalegs.alpha = 0.3
		timer=loop-1
		charatorso.alpha = 0.3
		charahead.alpha = 0.3
		blood.alpha=0.3
		eyes.alpha=charalegs.alpha
		SetMusic("none")
		charasoul.alpha=1
		timestamp1 = lasttimer
		SetGlobal("charaisdead", 2)
	end
	if (lasttimer-timestamp1) == 55 and GetGlobal("charaisdead") == 2 then
		Audio.PlaySound("heartbeatbreaker")
	end
	if (lasttimer-timestamp1) == 60 and GetGlobal("charaisdead") == 2 then
		charalegs.alpha = 0.2
		charatorso.alpha = 0.2
		charahead.alpha = 0.2
		blood.alpha=0.2
		eyes.alpha=charalegs.alpha
		charasoul.Set(currentspr.."/chara/chara_soul2")
		SetGlobal("charaisdead", 3)
		savesoulx=charasoul.x
	end
	if (lasttimer-timestamp1) >60 and (lasttimer-timestamp1) < 121 then
		timer=0
		charasoul.x=savesoulx+2*math.cos((lasttimer-timestamp1-60)/10)
	end
	if (lasttimer-timestamp1) == 120 and GetGlobal("charaisdead") == 3 then
		charalegs.alpha = 0.1
		charatorso.alpha = 0.1
		charahead.alpha = 0.1
		blood.alpha=0.1
		eyes.alpha=charalegs.alpha
		Audio.PlaySound("heartsplosion")
		--charasoul.Set("chara/charasoul3")
		charasoulleft.Set(currentspr.."/chara/chara_soulleft")
		charasoulright.Set(currentspr.."/chara/chara_soulright")
		charasoulleft.x=charasoul.x
		charasoulleft.y=charasoul.y
		charasoulright.x=charasoul.x
		charasoulright.y=charasoul.y
		charasoul.Set("empty")
		SetGlobal("charaisdead", 3)
	end
	if (lasttimer-timestamp1) >120 and (lasttimer-timestamp1) < 180 then
		charasoulleft.x=charasoulleft.x-0.15
		charasoulright.x=charasoulright.x+0.15
		charasoulleft.alpha=math.sin((lasttimer-timestamp1)*math.pi/240)
		charasoulright.alpha=charasoulleft.alpha
	end
	if (lasttimer-timestamp1) == 180 and GetGlobal("charaisdead") == 3 then
		charalegs.alpha = 0.2
		charatorso.alpha = 0.2
		charahead.alpha = 0.2
		blood.alpha=0.2
		eyes.alpha=charalegs.alpha
		Audio.PlaySound("appear")
		charahead.StopAnimation()
		charasoulleft.Set("empty")
		charasoulright.Set("empty")
		charasoul.Set(currentspr.."/chara/chara_soul2")
		SetGlobal("facial_expression",12)
		determination.alpha = 1
		SetGlobal("charaisdead", 4)
		--Encounter.SetVar("nextwaves", {"laststand"})
		--Encounter.SetVar("arenasize", {155, 130})
		smile=CreateProjectileAbs(currentspr.."/chara/smiley",charalegs.x+charatorso.x+charahead.x,charalegs.y+charatorso.y+charahead.y-12,"BelowArena")
		smile2=CreateProjectileAbs(currentspr.."/chara/smiley",charalegs.x+charatorso.x+charahead.x,charalegs.y+charatorso.y+charahead.y-12,"BelowArena")
		smile.SendToBottom()
		smile.sprite.Scale(2,2)
		smile2.SendToBottom()
		smile2.sprite.Scale(2,2)
	end
	if (lasttimer-timestamp1) > 180 and (lasttimer-timestamp1) < 241 and GetGlobal("charaisdead") == 4 then
		smile2.sprite.Scale(2+6*math.sin((lasttimer-timestamp1-180)*math.pi/120),2+6*math.sin((lasttimer-timestamp1-180)*math.pi/120))
		smile2.sprite.alpha=1-math.sin((lasttimer-timestamp1-180)*math.pi/120)
	end
	if (lasttimer-timestamp1) > 180 and (lasttimer-timestamp1) < 301 and GetGlobal("charaisdead") == 4 then
		determination.x = determination.x-0.2
		determination.alpha = determination.alpha-0.01
		smile.MoveToAbs(charalegs.x+charatorso.x+charahead.x,charalegs.y+charatorso.y+charahead.y)
		charalegs.alpha = 0.2+0.8*(1-math.cos((lasttimer-timestamp1-180)*math.pi/240))
		charatorso.alpha = charalegs.alpha
		charahead.alpha = charalegs.alpha
		blood.alpha=charalegs.alpha
		eyes.alpha=charalegs.alpha
	end

	if (lasttimer-timestamp1) == 300 and GetGlobal("charaisdead") == 4 then
		SetGlobal("cursed",0)
		charalegs.alpha = 1
		charatorso.alpha = 1
		charahead.alpha = 1
		blood.alpha=1
		eyes.alpha=charalegs.alpha
		smile.Remove()
		smile2.Remove()
		smile=false
		smile2=false
		determination.alpha = 0
		determination.x=320
		--NewAudio.Play(songs[2])
		--NewAudio.SetPitch(songs[2],1.2)
		State("DEFENDING")
		Audio.PlaySound("final_attack")
		SetGlobal("charaisdead", 5)
	end
	if knifestage==5 then
		charatorso.Set(currentspr.."/chara/twowounds"..clmd)
		trs_sp=currentspr.."/chara/twowounds"
		knifestage=6
	end
	if not GetGlobal("dying") then
		
		charasoul.y=trsy+lgsy+21
		charasoul.x=trsx+lgsx-1
		
		elseif GetGlobal("dying")==true then
		if not timer5 then
			timer5=1
			tremb=0.1
			charasoul.alpha = 1
			charasoul.SendToTop()
			torsoup=charatorso.y
			headup=charahead.y
			elseif timer5<180 then
			timer5=timer5+1
		end
		if timer5==20 then
			Audio.PlaySound("heartbeatbreaker")
			charasoul.Set(currentspr.."/chara/chara_soul2")
		end
		if timer5<80 then
			hdx = -20+tremb*math.sin(timer5*math.pi/4)
			trsx = 1+2*tremb*math.sin(timer5*math.pi/4)
			lgsx=345+2*tremb*math.sin(timer5*math.pi/4)
			hdy=headup
			trsy=torsoup
			if timer5%16==0 then
				tremb=tremb+0.1
			end
			elseif timer5<105 then 
			trsy = torsoup*(140-timer5)/65
			hdy = headup*(140-timer5)/65
		end
		if wons==0 and timer5<106 then
			NewAudio.SetVolume("finale",0.5*math.sin((105-timer5)*math.pi/210))
		end
		if timer5==103 then
			Audio.PlaySound("fall")
		end
		if timer5==106 then
			lgsx =-200
			charadead=CreateSprite(currentspr.."/chara/dead"..clmd)
			chrdd=currentspr.."/chara/dead"
			deadbody=true
			charadead.Scale(2,2)
			charadead.x=330
			charadead.y=372
		end
		if timer5==107 then
			charadead.SendToTop()
		end
		if timer5==108 then
			Audio.PlaySound("heartsplosion")
			charasoul.Set(currentspr.."/chara/chara_soul3")
		end
		if timer5==109 then
			charasoul.alpha=0
			charasoulleft.Set(currentspr.."/chara/chara_soulleft")
			charasoulright.Set(currentspr.."/chara/chara_soulright")
			charasoulleft.SendToTop()
			charasoulright.SendToTop()
			charasoulleft.x=charasoul.x
			charasoulleft.y=charasoul.y
			charasoulright.x=charasoul.x
			charasoulright.y=charasoul.y
		end
		if timer5>109 and timer5<179 then
			charasoulleft.x=charasoulleft.x-0.25
			charasoulright.x=charasoulright.x+0.25
			charasoulleft.alpha=1-(timer5-109)/60
			charasoulright.alpha=1-(timer5-109)/60
		end
		if timer5==179 then
			charasoulleft.Set("empty")
			charasoulright.Set("empty")
			SetGlobal("dying",false)
			timer5=false
		end
	end
charalegs.x=math.floor(lgsx*500)/500+deltx
charalegs.y=math.floor(lgsy*500)/500
charatorso.x=math.floor(trsx*500)/500
charatorso.y=math.floor(trsy*500)/500
charahead.x=math.floor(hdx*500)/500
charahead.y=math.floor(hdy*500)/500
if eyeswhite==false and eyesred==false then
		else
		eyeswhite.MoveToAbs(charahead.x+charatorso.x+charalegs.x,charahead.y+charatorso.y+charalegs.y)
		eyesred.MoveToAbs(charahead.x+charatorso.x+charalegs.x,charahead.y+charatorso.y+charalegs.y)
end
if smile==false then
	else smile.MoveToAbs(charahead.x+charatorso.x+charalegs.x,charahead.y+charatorso.y+charalegs.y-13)
	smile2.MoveToAbs(charahead.x+charatorso.x+charalegs.x,charahead.y+charatorso.y+charalegs.y-13)
end
end

function CharaDisappear() 
end

function Wounded(health,firsthealth)
	if health==1201 then
		enemies[1].GetVar("bloodmouth",false)
		charatorso.Set(currentspr.."/chara/Chara_body0"..clmd)
		trs_sp = currentspr.."/chara/Chara_body0"
		charalegs.Set(currentspr.."/chara/Chara_legs"..clmd)
		lgs_sp=currentspr.."/chara/Chara_legs"
	end
	if health < 1199 and health > 1100 then
		charatorso.Set(currentspr.."/chara/wound"..clmd)
		trs_sp = currentspr.."/chara/wound"
	elseif health < 1100 and health > 800 then
		charatorso.Set(currentspr.."/chara/wound1"..clmd)
		trs_sp = currentspr.."/chara/wound1"
	elseif health < 800 and health > 500 then
		charatorso.Set(currentspr.."/chara/wound2"..clmd)
		trs_sp = currentspr.."/chara/wound2"
	elseif health < 500 and health > 200 then
		charatorso.Set(currentspr.."/chara/wound3"..clmd)
		trs_sp = currentspr.."/chara/wound3"
	elseif health < 200 then
		charatorso.Set(currentspr.."/chara/wound4"..clmd)
		trs_sp = currentspr.."/chara/wound4"
	end
	if health < 1199 then
		enemies[1].GetVar("bloodmouth",true)
		if currentspr=="1.1.6" then
			else
			charalegs.Set(currentspr.."/chara/Chara_legs_knife"..clmd)
			lgs_sp=currentspr.."/chara/Chara_legs_knife"
		end
	end
			
end


function ColorSwitch()
	if clmd == "" then clmd = "_color" colored=true else clmd = "" colored=false end
		if deadbody==true then
			charadead.Set(chrdd..clmd)
			else
			charatorso.Set(trs_sp..clmd)
			charalegs.Set(lgs_sp..clmd)
			charahead.Set(head_sp..clmd)
			if eyes_sp=="empty" then
				else eyes.Set(eyes_sp..clmd)
			end
		end
end