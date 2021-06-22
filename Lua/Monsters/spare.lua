commands = {"ПРОВЕРИТЬ", "МОЛИТВА"}

sprite = "empty" 
name = "ПОЩАДА"
hp = 1200
atk = 1
def = 99
check = "Она использует силу\rПОДЗЕМЕЛЬЯ"
dialogbubble = "rightwide"
canspare = false
cancheck = false

function Lang(ingo)
	if ingo=="rus" then
		name="ПОЩАДА"
		else
		name="SPARE"
	end
end

