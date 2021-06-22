
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

function ShadowTarget()
	Encounter.SetVar("shadowtarget",1)
end
