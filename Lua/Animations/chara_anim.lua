bodymax=0
local link=false
SystemHurted=false
headmax=0
SoulShowsUp=0
lasttimer = 0
timestamp1 = 0
sleep=false
distance=5
distance2=9
hpbar=false
standnow=1
standnew=1
soulpos={6,10}
standtime=0
timestamp2=0
animtimer=0
timer2={}
TimeToMove=0
deltx=0
trsx=0
trsy=0
lgsx=0
lgsy=0
hdx=0
hdy=0
bodyx=10
headx=-5
hdxdelta=0
hdydelta=0
coughtime=0
cough=0
local savesoulx=0
eyeswhite=false
eyesred=false
smile=false
sleepletters={}
trs_sp = currentspr.."/chara/Chara_body0"
lgs_sp = currentspr.."/chara/Chara_legs"
head_sp = currentspr.."/chara/Chara_head03"
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
blood=CreateSprite("empty","BelowPlayer")
blood.SendToTop()
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
facing=0
mouthblood.Scale(2,2)
charalegs.Scale(2, 2)
charatorso.Scale(2, 2)
charahead.Scale(2,2)
blood.Scale(2,2)
eyes.Scale(2,2)

NextFace=7

eyesanimbad=""
TimeOfEvade=0
Changing=false
lastang={}
lastingspr={}
HeadAbove=false
local timer=0
local loop=150+math.random(90)
legshift = 0
num=1
local timer1=0
timer2=0
sleepletterstimer=0

charatorso.SetParent(charalegs)
charahead.SetParent(charatorso)
blood.SetParent(charahead)
shadow.SetParent(charalegs)
eyes.SetParent(charahead)
mouthblood.SetParent(charahead)
mouthblood.x=0
mouthblood.y=0
shadow.MoveTo(0,-(charalegs.height/2*charalegs.yscale)+1)


function GetsAngry()
	SetFace("/chara/angry",104,"angry","angry",true)
	if currentspr=="1.1.6" then
		SetFace("/chara/angry",102,"","right")
		else
		HeadAbove=CreateProjectileAbs("empty",0,0,"Top")
		HeadAbove.sprite.Scale(2,2)
		eyeswhite=CreateProjectileAbs(currentspr.."/chara/eyeswhite",0,0,"Top")
		eyesred=CreateProjectileAbs(currentspr.."/chara/eyesred",0,0,"Top")
		eyeswhite.sprite.Scale(2,2)
		eyesred.sprite.Scale(2,2)
	end
	SetGlobal("facial_expression",999)
	animtimer=0
end

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
function SetFace(ingo,fac,eye,mouth,moment)
	local tim=false
	if not moment then
		tim=false
		else
		tim=true
	end
	charahead.Set(currentspr..ingo..clmd)
	head_sp=currentspr..ingo
	eyes.Set("empty")
	eyes.alpha=1
	if currentspr=="1.1.6" then
		facing=0
		else
		facing=fac
		eyesanim=eye
		loop=150+math.random(90)
		timer2=0
		if fac==100 or fac==110 then
			timer=0
			timer1=0
			elseif fac==102 then
			timer=0
			eyesanimbad=eye
			timer1=0
			elseif fac==106 then
			timer=loop-1
			else
			timer=0
		end
	end
	local hp=enemies[1].GetVar("hp")
	if hp<1499 then
		mouthblood.Set(currentspr.."/chara/mouths/"..mouth)
		else
		mouthblood.Set("empty")
	end
	SetGlobal("facial_expression", 999)
end


SetFace("/chara/Chara_head",100,"redboth","right")	
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
	local newface=GetGlobal("facial_expression")
	if not newface then
		newface=999
	end
	if not GetGlobal("evasion") then
		elseif GetGlobal("evasion")%2==1 then
		timer=0
		loop=150+math.random(90)
	end
	if newface<999 then
		Changing=true
		NextFace=newface
	end
	local face = NextFace
	if Changing==true then
		local NextGoes=false
		if facing==0 or face==51 then
			NextGoes=true
		end
		eyes.alpha=1
		if facing==100 then
			timer2=timer2+1
			local t=timer2
			if t==1 then
				if timer<loop-16 then
					elseif timer<loop-11 then
					t=5
					elseif timer<6 then
					t=7
					else
					t=5
				end
				timer=loop-60
			end
			if t==1 then
				eyes_sp=currentspr.."/chara/eyes/"..eyesanim.."1"
				eyes.Set(eyes_sp..clmd)
				elseif t==5 then
				eyes_sp=currentspr.."/chara/eyes/"..eyesanim.."2"
				eyes.Set(eyes_sp..clmd)
				elseif t==7 then
				eyes.Set("empty")
				NextGoes=true
				timer2=0
			end
		end
		if facing==110 then
			timer2=timer2+1
			local t=timer2
			if t==1 then
				if timer<loop-16 then
					elseif timer<loop-11 then
					t=5
					elseif timer<6 then
					t=7
					else
					t=5
				end
				timer=loop-60
			end
			if t<8 then
				eyes_sp=head_sp.."_close1"
				eyes.Set(eyes_sp..clmd)
				elseif t<16 then
				eyes_sp=head_sp.."_close2"
				eyes.Set(eyes_sp..clmd)
				else
				eyes.Set("empty")
				NextGoes=true
				timer2=0
			end
		end
		if facing==102 then
			timer2=timer2+1
			local t=timer2
			if t==1 then
				timer=loop-9
			end
			eyes.alpha=1
			if t==1 then
				eyes_sp=currentspr.."/chara/Redy to kill/eyes/"..eyesanim.."0"
				eyes.Set(eyes_sp..clmd)
				elseif t==5 then
				eyes_sp=currentspr.."/chara/Redy to kill/eyes/"..eyesanim.."1"
				eyes.Set(eyes_sp..clmd)
				elseif t==7 then
				eyes.Set("empty")
				NextGoes=true
				charatorso.x=1000
				timer2=0
			end
		end
		if facing==106 then
			if timer<loop-9 then
				timer=loop-9
			end
			if timer==loop-1 then
				timer=loop-5
			end
			if timer>loop-6 then
				NextGoes=true
			end
		end
		if NextGoes==true then
		if face!=65 then
			lastface=face
		end
		if face==0 then
			SetFace("/chara/Chara_normal",100,"brownboth","usual")
		elseif face == 1 then
			SetFace("/chara/Final_1",100,"white","usual")
		elseif face == 2 then
			SetFace("/chara/Final_2",100,"whiteleft","usual")
		elseif face == 3 then
			SetFace("/chara/Final_3",100,"whitequick","usual")
		elseif face == 4 then
			SetFace("/chara/Final_4",0,"","hmpf")
		elseif face == 5 then	
			if currentspr=="1.2" then
				SetFace("/chara/angry",102,"angry","angry")
				else
				SetFace("/chara/angry",102,"angry","right")
			end
		elseif face == 6 then
			SetFace("/chara/Chara_head04",0,"","hmpf")
		elseif face == 7 then
			SetFace("/chara/Chara_head",100,"redboth","usual")	
		elseif face == 8 then
			SetFace("/chara/Final_0",100,"redright","usual")
		elseif face == 9 then
			SetFace("/chara/Chara_smile",100,"redleft","usual")
		elseif face == 10 then
			SetFace("/chara/battle",0,"","hmpf")
		elseif face == 11 then
			SetFace("/chara/cry",0,"","cry")
		elseif face == 12 then
			SetFace("/chara/angry",102,"angry","angry")
			timer=999
		elseif face == 13 then
			SetFace("/chara/Chara_tired0",0,"","cry")
		elseif face == 14 then
			if currentspr=="1.2" then
				SetFace("/chara/Chara_tired",100,"tired","usual")
				else
				SetFace("/chara/Chara_tired",100,"redboth","right")
			end
		elseif face == 15 then
			SetFace("/chara/Chara_normal",100,"brownboth","usual")
		elseif face == 16 then
			SetFace("/chara/Chara_normal_eyes",100,"brownbothright","usual")
	        elseif face == 17 then
			if currentspr=="1.2" then
				SetFace("/chara/suprise1",100,"redboth","usual")
				else
				SetFace("/chara/suprise1",100,"white","none")
			end
	        elseif face == 18 then
			SetFace("/chara/angry",102,"angry","angry")
			timer=999
	        elseif face == 19 then
			SetFace("/chara/Chara_head03",0,"","wideusual")
	        elseif face == 20 then
			SetFace("/chara/suprise2",100,"whiteleft","usual")
	        elseif face == 21 then
			if currentspr=="1.2" then 
				SetFace("/chara/Chara_bad",100,"verybad","usual")
				else
				SetFace("/chara/Chara_bad",100,"redboth","both")
			end
	        elseif face == 22 then
			SetFace("/chara/Chara_head05",0,"","hmpf")
	        elseif face == 23 then
			SetFace("/chara/Chara_danger",100,"darkboth","unusual")
	        elseif face == 24 then
			SetFace("/chara/Chara_head_final3",100,"smile","usual")
	        elseif face == 25 then
			SetFace("/sleepy/sleepy0",105,"","usual")
			sleep=0
			timer=0
			SetGlobal("nosleeping",false)
        	elseif face == 26 then
			SetFace("/chara/Chara_head_final5",0,"","sad")
        	elseif face == 27 then
			SetFace("/chara/cry",0,"","cry")
        	elseif face == 28 then
			SetFace("/chara/Final_5",0,"","usual")
        	elseif face == 29 then
			SetFace("/chara/wink",100,"redbigleft","usual")
        	elseif face == 30 then
			SetFace("/chara/cry",0,"","cry")
        	elseif face == 31 then
			SetFace("/chara/cry",0,"","cry")
        	elseif face == 32 then
			SetFace("/chara/cry",0,"","cry")
        	elseif face == 33 then
			SetFace("/chara/cry",0,"","cry")
        	elseif face == 34 then
			SetFace("/chara/cry",0,"","cry")
        	elseif face == 35 then
			SetFace("/chara/cry",0,"","cry")
		elseif face == 36 then
			SetFace("/chara/Chara_mercy",100,"white","usual")
		elseif face==37 then
			SetFace("/chara/cry",0,"","cry")
		elseif face == 38 then
			if currentspr=="1.2" then
				SetFace("/chara/Final_6",100,"Final_6","usual")
				else
				SetFace("/chara/Final_6",100,"white","right")
			end
		elseif face == 39 then
			SetFace("/chara/Final_7",0,"","unusual")
		elseif face==40 then
			if currentspr=="1.2" then
				SetFace("/chara/thoughts",100,"thoughts","hmpf")
				else
				SetFace("/chara/thoughts",100,"redboth","up")
			end
		elseif face==41 then
			if currentspr=="1.2" then
				SetFace("/chara/thoughtsright",100,"thoughtsright","hmpf")
				else
				SetFace("/chara/thoughtsright",100,"redbothright","up")
			end
		elseif face==42 then
			if currentspr=="1.2" then
				SetFace("/chara/thoughtsleft",100,"thoughtsleft","hmpf")
				else
				SetFace("/chara/thoughtsleft",100,"redtoleft","up")
			end
		elseif face==43 then
			SetFace("/chara/look",100,"redboth","usual")
		elseif face==44 then
			SetFace("/chara/lookleft",100,"redtoleft","usual")
		elseif face==45 then
			SetFace("/chara/trigered",100,"triger","hmpf")
		elseif face==46 then
			SetFace("/chara/trigered_closed",0,false,"hmpf")
		elseif face==47 then
			SetFace("/chara/thinking",100,"redbothright","usual")
		elseif face==48 then
			SetFace("/chara/remembering",100,"whitebothright","usual")
		elseif face==49 then
			if currentspr=="1.2" then
				SetFace("/chara/irony",100,"irony","irony")
				else
				SetFace("/chara/irony",100,"redbothright","both")
			end
		elseif face==50 then
			SetFace("/chara/angryremember",100,"trigerremember","hmpf")
		elseif face==51 then
			if SystemHurted==false then
				SetFace("/chara/auch",0,"nope","nope")
				else
				SetFace("/chara/auch",0,"nope","nope")
			end
			timer=10
			loop=180
			eyes.Set("empty")
		elseif face==52 then
			if currentspr=="1.2" then
				SetFace("/chara/weakening",100,"weak","sad")
				else
				SetFace("/chara/weakening",100,"redleft","up")
			end
		elseif face==53 then
			SetFace("/chara/smart",100,"redtoleft","usual")
		elseif face==54 then
			SetFace("/chara/Redy to kill/Chara_bad",102,"bad","usual")
		elseif face==55 then
			SetFace("/chara/Redy to kill/Final_0",102,"Final_0","new")
		elseif face==56 then
			SetFace("/chara/Redy to kill/irony",102,"irony","irony")
		elseif face==57 then
			SetFace("/chara/Redy to kill/remembering",102,"remembering","new")
		elseif face==58 then
			SetFace("/chara/Redy to kill/thoughts",102,"thoughts","new")
		elseif face==59 then
			SetFace("/chara/Redy to kill/smart",102,"smart","new")
		elseif face==60 then
			SetFace(LostHead,110,"","nope")
		elseif face==61 then
			SetFace(LostHead,0,"","nope")
		elseif face==62 then
			SetFace("/chara/auch1",0,"","usual")
		elseif face==63 then
			SetFace("/chara/Redy to kill/weak",102,"weak","sad")
		elseif face==64 then
			SetFace("/chara/toangry",106,"toangry","angry")
			MyTimer=0
			standnow=7
			standnew=7
			oldpoints={trsy,hdy}
			State("NONE")
			arenasize = {155, 130}
		elseif face==65 then
			SetFace("/chara/Chara_head_disdain",100,"disdain","disdain")
		end
		Changing=false
		end
	end
	local boool=false
	if Changing==false then
	if facing==0 then
		elseif facing==10 then
		timer1=timer1+1
		if timer1==45 then
			SetGlobal("facial_expression",6)
		end
		elseif facing==102 then
		boool=true
		timer1=timer1+1
		if timer1==1 then
			eyes_sp=currentspr.."/chara/Redy to kill/eyes/"..eyesanim.."1"
			eyes.Set(eyes_sp..clmd)
			elseif timer1==4 then
			eyes_sp=currentspr.."/chara/Redy to kill/eyes/"..eyesanim.."0"
			eyes.Set(eyes_sp..clmd)
			elseif timer1==7 then
			eyes.Set("empty")
		end
		if timer1>7 and timer2==0 and Changing==false then
			eyes.Set(currentspr.."/chara/redeyes/"..eyesanim..clmd)
			eyes.alpha=0.5-0.5*math.cos((timer-7)*math.pi/30)
		end
		if Changing==true then
			eyes.alpha=1
		end
		elseif facing==104 then
		boool=true
		animtimer=animtimer+1
		HeadAbove.sprite.SendToTop()
		eyeswhite.sprite.SendToTop()
		eyesred.sprite.SendToTop()
		if currentspr=="1.2" then
			if animtimer<90 then
				trsy=bodymax+1.5*math.cos(animtimer*math.pi/90)
				hdy=headmax+1.5*math.cos(animtimer*math.pi/90)
				eyesred.sprite.alpha=0.5+0.5*math.cos(animtimer*math.pi/90)
				eyeswhite.sprite.alpha=0.5+0.5*math.cos(animtimer*math.pi/90)
				HeadAbove.sprite.alpha=0
				else
				arenasize = {535, 140}
				animtimer=0
				standnow=6
				standnew=6
				standtime=200
				HeadAbove.Remove()
				eyesred.Remove()
				eyeswhite.Remove()
				timer=999
				timer1=8
				facing=102
				eyesanimbad="angry"
				eyesanim="angry"
				HeadAbove=false
				eyeswhite=false
				eyesred=false
			end
		end
		elseif facing==106 then
		MyTimer=MyTimer+1
		local t=MyTimer
		if t<61 then
			local sin=0.5-0.5*math.cos(t*math.pi/60)
			trsy=oldpoints[1]*(1-sin)+(bodymax+1.5)*sin
			hdy=oldpoints[2]*(1-sin)+(headmax+1.5)*sin
		end
		if t==1 then
			eyes_sp=currentspr.."/chara/eyes/"..eyesanim.."2"
			eyes.Set(eyes_sp..clmd)
			elseif t==6 then
			eyes_sp=currentspr.."/chara/eyes/"..eyesanim.."1"
			eyes.Set(eyes_sp..clmd)
			oldpoints={trsy,hdy}
			elseif t==11 then
			eyes_sp="empty"
			eyes.Set("empty")
			standnow=7
			standnew=7
			elseif t>11 then
			standnow=7
			standnew=7
			if t==61 then
				eyes_sp="empty"
				eyes.Set("empty")
				if lang=="rus" then
					enemies[1].SetVar("currentdialogue",{"[noskip][effect:rotate][speed:0.75]У меня все ещё \nесть силы дать \nтебе отпор![w:15] ", "[effect:none][noskip][func:NoMercy1]Если я и не \nчеловек,[w:3] и не \nмонстр[waitall:4][w:3]...[waitall:1][w:3]","[func:angry]Тогда мне,[w:3] как \nДемону,[w:3] положено \nдраться до \nпоследней капли \nкрови!", "Я положу тебе \nконец,[waitall:2][w:3][func:GiveCurse]проклятая \nкровь!"})
					else
					enemies[1].SetVar("currentdialogue",{"[noskip][effect:rotate][speed:0.75]Hala sana karşı \ndirenebileceğim \ngüçlerim var![w:15] ", "[effect:none][noskip][func:NoMercy1]Eğer bir insan yada \ncanavar değilsem[waitall:4][w:3]...[waitall:1][w:3] ","[func:angry]O zaman,[w:3] bir şeytan \nolarak,[w:3] \nKanımın son damlasına \nkadar savaşmalıyım!", "Seni bitireceğim,[waitall:2][w:3]\n[func:GiveCurse]lanet olası şey!"})
				end
				State("ENEMYDIALOGUE")
				SetFace("/chara/angry",104,"angry","angry",true)
				HeadAbove=CreateProjectileAbs("empty",0,0,"Top")
				HeadAbove.sprite.Scale(2,2)
				eyeswhite=CreateProjectileAbs(currentspr.."/chara/eyeswhite",0,0,"Top")
				eyesred=CreateProjectileAbs(currentspr.."/chara/eyesred",0,0,"Top")
				eyeswhite.sprite.Scale(2,2)
				eyesred.sprite.Scale(2,2)
				animtimer=0
				standnow=7
				standnew=7
				standtime=0
				facing=104
			end
		end
		
		elseif facing==105 then
		if sleep==-1 then
			charahead.Set(currentspr.."/sleepy/sleepy0"..clmd)
			head_sp=currentspr.."/sleepy/sleepy0"
			timer=0
			standtime=0
			trsy = 55
			hdy = 50
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
				facing=0
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
		elseif facing==110 then
		timer1=timer1+1
		if timer==loop-16 then
			eyes_sp=head_sp.."_close1"
			eyes.Set(eyes_sp..clmd)
			elseif timer==loop-11 or timer1==1 then
			eyes_sp=head_sp.."_close2"
			eyes.Set(eyes_sp..clmd)
			elseif timer==loop-6 or timer1==4 then
			eyes_sp=head_sp.."_close1"
			eyes.Set(eyes_sp..clmd)
			elseif timer==loop-1 or timer1==7 then
			eyes_sp="empty"
			eyes.Set("empty")
		end
		else
		timer1=timer1+1
		if timer==loop-16 then
			eyes_sp=currentspr.."/chara/eyes/"..eyesanim.."1"
			eyes.Set(eyes_sp..clmd)
			elseif timer==loop-11 or timer1==1 then
			eyes_sp=currentspr.."/chara/eyes/"..eyesanim.."2"
			eyes.Set(eyes_sp..clmd)
			elseif timer==loop-6 or timer1==4 then
			eyes_sp=currentspr.."/chara/eyes/"..eyesanim.."1"
			eyes.Set(eyes_sp..clmd)
			elseif timer==loop-1 or timer1==7 then
			eyes_sp="empty"
			eyes.Set("empty")
		end
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

function StabilizePos()
	lgsx=savelgsx
end
function Evade(input,side)
	TimeOfEvade=TimeOfEvade+1
	local t=TimeOfEvade
	local ended=false
	local goal=0
	if t==1 then
		savelgsx=lgsx
		goal=lgsx+100*side
	end
	if input==1 or input==2 then
		if t==1 then
			goal=goal-4.5*side*10
			for i=0,30 do
				goal=goal-4.5*(1-math.sin(i*math.pi/60))*side
			end
			lgsx=goal
		end
		if t<11 then
			lgsx=lgsx+4.5*side
			elseif t<41 then
			lgsx=lgsx+4.5*(1-math.sin((t-11)*math.pi/60))*side
			if t==40 then
				ended=true
			end
		end
		elseif input==3 then
		if t==1 then
			goal=goal-4*side*13
			for i=0,30 do
				goal=goal-4*(1-math.sin(i*math.pi/60))*side
			end
			lgsx=goal
		end
		if t<14 then
			lgsx=lgsx+4*side
			elseif t<44 then
			lgsx=lgsx+4*(1-math.sin((t-14)*math.pi/60))*side
			if t==43 then
				ended=true
			end
		end
		elseif input==4 then
		if t==1 then
			goal=goal-3.5*side*13
			for i=0,40 do
				goal=goal-3.5*(1-math.sin(i*math.pi/80))*side
			end
			lgsx=goal
		end
		if t<14 then
			lgsx=lgsx+3.5*side
			elseif t<54 then
			lgsx=lgsx+3.5*(1-math.sin((t-14)*math.pi/80))*side
			if t==53 then
				ended=true
			end
		end
		elseif input==5 then
		if t==1 then
			goal=goal-3*side*18
			for i=0,40 do
				goal=goal-3*(1-math.sin(i*math.pi/80))*side
			end
			lgsx=goal
		end
		if t<19 then
			lgsx=lgsx+3*side
			elseif t<59 then
			lgsx=lgsx+3*(1-math.sin((t-19)*math.pi/80))*side
			if t==58 then
				ended=true
			end
		end
	end
	if ended==true then
		savelgsx=savelgsx+100*side
		TimeOfEvade=0
	end
	return ended
end

function EndedEvade(evo)
	if SystemHurted==false then
		charatorso.Set(currentspr.."/chara/Chara_body"..clmd)
		trs_sp = currentspr.."/chara/Chara_body"
		else
		charatorso.Set(currentspr.."/chara/Chara_body_wounded"..clmd)
		trs_sp = currentspr.."/charaChara_body_wounded"
	end
	if evo then
		if EpicKnife==false then
			charalegs.Set(currentspr.."/chara/Chara_legs")
			lgs_sp=currentspr.."/chara/Chara_legs"
			else
			charalegs.Set(currentspr.."/chara/Chara_legs_fight")
			lgs_sp=currentspr.."/chara/Chara_legs_fight"
			charatorso.Set(currentspr.."/chara/Chara_body_fight")
			trs_sp=currentspr.."/chara/Chara_body_fight"
		end
	end
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
if SoulShowsUp>0 then
	if SoulShowsUp<60 then
		SoulShowsUp=SoulShowsUp+1
		charasoul.alpha=math.sin(SoulShowsUp*math.pi/120)
		elseif SoulShowsUp>60 and SoulShowsUp<90 then
		if SoulShowsUp==61 then
			SLASH=CreateProjectileAbs("chara/att0",trsx+lgsx+soulpos[1],trsy+lgsy+soulpos[2])
			Audio.PlaySound("slice2")
		end
		SoulShowsUp=SoulShowsUp+1
		if SoulShowsUp%5==0 then
			SLASH.sprite.Set("chara/att"..(SoulShowsUp-60)/5)
		end
		elseif SoulShowsUp>89 and SoulShowsUp<100 then
		if SoulShowsUp==90 then
			SLASH.sprite.Set("laser0/laserv0")
			Audio.PlaySound("bolt")
		end
		SLASH.sprite.alpha=0.1*(100-SoulShowsUp)
		SoulShowsUp=SoulShowsUp+1
		elseif SoulShowsUp==100 then
		SLASH.Remove()
		SetGlobal("charaisdead", 1)
		SoulShowsUp=0
	end
end
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
if #ghostsappeared>0 then
	local count=0
	for i=1,#ghostsappeared do
		local g=ghostsappeared[i]
		if g.isactive then
			local time=g.GetVar("time")
			local movi=g.GetVar("movi")+1
			local stime=g.GetVar("stime")
			g.SetVar("movi",movi)
			if time<60 then
				time=time+1
				g.SetVar("time",time)
				elseif time==60 then
				stime=stime+1
				g.SetVar("stime",stime)
				elseif time>60 and time<300 then
				if stime%60==30 then
					time=time+1
					g.SetVar("time",time)
					else
					stime=stime+1
					g.SetVar("stime",stime)
				end
			end
			if movi<90 then
				g.MoveToAbs(320,244+g.sprite.height/2*g.sprite.yscale)
				elseif movi<120 then
				local x=0
				if i==1 then
					x=-120
					elseif i==2 then
					x=120
					elseif i==3 then
					x=-230
				end
				g.MoveToAbs(320+x*math.sin((movi-90)*math.pi/60),244+g.sprite.height/2*g.sprite.yscale)
				elseif movi==120 then
				g.sprite.layer="BelowArena"
				g.sprite.SendToBottom()
			end
			if time<60 then
				g.sprite.alpha=0.5*math.sin(time*math.pi/120)
				elseif time==60 or time==61 then
				g.sprite.alpha=0.3 + 0.2*math.sin((stime+15)*math.pi/30)
				elseif time<150 then
				g.sprite.alpha=0.1 + 0.9*math.sin((time-60)*math.pi/180)
				elseif time>240 and time<300 then
				g.sprite.alpha=math.cos((time-240)*math.pi/120)
				elseif time==300 then
				g.Remove()
			end
			else
			count=count+1
		end
	end
	if count==#ghostsappeared then
		ghostsappeared={}
	end
end
	if sleep==true then
		if sleepletterstimer%180==0 or sleepletterstimer%180==30 or sleepletterstimer%180==60 then
			local zz=CreateSprite("sleepy/zzz")
			table.insert(sleepletters,zz)
			zz.x=360
			zz.y=400
		end
		sleepletterstimer=sleepletterstimer+1
	end
	for i=1,#sleepletters do
		local zzz=sleepletters[i]
		if zzz.isactive then
			if not zzz.GetVar("timer") then
				zzz.SetVar("timer",0)
				elseif zzz.GetVar("timer")<360 then
				zzz.SetVar("timer",zzz.getVar("timer")+1)
			end
			local timer=zzz.GetVar("timer")
			zzz.Scale(1.75+0.75*math.sin((timer)*math.pi/60),1.75+0.75*math.sin((timer)*math.pi/60))
			if timer%120<60 then
				zzz.x=zzz.x+1*math.sin(timer*math.pi/60)
				zzz.y=zzz.y+0.5*math.sin(timer*math.pi/60)
				else 
				zzz.x=zzz.x-0.5*math.sin(timer*math.pi/60)
				zzz.y=zzz.y-0.5*math.sin(timer*math.pi/60)
			end
			if timer==360 then
				zzz.Remove()
			end
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
		charasoul.y=trsy+lgsy+soulpos[2]
		charasoul.x=trsx+lgsx+soulpos[1]
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
			if EpicKnife==true and currentspr=="1.2" then
				trsy=trsy-0.5
			end
			elseif standtime<36 then
			elseif standtime<66 then
			trsy=bodymax-1.5*math.cos((standtime-5)*math.pi/30)
			hdy=headmax-1.5*math.cos((standtime-5)*math.pi/30)
			if EpicKnife==true and currentspr=="1.2" then
				trsy=trsy-0.5
			end
		end
		if EpicKnife==true and currentspr=="1.2" then
			trsx=bodyx
			hdx=headx
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
		elseif standnow==6 then
		if standtime<90 then
			trsy=(bodymax-0.75)-0.75*math.cos(standtime*math.pi/90)
			hdy=(headmax-0.75)-0.75*math.cos(standtime*math.pi/90)
			elseif standtime<121 then
			elseif standtime<211 then
			trsy=(bodymax-0.75)-0.75*math.cos((standtime-30)*math.pi/90)
			hdy=(headmax-0.75)-0.75*math.cos((standtime-30)*math.pi/90)
		end
		if standtime==240 then
			standtime=0
			standnow=standnew
		end
	end
	FaceCheck()
	local eva = GetGlobal("evasion")
	local evo=false
	if currentspr=="1.2" then
		evo=true
	end
	if eva == 1 then
		eyes_sp="empty"
		eyes.Set("empty")
		if endevade==false then
			if trs_sp ~= "chara/Chara_body_d"  then
				if SystemHurted==false then
					charatorso.Set(currentspr.."/chara/Chara_body_d"..clmd)
					trs_sp = currentspr.."/chara/Chara_body_d"
					charalegs.Set(currentspr.."/chara/Chara_legs_r")
					lgs_sp=currentspr.."/chara/Chara_legs_r"
					else
					charatorso.Set(currentspr.."/chara/Chara_body_d_wounded"..clmd)
					trs_sp = currentspr.."/chara/Chara_body_d_wounded"
					charalegs.Set(currentspr.."/chara/Chara_legs_r_wounded")
					lgs_sp=currentspr.."/chara/Chara_legs_r_wounded"
				end
			end
			if evo then
				standtime=-1
			end
           		if  head_sp  ==(currentspr.."/chara/Chara_head") and evadelevel==1 then
           		     	charahead.Set(currentspr.."/chara/Chara_smile"..clmd)
           	    		head_sp=currentspr.."/chara/Chara_smile"
                		SetGlobal("FaceChange",1)
                	end
			if evadelevel<4 then
				LeaveShadow()
			end
			local done=Evade(evadelevel,-1)
			if done==true then
				endevade=true
				legshift=0
			end
			charahead.Set(head_sp..clmd)
			else
			legshift=legshift+1
			StabilizePos()
			if legshift<20 and evo then
				standtime=-1
			end
			if legshift==20 then
				EndedEvade(evo)
				elseif legshift==60 then
				legshift=0
				if not GetGlobal("FaceChange") then
					elseif GetGlobal("FaceChange")==1 then
					if SuddenStrike==false then
		           		     	charahead.Set(currentspr.."/chara/Chara_head"..clmd)
	        	   	    		head_sp=currentspr.."/chara/Chara_head"
						else
						SuddenStrike=false
					end
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
				if SystemHurted==false then
					charatorso.Set(currentspr.."/chara/Chara_body_b"..clmd)
					trs_sp = currentspr.."/chara/Chara_body_b"
					charalegs.Set(currentspr.."/chara/Chara_legs_l")
					lgs_sp=currentspr.."/chara/Chara_legs_l"
					else
					charatorso.Set(currentspr.."/chara/Chara_body_b_wounded"..clmd)
					trs_sp = currentspr.."/chara/Chara_body_b_wounded"
					charalegs.Set(currentspr.."/chara/Chara_legs_l_wounded")
					lgs_sp=currentspr.."/chara/Chara_legs_l_wounded"
				end
			end
           		if  head_sp  ==(currentspr.."/chara/Chara_head") and evadelevel==1 then
           		     	charahead.Set(currentspr.."/chara/Chara_smile"..clmd)
           	    		head_sp=currentspr.."/chara/Chara_smile"
                		SetGlobal("FaceChange",1)
                	end
			if evo then
				standtime=-1
			end
			if evadelevel<4 then
				LeaveShadow()
			end
			local done=Evade(evadelevel,1)
			if done==true then
				endevade=true
				legshift=0
			end
			charahead.Set(head_sp..clmd)
			else
			legshift=legshift+1
			StabilizePos()
			if legshift<20 and evo then
				standtime=-1
			end
			if legshift==20 then
				EndedEvade(evo)
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
		mouthblood.alpha=0.3
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
		mouthblood.alpha=0.2
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
		mouthblood.alpha=0.1
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
		mouthblood.alpha=0.2
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
		mouthblood.alpha=charalegs.alpha
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
		if mercy<5 then
			NewAudio.Play(songs[3])
			NewAudio.SetPitch(songs[3],1.2)
		end
		State("DEFENDING")
		timestamp1 = 0 
		SetGlobal("charaisdead", 5)
	end
	if knifestage==5 then
		charatorso.Set(currentspr.."/chara/twowounds"..clmd)
		trs_sp=currentspr.."/chara/twowounds"
		knifestage=6
	end
	if not GetGlobal("dying") then
		
		charasoul.y=trsy+lgsy+soulpos[2]
		charasoul.x=trsx+lgsx+soulpos[1]
		
		elseif GetGlobal("dying")==true then
		if not timer5 then
			timer5=1
			tremb=0.1
			charasoul.alpha = 1
			charasoul.SendToTop()
			torsoup=charatorso.y
			headup=charahead.y
			legsleft=charalegs.x
			torsoleft=charatorso.x
			headleft=charahead.x
			elseif timer5<180 then
			timer5=timer5+1
		end
		if timer5==20 then
			Audio.PlaySound("heartbeatbreaker")
			charasoul.Set(currentspr.."/chara/chara_soul2")
		end
		if timer5<80 then
			hdx = headleft+tremb*math.sin(timer5*math.pi/4)
			trsx = torsoleft+2*tremb*math.sin(timer5*math.pi/4)
			lgsx=legsleft+2*tremb*math.sin(timer5*math.pi/4)
			hdy=headup
			trsy=torsoup
			if timer5%16==0 then
				tremb=tremb+0.1
			end
			elseif timer5<106 then 
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
			charadead=CreateSprite(currentspr.."/chara/dead"..clmd)
			chrdd=currentspr.."/chara/dead"
			deadbody=true
			charadead.Scale(2,2)
			charadead.x=lgsx+15
			charadead.y=372
			lgsx =-200
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
--[[if TimeToMove>0 then
	TimeToMove=TimeToMove+1
	if TimeToMove==2 then
		savelgsx=lgsx
	end
	if TimeToMove<30 then
		lgsx=lgsx+math.sin(TimeToMove*math.pi/60)
		elseif TimeToMove<91 then
		lgsx=lgsx+1
		else
		lgsx=lgsx+math.sin((TimeToMove-60)*math.pi/60)
	end
	if TimeToMove==121 then
		lgsx=savelgsx+100
		TimeToMove=0
		SetGlobal("evasion",0)
	end
end]]
if TimeToMove>0 then
	TimeToMove=TimeToMove+1
	if TimeToMove==2 then
		savelgsx=lgsx+100
		goal=savelgsx-3.6*6
		for i=1,30 do
			goal=goal-(1-math.cos(i*math.pi/60))*3.6
		end
		for i=1,30 do
			goal=goal-(1-math.sin(i*math.pi/60))*3.6
		end
		lgsx=goal
	end
	if TimeToMove<32 then
		local i=TimeToMove-1
		lgsx=lgsx+(1-math.cos(i*math.pi/60))*3.6
		elseif TimeToMove<38 then
		lgsx=lgsx+3.6
		elseif TimeToMove<68 then
		local i=TimeToMove-37
		lgsx=lgsx+(1-math.sin(i*math.pi/60))*3.6
		elseif TimeToMove==68 then
		lgsx=savelgsx
	end
	if lgsx==savelgsx then
		TimeToMove=0
		SetGlobal("evasion",0)
	end
end
if not GetGlobal("evasion") then
	elseif GetGlobal("evasion")%2==0 then
	charalegs.x=math.floor(lgsx*500)/500+deltx
	else
	charalegs.x=lgsx+deltx
end
if coughtime>0 then
	hdydelta=cough*math.sin(coughtime*math.pi/4)*math.sin(coughtime*math.pi/20/cough)/2
	coughtime=coughtime-1
	if coughtime==0 then
		hdydelta=0
		cough=0
	end
end
charalegs.y=math.floor(lgsy*1000)/1000
charatorso.x=math.floor(trsx*1000)/1000+hdxdelta/2
charatorso.y=math.floor(trsy*1000)/1000+hdydelta/2
charahead.x=math.floor(hdx*1000)/1000+hdxdelta
charahead.y=math.floor(hdy*1000)/1000+hdydelta
if facing==104 then
		eyeswhite.MoveToAbs(charahead.x+charatorso.x+charalegs.x,charahead.y+charatorso.y+charalegs.y)
		eyesred.MoveToAbs(charahead.x+charatorso.x+charalegs.x,charahead.y+charatorso.y+charalegs.y)
		HeadAbove.MoveToAbs(charahead.x+charatorso.x+charalegs.x,charahead.y+charatorso.y+charalegs.y)
end

if smile==false then
	else smile.MoveToAbs(charahead.x+charatorso.x+charalegs.x,charahead.y+charatorso.y+charalegs.y-13)
	smile2.MoveToAbs(charahead.x+charatorso.x+charalegs.x,charahead.y+charatorso.y+charalegs.y-13)
end
end

function CharaDisappear() 
end

function Wounded(health,firsthealth)
	if systemfight==false then
		if health==1501 then
			enemies[1].GetVar("bloodmouth",false)
			charatorso.Set(currentspr.."/chara/Chara_body0"..clmd)
			trs_sp = currentspr.."/chara/Chara_body0"
			charalegs.Set(currentspr.."/chara/Chara_legs"..clmd)
			lgs_sp=currentspr.."/chara/Chara_legs"
		end
		if health < 1499 and health > 1300 then
			if FallingKnife.timer==0 then
				FallingKnife.timer=1
			end
			charatorso.Set(currentspr.."/chara/wound"..clmd)
			trs_sp = currentspr.."/chara/wound"
		elseif health < 1300 and health > 900 then	
			charatorso.Set(currentspr.."/chara/wound1"..clmd)
			trs_sp = currentspr.."/chara/wound1"
		elseif health < 900 and health > 500 then
			charatorso.Set(currentspr.."/chara/wound2"..clmd)
			trs_sp = currentspr.."/chara/wound2"
		elseif health < 500 and health > 200 then
			charatorso.Set(currentspr.."/chara/wound3"..clmd)
			trs_sp = currentspr.."/chara/wound3"
		elseif health < 200 then
			charatorso.Set(currentspr.."/chara/wound4"..clmd)
			trs_sp = currentspr.."/chara/wound4"
		end
		if health < 1499 then
			enemies[1].SetVar("bloodmouth",true)
			if currentspr=="1.1.6" then
				else
				charalegs.Set(currentspr.."/chara/Chara_legs_knife"..clmd)
				lgs_sp=currentspr.."/chara/Chara_legs_knife"
			end
		end
		else
		if health<1500 then
			SystemHurted=true
			charatorso.Set("1.2/chara/Chara_body_wounded")
			trs_sp="1.2/chara/Chara_body_wounded"
			else
			SystemHurted=false
			charatorso.Set("1.2/chara/Chara_body")
			trs_sp="1.2/chara/Chara_body"
		end
	end
			
end
