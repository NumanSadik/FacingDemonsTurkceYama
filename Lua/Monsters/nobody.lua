
sprite = "empty" --Always PNG. Extension is added automatically.
name = "Чара Дримурр"
hp = 1200
atk = 1
def = 26
check = "Она использует силу\rПОДЗЕМЕЛЬЯ"
dialogbubble = "dialogoverworld"
font="uidialog"
canspare = false
cancheck = false
dodge=false
NewAudio.CreateChannel("dubber1")

function DUB(ingo)
	if Encounter.GetVar("dubbing")==true then
		NewAudio.PlaySound("dubber1",Encounter.GetVar("lang").."/chara/"..ingo,false,1)
		Encounter.SetVar("IsTalk",true)
	end
end

function face(ingo)
	local face=Encounter.GetVar("overworldface")
	local num=0
	if ingo=="yes" then
		num=1
	end
	face.sprite.alpha=num
end

function Interruption()
	local Ach=Encounter.GetVar("Achivements")
	if Ach[4]=="1" then
		State("NONE")
		Encounter.SetVar("IsTalk",false)
		Encounter.SetVar("MyState","ToLostKidChoice")
		local c={"Прервать Чару", "Молчать"}
		if Encounter.GetVar("lang")=="eng" then
			c={"Interrupt Chara","Do nothing"}
		end
		local text1=CreateText("[instant][font:overworld]"..c[1],{120,380},160,"Top",-1)
		text1.HideBubble()
		text1.color={0.25,0,0.25}
		text1.progressmode="none"
		text1.MoveTo(text1.x,370+text1.GetTextHeight()/2)
		local text2=CreateText("[instant][font:overworld]"..c[2],{420,380},160,"Top",-1)
		text2.HideBubble()
		text2.color={0.25,0,0.25}
		text2.progressmode="none"
		text2.MoveTo(text2.x,370+text2.GetTextHeight()/2)
		Encounter.Call("DoFalseHeart")
		Encounter.SetVar("ChoiceText1",text1)
		Encounter.SetVar("ChoiceText2",text2)
		face("no")
	end
end
function checkquick()
	if Encounter.GetVar("quick")==true then
		fightbegin()
	end
end
function Dub(ingo)
	output=""
	if dubbing==true then
		output="[noskip]"
		--Audio.PlaySound(Encounter.GetVar("lang")..ingo)
	end
	return output
end

function Attacking()
	Encounter.SetVar("sansdeadtimer",0)
	SetGlobal("sansisdead",3)
end

function HASTE()
	Encounter.SetVar("READYTOATTACK",true)
end
function noHASTE()
	Encounter.SetVar("READYTOATTACK",false)
end

function yes()
	Encounter.SetVar("answer_yes",1)
end
function no()
	Encounter.SetVar("answer_no",1)
end
function destroy()
	Encounter.Call("choiceend")
end
function worldback()
	State("NONE")
	SetGlobal("worldend",6)
end
function angry()
	SetGlobal("MTT","ANGRY")
end
function proposal()
	SetGlobal("MTT","PROPOSAL")
end
function MTT(ingo)
	SetGlobal("MTT",ingo)
end

function Silence()
	Encounter.Call("SetMusic","none")
end

function saw()
	SetGlobal("MTT","SAW")
	Encounter.Call("SetMusic","chainsaw")
end
function ENDING()
	Encounter.SetVar("trueend",0)
end
function worldend()
	SetGlobal("worldend",1)
end
function choice()
	SetGlobal("choicen",1)
	State("NONE")
end
function slash()
	SetGlobal("sansisdead",1)
	Audio.PlaySound("slice2")
end
function ph1()
	SetGlobal("phase1", 1)
	State("NONE")
	NoMercy1()
end
function ph2()
	SetGlobal("phase1",2)
	State("NONE")
	NoMercy1()
end
function normal()
	SetGlobal("world",Encounter.GetVar("currentspr").."/chara/Chara_normal")
end
function SetFaceLost(ingo)
	SetGlobal("world",Encounter.GetVar("currentspr").."/lost child/lost_"..ingo)
end



function JUMP()
	Encounter.Call("SetMusic","none")
	Audio.PlaySound("jumpscare")
end

function Vietnam()
	Encounter.SetVar("FlashBack",1)
	State("NONE")
	NewAudio.Stop("dubber1")
end


function normal1()
	SetGlobal("world",Encounter.GetVar("currentspr").."/chara/Chara_normal_eyes")
end
function Peachy()
	SetGlobal("world",Encounter.GetVar("currentspr").."/chara/Chara_head05")
end
function NoMercy1()
	SetGlobal("world",Encounter.GetVar("currentspr").."/chara/Chara_head03")
end
function Danger()
	SetGlobal("world",Encounter.GetVar("currentspr").."/chara/Chara_danger_eyes")
end
function Surprise1()
	SetGlobal("world",Encounter.GetVar("currentspr").."/chara/suprise1")
end
function Danger1()
	SetGlobal("world",Encounter.GetVar("currentspr").."/chara/Chara_danger")
end
function fightbegin()
	SetGlobal("fightbegin",true)
	State("NONE")
end