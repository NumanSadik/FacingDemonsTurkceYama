﻿
sprite = "empty" --Always PNG. Extension is added automatically.
name = "Чара Дримурр"
hp = 1200
atk = 1
def = 26
check = "Она использует силу\rПОДЗЕМЕЛЬЯ"
dialogbubble = "empty"
font="monster"
canspare = false
cancheck = false
dodge=false
NewAudio.CreateChannel("dubber1")

function DUB(ingo)
	if Encounter.GetVar("dubbing")==true then
		NewAudio.PlaySound("dubber1",Encounter.GetVar("lang").."/chara/"..ingo,false,1)
	end
end
