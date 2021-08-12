--A Wild Chara Appears!
require "Monsters/chara"
music = "empty"
encountertext = false
nextwaves ={"easy"}
--nextwaves ={"betrayer/first"}
--nextwaves ={"betrayer/forth"}
wavetimer =999
arenasize = {155, 130}
sadist = 0
movement=false
quick=false
checking=false
quickwave={"nothing"}
--quickwave={"k_4"}
unescape=false
Inventory.AddCustomItems({"Ketchup", "Spaghetti", "Chocolate", "Raw pie", "Sushi", "Ramen","Ketchdown"}, {0, 0, 0, 0, 0, 0, 0, 0, 0})
ingoprog=0
savex=0
savey=0
enemies = {
"chara",
"chara",
"spare",
"items",
"nobody"
}
ammo=1
enemypositions={
{-10,0},
{-110,0},
{0,0},
{0,0},
{-374,-50},
}
----------------- Последние слова --------------------

outro1 = "[func:Final_2,finale][noskip][color:797979][effect:shake][waitall:5]Чтож..."
outro2 = "[noskip][color:797979][effect:shake][waitall:5]Кажется...\nТы победил."
outro3 = "[func:Final_1_closed2][noskip][color:797979][effect:shake][waitall:5]Хех..."
outro4 = "[func:headend][noskip][color:797979][effect:shake][waitall:5]Вот и всё.\nНикогда не думала ,\nчто я умру вот..."
outro5 = "[noskip][color:797979][effect:shake][waitall:5]так."
outro6 = "[func:Final_3][noskip][color:797979][effect:shake][waitall:5]Умру перед лицом\nпредателя..."
outro7 = "[func:headend][noskip][color:797979][effect:shake][waitall:5]Какой же ты\nтрус."
outro8 = "[func:Final_3][noskip][color:797979][effect:shake][waitall:5]Он... верил в тебя..."
outro9 = "[noskip][color:797979][effect:shake][waitall:5]А ты...\nпредала нас..."
outro10 = "[noskip][color:797979][effect:shake][waitall:5]предала все...\nнаши...\nнадежды..."
outro11 = "[func:Final_creepy][noskip][effect:shake][waitall:5][color:ff0000]ТЫ ЖЕ ПРОСТО...\nМЕЛКИЙ...\nБРАТОУБИЙЦА."
outro12 = "[func:Final_4][noskip][color:797979][effect:shake][waitall:5]. . ."
outro13 = "[noskip][color:797979][effect:shake][waitall:5]...Азриель...я..."
outro14 = "[noskip][color:797979][effect:shake][waitall:5]...Я иду к...\n[w:20]т е б е...[func:dead][w:60][func:WON][next]"

rusout={outro1,outro2,outro3,outro4,outro5,outro6,outro7,outro8,outro9,outro10,outro11,outro12,outro13,outro14}


outro1 = "[func:Final_2,finale][noskip][color:797979][effect:shake][waitall:5]Well..."
outro2 = "[noskip][color:797979][effect:shake][waitall:5]I think...\nYou won."
outro3 = "[func:Final_1_closed2][noskip][color:797979][effect:shake][waitall:5]Heh..."
outro4 = "[func:headend][noskip][color:797979][effect:shake][waitall:5]That's it.\nI never thought,\nthat I would die like..."
outro5 = "[noskip][color:797979][effect:shake][waitall:5]this."
outro6 = "[func:Final_3][noskip][color:797979][effect:shake][waitall:5]Dying in front\nof a traitor..."
outro7 = "[func:headend][noskip][color:797979][effect:shake][waitall:5]Such a coward\nyou are."
outro8 = "[func:Final_3][noskip][color:797979][effect:shake][waitall:5]He... believed in you..."
outro9 = "[noskip][color:797979][effect:shake][waitall:5]but you...\nbetrayed us..."
outro10 = "[noskip][color:797979][effect:shake][waitall:5]betrayed all...\nour...\nhopes..."
outro11 = "[func:Final_creepy][noskip][effect:shake][waitall:5][color:ff0000]YOU ARE JUST...\nA LITTLE...\nBROTHERKILLER."
outro12 = "[func:Final_4][noskip][color:797979][effect:shake][waitall:5]. . ."
outro13 = "[noskip][color:797979][effect:shake][waitall:5]...Asri...I'm..."
outro14 = "[noskip][color:797979][effect:shake][waitall:5]...I'm coming to...\n[w:20]y o u...[func:dead][w:60][func:WON][next]"

engout={outro1,outro2,outro3,outro4,outro5,outro6,outro7,outro8,outro9,outro10,outro11,outro12,outro13,outro14}
-----------------------------------------------------------------
--ruscomm = {"Последний актёр на сцене", "Чара выглядит недовольной", "Осталось только ДРАТЬСЯ", "Ты наполнен ПРЕДАТЕЛЬСТВОМ.", "Пахнет трусом.", "Сотри их в пыль.", "Очередной дурак.", "ДЕРИСЬ или УМРИ.", "Тебе ничего не остаётся.", "Ещё не поздно умереть.", "Чара хихикнула.", "Прячься или дерись.", "Точка невозврата.", "Тебе стоит попытаться сильнее.", "Объясни себе свои действия.", "Присоединяйся к битве.", "Никакой ПОЩАДЫ.", "Тебе придётся уМЕРГеть.", "Чара дрожит.", "Ничего особенного.", "Вступи в шоу и закончи его!", "Новое начало.", "Необычная временная линия.", "Суд.", "Навсегда один.", "Пыль на твоих руках кажется \rнормой.", "Просто ДЕРИСЬ.", "Не останавливайся отныне!"}
--In any way, who really  cares about this?
--engcomm ={"The last actor on the scene.", "Chara seems quite upset.", "There's only FIGHT.", "You filled with BETRAYAL.", "Smells like a coward.", "Knock 'em dead.", "Just another fool.", "FIGHT or DIE.", "Nothing left for you.", "It's not late to die.", "Chara chuckles.", "Your DETERMINATION increases!", "Hide or fight.", "Point of no return.", "You should try better", "Reason with yourself.", "Join the fight.", "No MERCY.", "You were forced to MERGe.", "Chara trembling.", "Nothing special.", "Enter the show and cut it out!", "New beginning.", "Unusual timeline.", "Judgement.", "Forever alone.", "Dust on your hands\rseems normal.", "Just FIGHT.", "Don't stop from now on!"}
engcom={"The last actor on the scene."}
ruscom={"Последний актёр на сцене","Чара выглядит недовольной", "Осталось только [w:3]ДРАТЬСЯ", "Ты наполнен [w:7]ПРЕДАТЕЛЬСТВОМ.", "Пахнет [w:5]трусом.", "Сотри их в [w:7]пыль.", "ДЕРИСЬ [w:5]или [w:5]УМРИ."}
herecomments=engcom
-- A custom list with attacks to choose from. Actual selection happens in EnemyDialogueEnding(). Put here in case you want to use it.
possible_attacks = {"k_6", "k_5", "k_4", "field", "k_1", "k_3", "bullettest_bouncy", "bullettest_chaserorb", "bullettest_touhou", "knives2", "knives4", "red1", "red2", "red3", "red4", "gb", "bullettest_blackhole", "2lasers", "k_random", "k_storm", "firespears", "seedfield", "asrielaser", "electro_rain", "spiderdance", "listopad", "green9000"}
--possible_attacks = {"fake", "asrielaser"}
songs={"night","wound"}
phase=1
firsttime=true
lang="eng"
AllMusics={"night","wound","stri","last","prolog","blood","theme","finale","menu","chainsaw"}
cursetext={"ПРОКЛЯТИЕ уничтожает вас","Конец проклятому"}
canflee=false
spawn=false
systemfight=false
mercypoint=0
SetGlobal("progress",0)
prog=0
OverMenuTime=false
dubbing=true
clmd = ""
hpknife=false
knifereload=0
knifestage=0
nonestate=false
wavechange=false
nameliv=false
lastenemy=0
numbers=0
bloodforever={}
currentspr="1.2"
SetGlobal("evade",0)
SetGlobal("charaisdead", 0)--для запуска эндинга
SetGlobal("lie",0)
SetGlobal("timing",true)
SetGlobal("intro", true)
introinprogress = false
statement="old"
slicing=ready
timerp={}
slicetime=0
PlayerBloodDrop={}
Player_ATK=338
nosleep=false
Replacement=false
SetGlobal("curse",0)
SetGlobal("cursed",0)
SetGlobal("pray",0)
SetGlobal("knifeinhand", false)-- сначала нож спрятан
SetGlobal("facial_expression", 15)
SetGlobal("evasion", 0)
SetGlobal("hurtanim", 0)--анимация ранения
alltimer = 0--внедрение общего счётчика кадров позволит реализовать всякие вспомогательные штуки-дрюки.
fightstage = 0
lastbutton = 1
timing1={}
pieces={}
deaths=0
normalend="false"
lowmusic=false
ready_to_evade = true
SetGlobal("sansisdead",0)
fighttimer=0
fighting=false
curmusic="menu"
slashtime=0
misstime=0
damages={}
playerblood={}
for i=1,100 do
	local bl=CreateSprite("empty","BelowPlayer")
	bl.SetVar("working",false)
	table.insert(playerblood,bl)
end
playerbloodnumber=1
truedamage=false
firsthp=1200
SetGlobal("burn",0)
itemmoment=true
pagechange=false
movement=false
itemamount=12
burntime=0
endtimer=0
awayhp=0
logotimer=true
endtimer=0
sansdeadtimer=0
worldtimer=1
sawtime=0
mercy=0
colortime={0,0,0}
speedcolor={2,2,2}
wons=0
buttons={}
answer_yes=0
answer_no=0
olimp=20
fighttim=false
itemed=false
cursedwater=false
ghostresistance=false
movefast=false
curseresistance=false
burnresistance=false
movefast=false
eated=false
dummy=0
animation=0
maxHP=92
lives=4
lastpoint=1
blooddrop={}
Achivements={}
for i=1,9 do
	Achivements[i]="0"
end
NewAudio.CreateChannel("Hits")
NewAudio.PlaySound("Hits","hurtsound",false,1)
NewAudio.Stop("Hits")
buttonsname={}
systemfighter=false
SetGlobal("Betrayel",false)
NewAudio.CreateChannel("dubber")
SavioWrite=Misc.OpenFile("Forever.IGNI","w")
function GetSavio()
	local ans=SavioRead.ReadLines()
	if ans[1]=="1" then
		lang="eng"
		herecomments=engcom
		elseif ans[1]=="2" then
		lang="rus"
		herecomments=ruscom
	end
	if ans[2]=="1" then
		currentspr="1.2"
		elseif ans[2]=="2" then
		currentspr="1.1.7"
		elseif ans[2]=="3" then
		currentspr="1.1.6"
	end
	if ans[3]=="1" then
		clmd=""
		elseif ans[3]=="2" then
		clmd="_color"
	end
	if ans[4]=="1" then
		normalend="false"
		elseif ans[4]=="2" then
		normalend="true"
	end
	if ans[5]=="1" then
		songs[1]="night"
		elseif ans[5]=="2" then
		songs[1]="stri"
	end
	if ans[6]=="1" then
		songs[2]="wound"
		elseif ans[6]=="2" then
		songs[2]="last"
	end
	if ans[7]=="1" then
		dubbing=true
		elseif ans[7]=="2" then
		dubbing=false
	end
	for i=1,9 do
		Achivements[i]=ans[7+i]
	end
	
end

function WriteSavio()
	if lang=="eng" then
		SavioWrite.ReplaceLine(1,"1")
		elseif lang=="rus" then
		SavioWrite.ReplaceLine(1,"2")
	end
	if currentspr=="1.2" then
		SavioWrite.ReplaceLine(2,"1")
		elseif currentspr=="1.1.7" then
		SavioWrite.ReplaceLine(2,2)
		elseif currentspr=="1.1.6" then
		SavioWrite.ReplaceLine(2,3)
	end
	if clmd=="" then
		SavioWrite.ReplaceLine(3,1)
		elseif clmd=="_color" then
		SavioWrite.ReplaceLine(3,2)
	end
	if normalend=="false" then
		SavioWrite.ReplaceLine(4,1)
		elseif normalend=="true" then
		SavioWrite.ReplaceLine(4,2)
	end
	if songs[1]=="night" then
		SavioWrite.ReplaceLine(5,1)
		elseif songs[1]=="stri" then
		SavioWrite.ReplaceLine(5,2)
	end
	if songs[2]=="wound" then
		SavioWrite.ReplaceLine(6,1)
		elseif songs[2]=="last" then
		SavioWrite.ReplaceLine(6,2)
	end
	if dubbing==true then
		SavioWrite.ReplaceLine(7,1)
		elseif dubbing==false then
		SavioWrite.ReplaceLine(7,2)
	end
	for i=1,9 do
		SavioWrite.ReplaceLine(7+i,Achivements[i])
	end
end
function GetFiles()
	if Misc.FileExists("Forever.IGNI")==true then
		SavioRead=Misc.OpenFile("Forever.IGNI","r")
		GetSavio()
	end
end

function Dub(ingo)
	if dubbing==true then
		Audio.PlaySound(lang..ingo)
	end
end


function OnHit()
end


function NewStart()
	BeginTheFight()
	wons=0
	lives=4
	maxHP=92
	itemed=false
	cursedwater=false
	ghostresistance=false
	movefast=false
	curseresistance=false
	burnresistance=false
	movefast=false
	eated=false
	answer_yes=0
	answer_no=0
	sawtime=1
	enemies[4].Call("Recharge")
	itemamount=12
	burntime=0
	cursetimer=0
	worldtimer=1
	deaths=0
	slicetime=0
	Player_ATK=338
	SetGlobal("intro", true)
	SetGlobal("knifeinhand", false)
	prog=ingoprog
	SetGlobal("evade",0)
	SetGlobal("charaisdead", 0)
	SetGlobal("lie",0)
	evadelevel=1
	firsthp=1200
	Player.MoveTo(0,0,true)
	enemies[1].Call("SetActive",false)
	enemies[2].Call("SetActive",false)
	enemies[3].Call("SetActive",false)
	enemies[4].Call("SetActive",false)
	enemies[5].Call("SetActive",true)
end
	
	
function choiceend()
			choice1.Remove()
			choice2.Remove()
			fPlayer.Remove()
			SetGlobal("choicen",false)
end





function NextMusic(ingo)
	local outgo=""
	if ingo=="night" then
		outgo="stri"
		elseif ingo=="stri" then
		outgo="night"
		elseif ingo=="wound" then
		outgo="last"
		elseif ingo=="last" then
		outgo="wound"
	end
	return outgo
end
		


function BeginTheFight()
	enemies[2].Call("SetActive",false)
	enemies[1].Call("SetActive",true)
	if quick==false then
		nextwaves={"nicetomeetya"}
		nextwaves={"easy"}
		else
		nextwaves=quickwave
	end
	Wounded(1201,1201,1201)
	wavetimer =1000
	enemies[1].SetVar("dodge",true)
	enemies[2].SetVar("dodge",true)
	enemies[4].Call("Recharge")
	enemies[1].SetVar("weak",false)
	enemies[1].SetVar("def",30)
	enemies[1].SetVar("commands",{"ПРОВЕРИТЬ", "МОЛИТВА"})
	enemies[2].SetVar("commands",{"ПРОВЕРИТЬ", "МОЛИТВА"})
	SetGlobal("charaisdead",0)
	SetGlobal("cursed",0)
	Player_ATK=338
	charasoul.alpha=0
	charasoul.Set(currentspr.."/chara/chara_soul1")
	SetGlobal("curse",0)
	SetGlobal("burn",0)
	State("NONE")
	SetGlobal("evasion",0)
	SetGlobal("timing",false)
	enemies[1].SetVar("hp",1200)
	SetGlobal("pray",0)
	if wons==0 then
		SetGlobal("facial_expression",23)
		elseif wons==1 then
		SetGlobal("facial_expression",6)
	end
	charalegs.x = 345
	fighttim=false
	itemed=false
	cursedwater=false
	ghostresistance=false
	movefast=false
	curseresistance=false
	burnresistance=false
	movefast=false
	eated=false
	systemfighter=false
end




function OpenMenu()
	State("NONE")
	local lock=CreateProjectile("empty",0,0)
	NAME=CreateProjectile("empty",320-lock.absx,370-lock.absy)
	NAME.sprite.Set("overworld/devillogo")
	NAME.sprite.Scale(0.25,0.25)
	ArrowLeft=CreateProjectile("arrow",60-lock.absx,360-lock.absy)
	ArrowRight=CreateProjectile("arrow",580-lock.absx,360-lock.absy)
	ArrowLeft.sprite.rotation=180
	caut=CreateProjectile(lang.."/OverMenu/caut",320-lock.absx,220-lock.absy)
	back=CreateProjectile(lang.."/OverMenu/back",320-lock.absx,240-lock.absy)
	conf=CreateProjectile(lang.."/OverMenu/conf",480-lock.absx,240-lock.absy)
	quit=CreateProjectile(lang.."/OverMenu/quit",160-lock.absx,240-lock.absy)
	opt=CreateProjectile(lang.."/OverMenu/opti",320-lock.absx,240-lock.absy)
	FPlayer=CreateProjectile("empty",660-lock.absx,240-lock.absy)
	FPlayer.sprite.Set("ut-heart")
	MyState="NONE"
	InState=1
	caut.sprite.alpha=0
	conf.sprite.color={1,1,0}
	quit.sprite.color={1,1,0}
	opt.sprite.color={1,1,0}
	FPlayer.sprite.color={1,0,1}
	back.sprite.SendToTop()
	conf.sprite.SendToTop()
	opt.sprite.SendToTop()
	quit.sprite.SendToTop()
	FPlayer.sprite.SendToTop()
	NormBut()
	dub=CreateProjectile(lang.."/OverMenu/dub",480-lock.absx,360-lock.absy)
	lan=CreateProjectile(lang.."/OverMenu/lan",320-lock.absx,360-lock.absy)
	lanans=CreateProjectile(lang.."/OverMenu/lanans",320-lock.absx,330-lock.absy)
	bac=CreateProjectile(lang.."/OverMenu/bac",160-lock.absx,360-lock.absy)
	local dib=""
	if dubbing==true then
		dib="on"
		else dib="off"
	end
	dubans=CreateProjectile(lang.."/OverMenu/"..dib,480-lock.absx,330-lock.absy)
	dub.sprite.alpha=0
	bac.sprite.alpha=0
	lanans.sprite.alpha=0
	lan.sprite.alpha=0
	dubans.sprite.alpha=0
	dub.sprite.SendToTop()
	bac.sprite.SendToTop()
	dubans.sprite.SendToTop()
	lanans.sprite.SendToTop()
	lan.sprite.SendToTop()
	NAME.sprite.SendToTop()
	caut.sprite.SendToTop()
	ArrowRight.sprite.alpha=0
	ArrowRight.sprite.SendToTop()
	ArrowLeft.sprite.alpha=0
	ArrowLeft.sprite.SendToTop()
	musicsprs={}
	phasesprs={}
	for i=1,2 do
		local ph=CreateProjectile(lang.."/OverMenu/ph"..i,140-lock.absx,360-lock.absy-40*i)
		ph.sprite.alpha=0
		ph.sprite.SendToTop()
		table.insert(phasesprs,ph)
		local mus=CreateProjectile("eng/OverMenu/"..songs[i],0,360-lock.absy-40*i)
		mus.sprite.alpha=0
		mus.MoveTo(220-lock.absx+mus.sprite.width/2,mus.y)
		mus.sprite.SendToTop()
		table.insert(musicsprs,mus)
	end
	
end

function ReDoLanguage()
	dub.sprite.Set(lang.."/OverMenu/dub")
	lan.sprite.Set(lang.."/OverMenu/lan")
	lanans.sprite.Set(lang.."/OverMenu/lanans")
	caut.sprite.Set(lang.."/OverMenu/caut")
	if dubbing==true then
		dubans.sprite.Set(lang.."/OverMenu/on")
		else
		dubans.sprite.Set(lang.."/OverMenu/off")
	end
	if lang=="rus" then
		herecomments=ruscom
		elseif lang=="eng" then
		herecomments=engcom
	end
	bac.sprite.Set(lang.."/OverMenu/bac")
	conf.sprite.Set(lang.."/OverMenu/conf")
	quit.sprite.Set(lang.."/OverMenu/quit")
	opt.sprite.Set(lang.."/OverMenu/opti")
	NormBut()
	MenuOptions(2)
end

function ReDoSprites(ingo)
	BackSprites(ingo)
	lanans.sprite.Set(ingo.."/show")
end


function BackSprites(ingo)
	standtime=0
	hpbar.Set("system/"..color.."/hpbar")
	system.Set("system/"..color.."/normal")
	curse.Set("system/"..color.."/curse")
	TrueBag.Set(ingo.."/bg")
	head_sp=ingo.."/chara/Chara_normal"
	torso_sp=ingo.."/chara/Chara_body0"
	legs_sp=ingo.."/chara/Chara_legs"
	facing=0
	if ingo=="1.1.7" then
		woundx=-20
		woundy=4
		firstbloodx=14
		firstbloody=-20
		woundrandx=28
		woundrandy=28
		lgsx=345
		lgsy=267
		trsx=1
		trsy=37
		hdx=-20
		maxright=345
		maxleft=245
		hdy=71
		centerlegs=-20
		elseif ingo=="1.2" then
		centerlegs=0
		trsx=10
		trsy=55
		hdx=-6
		hdy=50
		maxright=315
		maxleft=215
		lgsx=315
		lgsy=276
		elseif ingo=="1.1.6" then
		centerlegs=0
		maxright=315
		maxleft=215
		trsx=10
		trsy=30
		hdx=-14
		hdy=50
		lgsx=315
		lgsy=260
	end
end


function MenuSprites(amm)
	lan.sprite.color={1,1,0}
	ArrowLeft.sprite.color={1,1,1}
	if amm==1 then
		FPlayer.MoveTo(lan.x-lan.sprite.width/2-16,dub.y)
		lan.sprite.color={1,0,1}
		else
		FPlayer.MoveTo(ArrowLeft.x+16,dub.y)
		ArrowLeft.sprite.color={1,0,1}
	end
end


function MenuOptions(amm)
	if dubbing==true then
		dubans.sprite.color={1,1,1}
		else
		dubans.sprite.color={0.5,0.5,0.5}
	end
	dub.sprite.color={1,1,0}
	lan.sprite.color={1,1,0}
	bac.sprite.color={1,1,0}
	ArrowLeft.sprite.color={1,1,1}
	ArrowRight.sprite.color={1,1,1}
	if amm==0 then
		FPlayer.MoveTo(ArrowRight.x-16,dub.y)
		caut.sprite.Set(lang.."/OverMenu/tospr")
		ArrowRight.sprite.color={1,0,1}
		caut.sprite.alpha=1
		elseif amm==1 then
		FPlayer.MoveTo(dub.x-dub.sprite.width/2-16,dub.y)
		dub.sprite.color={1,0,1}
		caut.sprite.Set(lang.."/OverMenu/caut")
		caut.sprite.alpha=1
		elseif amm==2 then
		FPlayer.MoveTo(lan.x-lan.sprite.width/2-16,dub.y)
		lan.sprite.color={1,0,1}
		caut.sprite.alpha=0
		elseif amm==3 then
		FPlayer.MoveTo(bac.x-bac.sprite.width/2-16,dub.y)
		bac.sprite.color={1,0,1}
		caut.sprite.alpha=0
		elseif amm==4 then
		FPlayer.MoveTo(ArrowLeft.x+16,dub.y)
		caut.sprite.alpha=1
		if normalend=="true" then
			caut.sprite.Set(lang.."/OverMenu/tomus")
			ArrowLeft.sprite.color={1,0,1}
			else
			--caut.sprite.Set(lang.."/OverMenu/nottomus")
			caut.sprite.Set(lang.."/OverMenu/nottomus")
			ArrowLeft.sprite.color={0.5,0.5,0.5}
		end
	end
end



function MenuWords(amm)
	conf.sprite.color={1,1,0}
	quit.sprite.color={1,1,0}
	opt.sprite.color={1,1,0}
	if amm==1 then
		conf.sprite.color={1,0,1}
		FPlayer.MoveTo(conf.x-conf.sprite.width/2-16,conf.y)
		elseif amm==2 then
		opt.sprite.color={1,0,1}
		FPlayer.MoveTo(opt.x-opt.sprite.width/2-16,conf.y)
		elseif amm==3 then
		quit.sprite.color={1,0,1}
		FPlayer.MoveTo(quit.x-quit.sprite.width/2-16,conf.y)
	end
end
		


function MenuMusic(amm, omm)
	for i=1,2 do
		phasesprs[i].sprite.color={1,1,0}
	end
	ArrowRight.sprite.color={1,1,1}
	if amm==0 then
		FPlayer.MoveTo(ArrowRight.x-16,dub.y)
		ArrowRight.sprite.color={1,0,1}
		newsong="menu"
		else
		FPlayer.MoveTo(phasesprs[1].x-phasesprs[1].sprite.width/2-16,360-omm*40-lock.absy)
		phasesprs[omm].sprite.color={1,0,1}
		newsong=songs[omm]
	end
end
		

function FullIntro()
	Inventory.AddCustomItems({"Ketchup", "Spaghetti", "Chocolate", "Raw pie", "Sushi", "Ramen","Ketchdown"}, {0, 0, 0, 0, 0, 0, 0, 0, 0})
	lock.MoveTo(0,0)
	
	overworldfonebattle=CreateProjectile("overworld/beforebattle",320-lock.absx,240-lock.absy)
	overworldfone1=CreateProjectile("overworld/fone1",320-lock.absx,240-lock.absy)
	overworldfone2=CreateSprite("overworld/fone2")
	overworldfone2.x=320
	overworldfone2.y=240
	overworldfone1.sprite.SendToBottom()
	overworldfrisk=CreateProjectile("overworld/frisk",81-lock.absx,76-lock.absy)
	overworldfrisk.sprite.Scale(2,2)
	overworldchara=CreateProjectile("overworld/chara",521-lock.absx,76-lock.absy)
	overworldchara.sprite.Scale(2,2)
	overworldface=CreateProjectile(currentspr.."/chara/Chara_head05",106-lock.absx,386-lock.absy)
	overworldface.sprite.Set(currentspr.."/chara/Chara_head05")
	overworldface.sprite.Scale(2,2)
	overworldface.SendToTop()
	overworldface.sprite.alpha=0
	overworldfone1.sprite.SendToTop()
	overworldfone2.SendToTop()
	overworldfone2.alpha=1
	overworldfrisk.sprite.SendToTop()
	overworldchara.sprite.SendToTop()
	overworldface.sprite.SendToTop()
	overworldfonebattle.sprite.SendToTop()
	overworldfonebattle.sprite.alpha=1
	local dial=""
	if lang=="rus" then
		dial={"[noskip][func:face,yes][next]","[effect:twitch,1][font:overworld][color:ffffff][func:Peachy][func:checkquick][func:DUB,prolog/1][w:3]*Вот мы и здесь.", "[func:normal][func:DUB,prolog/2][w:8]*С возвращением, \nпартнёр.","[func:Peachy]*[waitall:5]...", "[func:DUB,prolog/3][w:7][waitall:1.5]*Ты почти завершил \nпредначертанное,[w:3] [func:normal]не так ли?", "[func:DUB,prolog/4][func:normal1][w:5]*Просто[waitall:2]...[w:3][waitall:1] хотела убедиться.", "[func:Peachy]*[waitall:6]...", "[func:DUB,prolog/5][w:4]*Позволь задать тебе один \nвопрос.", "[func:normal][func:DUB,prolog/6][w:4][speed:1.2]*Ты уверен,[w:3] что [speed:1.3]ты \nвыше последствий?","[func:Peachy][func:DUB,prolog/7][w:4]*Что любые твои [w:2][waitall:2]деяния[waitall:5]...","[func:normal][noskip][func:DUB,prolog/8][w:2]*Останутся [w:2]безнаказанными?[w:30][func:ph1][func:face,no][next]"}
		elseif lang=="eng" then
		dial={"[noskip][func:face,yes][next]","[effect:twitch,1][font:overworld][color:ffffff][func:Peachy][func:checkquick]*So, here we are.", "[func:normal][func:Dub,elgi]*Welcome back, \npartner.","[func:Peachy]*[waitall:5]...", "*You almost completed your \nquest,[w:5] [func:normal]didn`t ya?", "[func:normal1]*Just wanted to get sure.", "[func:Peachy]*[waitall:6]...", "*Let me ask one thing. \n", "[func:normal]*Are you so sure, that you \nare above consequences?","[func:Peachy]*That all your actions...","[func:normal][noskip]*Will remain unpunished?[w:30][func:ph1][func:face,no][next]"}
		if checking==true then
			dial={herecomments[#herecomments]}
		end
	end--[func:DUB,prolog/]
	local di="[func:DUB,prolog/26][w:4][waitall:1]СЕЙ[w:1]ЧАС[w:1] [waitall:1]ВЫ[w:1]ПЬЕ[w:1]ШЬ \n[waitall:2]ЧАШУ ИЗ БОЛИ\nДО [waitall:4]ДНА![w:10]"
	--dial={"[noskip][func:face,yes][next]",di,di,di,di,di,di,di,di,di,di,di,di,di,di}
	if dubbing==true then
		dial=EveryDial(dial,"[effect:twitch,1][font:overworld][color:ffffff][novoice][noskip]")
		else
		dial=EveryDial(dial,"[effect:twitch,1][font:overworld][color:ffffff]")
	end
	enemies[5].SetVar('currentdialogue', dial)
	introinprogress = true
	fPlayer=CreateProjectile("ut-heart",0,0)
	fPlayer.sprite.SendToBottom()
	fPlayer.sprite.color={1,0,1}
	--dial={"[noskip][func:DUB,prolog/17][w:3]На [w:1]улице [w:1]такой \nзамечательный день.","[noskip][func:DUB,prolog/18][w:1]Я чувствую запах \nкрови, \nбурлящей в моих[w:3] \nвенах.","[noskip][func:DUB,prolog/19][w:1]И даже если все мои \n[w:1]близкие [w:2]мертвы[waitall:5]...","[noskip][func:DUB,prolog/20][w:1]Мне всё ещё [w:1]есть \n[w:1]за что бороться.","[func:Peachy][noskip][func:DUB,prolog/21][w:5]Знаешь,[w:20] [func:normal]я[w:5] сочинила \nдля тебя [w:1]стих.","[noskip][func:Peachy][func:DUB,prolog/22][w:1]Он [waitall:2]начинается [waitall:1][w:3]вот \nтак:","[noskip][waitall:2][func:DUB,prolog/23][w:1][waitall:1]Чу[w:1]де[w:1]сн[w:1]ый[w:1] де[w:1]нёк[w:1] \nпо[w:1]дх[w:1]од[w:1]ит[w:1] к[w:1] ко[w:1]нцу...","[noskip][func:DUB,prolog/24][waitall:2]И птички[waitall:1] [waitall:2]поют,[waitall:1][w:2]\n[waitall:2]им [waitall:1]ст[w:1]ра[w:1]х[w:2] не[w:1] к[w:1] лицу...","[noskip][func:DUB,prolog/25][w:5]И [w:2]чувс[w:1]твуя[w:1] си[w:1]лу[w:1],\nч[w:1]то[w:1] тв[w:1]ое[w:1]й [w:1]не[w:1] б[w:1]ыл[w:1]а...","[noskip][func:TakeKnife][func:head][effect:none][novoice][waitall:3][color:ff0000][func:DUB,prolog/26][w:4][waitall:1]СЕЙ[w:1]ЧАС[w:1] [waitall:1]ВЫ[w:1]ПЬЕ[w:1]ШЬ \n[waitall:2]ЧАШУ ИЗ БОЛИ\nДО [waitall:4][func:Devil,night]ДНА![w:10][next]"}
end


--[[
*friendly*So, here we are.
*friendly*Welcome back, partner.
*friendly*You almost completed your quest,didn`t ya?
*friendly*Just wanted to get sure.
*friendly*Let me ask one thing.
*friendly*Are you so sure, that you are above consequences?
*friendly*That all your actions...
*friendly*Will remain unpunished?
*grimly*...[0.5] I see.
*grimly*Heh...[1]It`s funny in a way.
*grimly*I won`t bother myself with teaching you manners.
*grimly*In fact, you already know them...[1]Don`t you?=)
*grimly*  *sigh*
*grimly*Nothing can last forever.
*grimly*And if my world is destined to fade away...
*grimly*Then i will at least try to fade you away.
*grimly*It is such a vivid day today.
*grimly*I smell scent of my boiling blood.
*grimly*And even if all my pals are gone...
*grimly*I still have a reason to conquer.
*friendly*Almost forgot,[1] i made a poem for you.
*friendly*It begins like this:
*friendly*(2)A magnificent day comes to its end...
*friendly*(2)Birds are still singing, ignoring the threat...
*friendly*(2)And feeling the power, that`s not even yours...
*grimly*(3)BE READY TO SUFFER FOR EACH YOUR ABUSE![w:10]

]]
function EveryDial(ingo, part, dubi)
	local outgo=ingo
	if dubbing==false then
		for i=1,#ingo do
			outgo[i]=part..ingo[i]
		end
		else
		for i=1,#ingo do
			outgo[i]=part.."[noskip][novoice]"..ingo[i]
		end
	end
	return outgo
end

function EncounterStarting()
	GetFiles()
	TrueBag=CreateSprite("empty","BelowUI")
	TrueBag.x=320
	TrueBag.y=240
	--Player.MoveTo(0,6000,true)
	Player.MoveTo(0,0,true)
	enemies[1].Call("SetActive",false)
	enemies[2].Call("SetActive",false)
	enemies[3].Call("SetActive",false)
	enemies[4].Call("SetActive",false)
	enemies[5].Call("SetActive",true)
	Player.name = "shifty"
	State("NONE")
	if currentspr=="1.2" then
		color="lilo"
		else
		color="black"
	end
	Player.sprite.color={1,0,1}
	Player.lv = 19
	Player.hp = 92
	require "Animations/chara_anim"
	nohp=CreateSprite("system/nohp")
	nohp.x=330.5
	nohp.y=70
	hppoint=CreateSprite("system/hppoint")
	hppoint.x=330.5
	hppoint.y=70
	hpbar=CreateSprite("system/"..color.."/hpbar")
	hpbar.x=330.5
	hpbar.y=70
        system=CreateSprite("system/normal")
        system.x=445
        system.y=70
        system.SendToTop()
        system.alpha=1.0
        num1=CreateSprite("system/"..color.."/number/"..(Player.hp/10 - Player.hp/10%1))
        num1.x=405
        num1.y=70
        num1.SendToTop()
        num1.alpha=1.0
        num2=CreateSprite("system/"..color.."/number/"..Player.hp%10)
        num2.x=420
        num2.y=70
        num2.SendToTop()
        num2.alpha=1.0
	br=CreateSprite("burn/0")
	link = CreateProjectile("empty",0,0)
	overworldlogo=CreateProjectile("overworld/igb",320-link.absx,240-link.absy)
	overworldlogo.sprite.Set("overworld/devillogo")
	overworldlogo.sprite.Scale(0.25,0.25)
	overworldlogo.sprite.SendToTop()
	overworldigb=CreateProjectile("overworld/igb",320-link.absx,240-link.absy)
	overworldigb.sprite.SendToTop()
	overworldigb.sprite.Scale(0.5,0.5)
	curse=CreateSprite("system/"..color.."/curse")
        curse.x=535
        curse.y=70
	cr=CreateSprite("curse/1")
	cr.y=70
	enemynohp=CreateSprite("system/enemynohp")
	enemyhp=CreateSprite("system/enemyhp")
	enemynohp.alpha=0
	enemyhp.alpha=0
	enemyhp.y=280
	enemynohp.y=280
	enemynohp.SendToTop()
	enemyhp.SendToTop()
	for i=1,4 do
		local button=CreateSprite("empty")
		button.y=27
		if i>1 and i<4 then
			button.x=-80+160*i
			elseif i==1 then
			button.x=87
			else
			button.x=555
		end
		button.alpha=1
		table.insert(buttons,button)
	end
	--PlaceMercy(2)
	cr.x=385
        curse.SendToTop()
	OverMenuTime=0
end
function EnemyDialogueStarting()
end

function PlaceMercy(place)
	for i=1,4 do
		if i==place then
			buttonsname[i]="mercy"
			else
			buttonsname[i]="fight"
		end
	end
	RedoBut(lastbutton)
	mercypoint=place
end
function NormBut()
	buttonsname[1]="fight"
	buttonsname[2]="act"
	buttonsname[3]="item"
	buttonsname[4]="mercy"
	RedoBut(lastpoint)
end

function RedoBut(point)
	for i=1,4 do
		if i==point then
			buttons[i].Set(lang.."/Buttons/"..buttonsname[i].."1")
			else
			buttons[i].Set(lang.."/Buttons/"..buttonsname[i].."0")
		end
	end
end

function EnteringState(newstate, oldstate)
	statement=newstate
	if newstate=="ENEMYDIALOGUE" then
		RedoBut(0)
		arenasize = {155, 130}
	end
	if newstate=="ACTIONSELECT" and systemfight==true then
		PlaceMercy(math.random(4))
	end
	if newstate=="ENEMYDIALOGUE" and itemed==true then
		State("ACTIONSELECT")
		itemed=false
	end
	if newstate=="ENEMYDIALOGUE" and killed==true then
		killed=false
		epilog=true
		State("NONE")
	end
	if newstate=="ATTACKING" then
		State("NONE")
		fighting=true
	end
	if newstate == "ACTIONSELECT" and oldstate == "DEFENDING" then
		if prog==35 then
			truedamage=999999999
		end
	end
	if useitem==true and newstate=="ENEMYDIALOGUE" then
		enemies[4].Call("SetActive",false)
		if GetGlobal("evasion")==0 then
			enemies[1].Call("SetActive",true)
			else enemies[2].Call("SetActive",true)
		end
		useitem=false
	end
	if newstate =="MERCYMENU" and GetGlobal("charaisdead")==0 and systemfight==false then
		enemies[1].Call("SetActive",false)
		enemies[2].Call("SetActive",false)
		enemies[3].Call("SetActive",true)
		State("ENEMYSELECT")
		mercymenu=true
	end
	if GetGlobal("charaisdead")>5 and newstate=="ACTIONSELECT"  and wons==0 then
		nextwaves={"nonestateone"}
		wavetimer =1000
	end
	if oldstate == "ACTIONSELECT" and GetGlobal("charaisdead")>0  and wons==0 then
		if GetGlobal("button")==1 and newstate=="ENEMYSELECT" then
			State("DEFENDING")
			if GetGlobal("charaisdead")==7 then
				SetGlobal("charaisdead",8)
				elseif GetGlobal("charaisdead")==6 then
				SetGlobal("charaisdead",7)
			end
			if sleep==true then
				useknife.Remove()
			end
			if sleep==false or sleep==true then
				else sleep=0
				timer=-5
				nosleep=true
				Audio.PlaySound("reflect")
			end
			elseif GetGlobal("button")==2 then
			State("ACTIONSELECT")
		end
	end

	if newstate == "ACTIONSELECT" and oldstate == "DEFENDING" and GetGlobal("charaisdead") == 5  and wons==0 then
		SetGlobal("charaisdead", 6)
		SetMusic("none")
		enemies[1].SetVar("hp",1200)
		enemies[1].SetVar("currentdialogue", {"[noskip]Чтож... Вот моя \n[color:ff0000]СУПЕРСПОСОБНОСТЬ[color:000000]"})
		nextwaves = {"nothing"}
		State("ENEMYDIALOGUE")
	end
	if GetGlobal("charaisdead") == 8 and wons==0 then
		encountertext=""
		ready=false
		SetGlobal("charaisdead",9)
		nextwaves = {"nothing"}
		enemies[1].SetVar("currentdialogue", {"[func:Final3][noskip]Да.[w:5] Именно.[w:10]\nЕсли ты ранишь\nменя ещё раз, то...","Я проиграю. Так \nчто я решила,\nчто...","[func:angry][color:ff0000]Я не позволю\nтебе ранить меня .","[color:000000]И не дам тебе\nпройти дальше .","[func:closedyesend]Так что ...\nТебе остаётся лишь\nуйти, и тогда...","[func:headend][color:ff0000]Мы наконец\nизбавимся\nот тебя.[color:000000]","[func:sleepy][next]"})
		State("ENEMYDIALOGUE")
	end
	if cursedwater==true then
		enemies[4].Call("CursedWater")
		cursedwater=false
	end
	if newstate=="DEFENDING" and quiche==true then
		quichehp=Player.hp
	end
	if oldstate=="ACTIONSELECT" and systemfight==true then
		Fightmenu=CreateProjectile("system/hityes",0,0)
		if lastbutton==mercypoint then
			enemies[1].Call("SetActive",false)
			enemies[2].Call("SetActive",false)
			enemies[3].Call("SetActive",true)
			State("ENEMYSELECT")
			Fightmenu.Move(-23,0)
			Fightmenu.sprite.color={0,0,0}
			mercymenu=true
			else 
			State("ENEMYSELECT")
			systemfighter=true
		end
	end
			
end


function RandomText()
	local i=math.random(#herecomments)
	local output=herecomments[i]
	--[[if GetGlobal("nocomment")==true then
		output=false
		elseif dubbing==true then
		output="[noskip]"..herecomments[i]
		Audio.PlaySound(lang.."/battle/comms/"..i)
	end]]
	output="[noskip]"..herecomments[i]
	NewAudio.PlaySound("dubber",lang.."/battle/comms/"..i,false,5)
	return output
end


function DefenseEnding() --This built-in function fires after the defense round ends.
	if GetGlobal("lie")%2>0 then
		if GetGlobal("lie")==1 then
			encountertext ="[noskip][starcolor:ff0000][color:ff0000]Ты правда думал, что она будет\nлечить тебя?"
			SetGlobal("lie",2)
		end
		if GetGlobal("lie")==3 then
			encountertext ="[noskip][starcolor:ff0000][color:ff0000]Ты не учишься на своих ошибках...\nДа?"
			SetGlobal("lie",4)
		end
		if GetGlobal("lie")==5 then
			encountertext ="[noskip][starcolor:ff0000][color:ff0000]..."
			SetGlobal("lie",4)
		end
		elseif prog==15 and attacked==true then
		encountertext="[color:ff0000]Продолжай шоу, дорогой!"
		attacked=false
		elseif GetGlobal("charaisdead")>0 and wons==0 then
		encountertext="[starcolor:000000]"
		elseif prog==25 and Player_ATK==338 then
		encountertext="Чара сломала твою бензопилу\nТвоя АТАКА понижена на 300!"
		Player_ATK=38
		elseif quiche==true  and GetGlobal("charaisdead")==0 then
		Player.Heal(math.floor((quichehp-Player.hp)/2))
		encountertext="Живительная сила лечит тебя!"
		quiche=false
		elseif mercy==4 and wons==0 then
		encountertext="Вы наполнены РЕШИТЕЛЬНОСТЬЮ"
		mercy=5
		elseif GetGlobal("curse")==Player.hp then
		encountertext="[starcolor:8800b1][color:8800b1]"..cursetext[math.random(#cursetext)]
		elseif GetGlobal("nocomment")==true then
		encountertext="[novoice]"
		SetGlobal("nocomment",false)
		else 
		if  nameliv==false then 
			encountertext = RandomText()
			else
			encountertext=nameliv
			nameliv=false
		end
	end
	if mercy<4 then
		Player.sprite.color={1,0,1}
		else Player.sprite.color={1,0,0}	
	end
	Player.sprite.rotation=0
	eated=false
	ghostresistance=false
	movefast=false
	curseresistance=false
	burnresistance=false
	movefast=false
	if not GetGlobal("curse") then
		elseif GetGlobal("curse")>0 then
		SetGlobal("judge",true)
	end
end

function SIX(number)
	if number<0 then
		number=0
		elseif number>255 then
		number=255
	end
	number=math.floor(number)
	if number%16==10 then
		part2="a"
		elseif number%16==11 then
		part2="b"
		elseif number%16==12 then
		part2="c"
		elseif number%16==13 then
		part2="d"
		elseif number%16==14 then
		part2="e"
		elseif number%16==15 then
		part2="f"
		else part2=number%16
	end
	if math.floor(number/16)==10 then
		part1="a"
		elseif math.floor(number/16)==11 then
		part1="b"
		elseif math.floor(number/16)==12 then
		part1="c"
		elseif math.floor(number/16)==13 then
		part1="d"
		elseif math.floor(number/16)==14 then
		part1="e"
		elseif math.floor(number/16)==15 then
		part1="f"
		else part1=math.floor(number/16)
	end
	return part1..part2
end




function ANIMATE()
	Audio.Stop()
	State("NONE")
	local x=3
	before=CreateProjectile("overworld/beforebattle",0,0)
	before.sprite.color={0,0,0}
	before.sprite.SendToTop()
	legs=CreateProjectile("empty",0,0)
	legs.sprite.Set("anim/legs")
	legs.sprite.SendToTop()
	legs.sprite.Scale(x,x)
	body=CreateProjectile("empty",0,0)
	body.sprite.Set("anim/body")
	body.sprite.SendToTop()
	body.sprite.Scale(x,x)
	--[[piece=CreateProjectile("empty",0,0)
	piece.sprite.Set("anim/headpiece")
	piece.sprite.SendToTop()
	piece.sprite.Scale(x,x)]]
	head=CreateProjectile("empty",0,0)
	head.sprite.Set("anim/head")
	head.sprite.SendToTop()
	head.sprite.Scale(x,x)
	head.sprite.alpha=1
	body.sprite.alpha=1
	legs.sprite.alpha=1
	pressedC=true
	animquickness=150
	lock=CreateProjectile("empty",0,0)
end
num=1
up=-30
phase=0
headf=0
bodyf=0
placex1=0
placex2=0
placey1=0
placey2=0
x1,y1=0,0
blinks={}
MyState="NONE"
function Module(input)
	if input>0 then
		return input
		else return -input
	end
end

function SetMusic(ingo)
	for i=1,#AllMusics do
		NewAudio.Stop(AllMusics[i])
	end
	if ingo=="none" then
		else
		NewAudio.Play(ingo)
		NewAudio.SetPitch(ingo,1)
		NewAudio.SetVolume(ingo,1)
		curmusic=ingo
	end
end


function Update()
if fighttim==false then
	else
	fighttim=fighttim+1
	if fighttim==30 then
		State("ENEMYDIALOGUE")
		fighttim=false
		RemoveAttacking()
	end
end
if systemfighter==true then
	if Input.Confirm==1 then
		Fightmenu.Remove()
		systemfighter=false
		fighting=true
		State("NONE")
		elseif Input.Cancel==1 then
		systemfighter=false
		State("ACTIONSELECT")
		Fightmenu.Remove()
	end
		
end
if OverMenuTime==false then
	else
	OverMenuTime=OverMenuTime+1
	local time=OverMenuTime
	if time==1 then
		OpenMenu()
		OverBac=CreateProjectile("overworld/beforebattle",0,0)
		OverBac.sprite.SendToTop()
		FPlayer.sprite.SendToTop()
		FPlayer.sprite.alpha=0
		FPlayer.MoveTo(320-OverBac.absx,160-OverBac.absy)
		NAME.sprite.SendToTop()
		NAME.sprite.alpha=0
		conf.sprite.alpha=0
		conf.sprite.SendToTop()
		opt.sprite.alpha=0
		opt.sprite.SendToTop()
		quit.sprite.alpha=0
		quit.sprite.SendToTop()
	end
	if firsttime==true and time>1 and time<21 and time%2==0 then
		local i=(time/2)
		NewAudio.CreateChannel(AllMusics[i])
		NewAudio.PlayMusic(AllMusics[i],AllMusics[i],true,1)
		NewAudio.Stop(AllMusics[i])
	end
	if time==30 and firsttime==true then
		firsttime=false
		time=1
		OverMenuTime=1
	end
	if time==50 then
		OverBac.MoveTo(0,0)
	end
	if time==30 then
		Audio.PlaySound("ingi")
	end
	if time==150 or time==180 then
		Audio.PlaySound("vjuh")
	end
	if time>180 and time<211 then
		local alp=1-math.cos(math.pi*(time-180)/60)
		local newp=140+100*(1-math.cos(math.pi*(time-180)/60))
		conf.sprite.alpha=alp
		opt.sprite.alpha=alp
		quit.sprite.alpha=alp
		conf.MoveTo(conf.x,newp-OverBac.absy)
		opt.MoveTo(opt.x,newp-OverBac.absy)
		quit.MoveTo(quit.x,newp-OverBac.absy)
	end
	if time>30 and time<61 then
		FPlayer.sprite.alpha=1-math.cos(math.pi*(time-30)/60)
		elseif time>90 and time<121 then
		OverBac.sprite.alpha=math.cos(math.pi*(time-90)/60)
		--[[if time==120 then
			NewAudio.PlayMusic("music","menu",true,1)
			NewAudio.Pause("music")
			time=150
		end]]
		elseif time>150 and time<211 then
		NAME.sprite.alpha=1-math.cos(math.pi*(time-150)/60)
		NAME.MoveTo(320-OverBac.absx,480-OverBac.absy-90*math.sin(math.pi*(time-150)/120))
		if time==210 then
			oldpx=FPlayer.x
			oldpy=FPlayer.y
		end
		elseif time>270 and time<301 then
		local newx=conf.x-conf.sprite.width/2-16
		--local nowx=(oldpx)*(270-time)/30+newx*(time-240)/30
		--local nowy=(oldpy)*(270-time)/30+conf.y*(time-240)/30
		local nowx=oldpx+(newx-oldpx)*(1-math.cos(math.pi*(time-270)/60))
		local nowy=oldpy+(conf.y-oldpy)*(1-math.cos(math.pi*(time-270)/60))
		FPlayer.MoveTo(nowx,nowy)
		elseif time==301 then
		--NewAudio.Unpause("music")
		NewAudio.Play("menu")
		MenuWords(1)
		MyState="MENU"
		OverMenuTime=false
		Audio.PlaySound("OverMenuMove")
		BackSprites(currentspr)
	end
end
			





if pressedC==true then
	olimp=olimp+1
	
	local speed=animquickness
	legs.MoveTo(0*math.sin(olimp*math.pi/speed),0*math.sin(olimp*math.pi/180)+60)
	body.MoveTo(0*math.sin(olimp*math.pi/speed)+legs.x,legs.y+6*math.sin(olimp*math.pi/speed*2)-3)
	head.MoveTo(3*math.sin(olimp*math.pi/speed)+body.x,body.y+6*math.sin(olimp*math.pi/speed*2))
	
end
if not happyending or happyending==false then
	else happyending=happyending+1
	local hen=happyending
	if hen==1 then
		lock=CreateProjectile("empty",0,0)
		whitefone=CreateProjectile("titr/white",320-lock.absx,240-lock.absy)
		whitefone.sprite.alpha=0
	end
	if hen==120 then
		Audio.PlaySound("happy")
	end
	if hen<390 then
		whitefone.sprite.alpha=hen/390
	end
	if hen>449 then
		whitefone.sprite.color={1-(hen-450)/120,1-(hen-450)/120,1-(hen-450)/120}
	end
	if hen==570 then
		happyending=false
	end
end
if not trueend then
	else
	if trueend==0 then
		blackfone=CreateProjectile("empty",0,0)
		blackfone.sprite.Set("bg")
		blackfone.sprite.color={0,0,0}
		blackfone.sprite.Scale(10,10)
		blackfone.sprite.alpha=0
	end
	if trueend<301 then
		blackfone.sprite.alpha=math.sin(trueend*math.pi/600)
	end
	if trueend==600 then
		State("DONE")
	end
	trueend=trueend+1
end
if enemydial==true then
	State("ENEMYDIALOGUE")
end
if lowmusic==false then
	else 
	lowmusic=lowmusic+1
	NewAudio.SetVolume(songs[1],math.cos(lowmusic*math.pi/800))
	if lowmusic==800 then
		lowmusic=false
	end
end
if mercy==4 and wons==0 and Betrayel==false then
	for i=1,3 do
		speedcolor[i]=speedcolor[i]+(math.random(2)*2-3)
		if speedcolor[i]<2 then
			speedcolor[i]=2
			elseif speedcolor[i]>10 then
			speedcolor[i]=10
		end
	end
	colortime[1]=colortime[1]+speedcolor[1]/2
	colortime[2]=colortime[2]+speedcolor[2]/2
	colortime[3]=colortime[3]+speedcolor[3]/2
	local ammR=(0.5+0.3*math.sin(colortime[1]*math.pi/80))*255
	local ammG=(0.6+0.4*math.sin(colortime[2]*math.pi/80))*255
	local ammB=(0.8+0.5*math.sin(colortime[3]*math.pi/80))*255
	colorrainbow=SIX(ammR)..SIX(ammG)..SIX(ammB)
	enemies[3].SetVar("name","[starcolor:"..colorrainbow.."][color:"..colorrainbow.."]ИСТИННЫЙ ПЕРЕЗАПУСК")
end

if MyState=="MENU" then
	if not lock then 
		lock=CreateProjectile("empty",0,0)
	end
	if Input.Right==1 and InState>1  then
		InState=InState-1
		Audio.PlaySound("OverMenuMove")
		MenuWords(InState)
	end
	if Input.Left==1 and InState<3 then
		InState=InState+1
		Audio.PlaySound("OverMenuMove")
		MenuWords(InState)
	end
	if Input.Confirm==1 then
		Audio.PlaySound("OverMenuConf")
		if InState==1 then
			MyState="Beginning"
			logotimer=-60
			NewStart()
			elseif InState==2 then
			lan.sprite.alpha=1
			bac.sprite.alpha=1
			dub.sprite.alpha=1
			dubans.sprite.alpha=1
			lanans.sprite.alpha=1
			NAME.sprite.alpha=0
			conf.sprite.alpha=0
			opt.sprite.alpha=0
			quit.sprite.alpha=0
			ArrowRight.sprite.alpha=1
			ArrowLeft.sprite.alpha=1
			InState=1
			MenuOptions(1)
			MyState="Options"
			elseif InState==3 then
			quittimer=1
			MyState="Quiting!"
			OutBlack=CreateProjectile("overworld/beforebattle",0,0)
			OutBlack.sprite.alpha=0
		end
	end
	elseif MyState=="Options" then
	if Input.Right==1 and InState>0 then
		InState=InState-1
		Audio.PlaySound("OverMenuMove")
		MenuOptions(InState)
	end
	if Input.Left==1 and InState<4 then
		InState=InState+1
		Audio.PlaySound("OverMenuMove")
		MenuOptions(InState)
	end
	if Input.Confirm==1 then
		if InState<4 or normalend=="true" then
			Audio.PlaySound("OverMenuConf")
		end
		if InState==0 then
			dub.sprite.alpha=0
			dubans.sprite.alpha=0
			ArrowRight.sprite.alpha=0
			bac.sprite.alpha=0
			lan.sprite.Set(lang.."/OverMenu/"..currentspr)
			if currentspr=="1.1.6" then
				lanans.sprite.Scale(4,4)
				else
				lanans.sprite.Scale(3,3)
			end
			lanans.sprite.Set(currentspr.."/show"..clmd)
			lanans.MoveToAbs(320,lanans.sprite.height/2*lanans.sprite.yscale)
			MyState="Sprites!"
			caut.sprite.alpha=0
			MenuSprites(1)
			InState=1
			elseif InState==1 then
			if dubbing==true then
				dubbing=false
				dubans.sprite.Set(lang.."/OverMenu/off")
				else
				dubbing=true
				dubans.sprite.Set(lang.."/OverMenu/on")
			end
			MenuOptions(1)
			WriteSavio()
			elseif InState==2 then
			if lang=="rus" then
				lang="eng"
				herecomments=engcom
				elseif lang=="eng" then
				lang="rus"
				herecomments=ruscom
			end
			WriteSavio()
			ReDoLanguage()
			elseif InState==3 then
			lan.sprite.alpha=0
			bac.sprite.alpha=0
			dub.sprite.alpha=0
			dubans.sprite.alpha=0
			lanans.sprite.alpha=0
			conf.sprite.alpha=1
			opt.sprite.alpha=1
			quit.sprite.alpha=1
			ArrowRight.sprite.alpha=0
			ArrowLeft.sprite.alpha=0
			InState=2
			NAME.sprite.alpha=1
			MenuWords(2)
			MyState="MENU"
			elseif InState==4 and normalend=="true" then
			ArrowLeft.sprite.alpha=0			
			lan.sprite.alpha=0
			bac.sprite.alpha=0
			lanans.sprite.alpha=0
			dub.sprite.alpha=0
			dubans.sprite.alpha=0
			oldsong="menu"
			newsong="menu"
			InMenuTime=60
			for i=1,2 do
				musicsprs[i].sprite.alpha=1
				phasesprs[i].sprite.alpha=1
				phasesprs[i].sprite.Set(lang.."/OverMenu/ph"..i)
			end
			MyState="Music"
			YState=0
			InState=0
			caut.sprite.alpha=0
			MenuMusic(0)
		end
	end
	elseif MyState=="Sprites!" then
	if Input.Left==1 and InState<2 then
		InState=InState+1
		Audio.PlaySound("OverMenuMove")
		MenuSprites(InState)
	end
	if Input.Right==1 and InState>1 then
		InState=InState-1
		Audio.PlaySound("OverMenuMove")
		MenuSprites(InState)
	end
	if Input.Confirm==1 then
		Audio.PlaySound("OverMenuConf")
		if InState==1 then
			clmd=""
			if currentspr=="1.2" then
				color="black"
				currentspr="1.1.7"
				elseif currentspr=="1.1.7" then
				color="black"
				currentspr="1.1.6"
				elseif currentspr=="1.1.6" then
				color="lilo"
				currentspr="1.2"
			end
			WriteSavio()
			ReDoSprites(currentspr)
			if currentspr=="1.1.6" then
				lanans.sprite.Scale(4,4)
				else
				lanans.sprite.Scale(3,3)
			end
			lanans.MoveToAbs(320,lanans.sprite.height/2*lanans.sprite.yscale)
			lan.sprite.Set(lang.."/OverMenu/"..currentspr)
			MenuSprites(1)
			elseif InState==2 then
			bac.sprite.alpha=1
			lanans.sprite.Scale(1,1)
			dubans.sprite.alpha=1
			dub.sprite.alpha=1
			lan.sprite.Set(lang.."/OverMenu/lan")
			lanans.sprite.Set(lang.."/OverMenu/lanans")
			lanans.MoveTo(lan.x,lan.y-30)
			ArrowRight.sprite.alpha=1
			MyState="Options"
			InState=0
			MenuOptions(InState)
		end
	end
	elseif MyState=="Music" then
	if Input.Left==1 and InState==0 then
		InState=1
		YState=1
		Audio.PlaySound("OverMenuMove")
		MenuMusic(InState,YState)
	end
	if Input.Right==1 and InState==1 then
		InState=0
		YState=1
		Audio.PlaySound("OverMenuMove")
		MenuMusic(InState,1)
	end
	if Input.Down==1 and InState==1 and YState<2 then
		YState=YState+1
		Audio.PlaySound("OverMenuMove")
		MenuMusic(InState,YState)
	end
	if Input.Up==1 and InState==1 and YState>1 then
		YState=YState-1
		Audio.PlaySound("OverMenuMove")
		MenuMusic(InState,YState)
	end
	if oldsong==newsong then
		if InMenuTime<60 then
			InMenuTime=InMenuTime+1
			NewAudio.SetVolume(oldsong,InMenuTime/60)
		end
		else
		InMenuTime=InMenuTime-1
		if InMenuTime>0 then
			NewAudio.SetVolume(oldsong,InMenuTime/60)
			else
			if oldsong=="menu" then
				NewAudio.Pause("menu")
				else
				NewAudio.Stop(oldsong)
			end
			oldsong=newsong
			if newsong=="menu" then
				NewAudio.Unpause("menu")
				else
				NewAudio.Play(newsong)
			end
			NewAudio.SetVolume("menu",0)
			NewAudio.SetVolume(newsong,0)
		end
	end
		
	if Input.Confirm==1 then
		Audio.PlaySound("OverMenuConf")
		if InState==0 then
			MyState="Options"
			InState=4
			ArrowLeft.sprite.alpha=1			
			lan.sprite.alpha=1
			bac.sprite.alpha=1
			lanans.sprite.alpha=1
			dub.sprite.alpha=1
			dubans.sprite.alpha=1
			for i=1,2 do
				musicsprs[i].sprite.alpha=0
				phasesprs[i].sprite.alpha=0
			end
			if oldsong=="menu" then
				else
				NewAudio.Stop(oldsong)
				NewAudio.Unpause("menu")
			end
			NewAudio.SetVolume("menu",1)
			MenuOptions(InState)
			else
			local oldx=musicsprs[YState].sprite.width			
			songs[YState]=NextMusic(songs[YState])
			musicsprs[YState].sprite.Set("eng/OverMenu/"..songs[YState])
			oldx=musicsprs[YState].sprite.width-oldx
			musicsprs[YState].Move(oldx/2,0)
			newsong=songs[YState]
			WriteSavio()
		end
	end	
end
			
if not quittimer then
	else quittimer=quittimer+1
	OutBlack.sprite.alpha=quittimer/60
	NewAudio.SetVolume("menu",math.cos(math.pi*quittimer/160))
	if quittimer==120 then
		State("DONE")
	end
end
if logotimer==true then
	else
	logotimer=logotimer+1
	encountertext = "[novoice]"
	if logotimer>-60 and logotimer<1 then
		NewAudio.SetVolume("menu",1-math.cos(math.pi*logotimer/120))
		OverBac.sprite.alpha=math.sin(math.pi*(logotimer+60)/120)
		OverBac.sprite.SendToTop()
	end
	if logotimer==1 then
		InMenuTime=0
		MyState="NONE"
		OverBac.Remove()
		back.Remove()
		FullIntro()
		conf.Remove()
		opt.Remove()
		quit.Remove()
		NAME.Remove()
		FPlayer.Remove()
		overworldfonebattle.sprite.alpha=1
		overworldfonebattle.sprite.SendToTop()
		overworldlogo.sprite.SendToTop()
		overworldlogo.sprite.alpha=0
		overworldigb.sprite.SendToTop()
		overworldigb.sprite.alpha=0
		Audio.PlaySound("mus_churchbell")
		State("NONE")
		elseif logotimer<181  then
		overworldlogo.sprite.alpha=math.sin(logotimer*math.pi/180)
		overworldigb.sprite.alpha=0
		elseif logotimer<361 then
		overworldlogo.sprite.alpha=0
		overworldigb.sprite.alpha=math.sin((logotimer-180)*math.pi/180)
		elseif logotimer==361 then
		overworldigb.sprite.alpha=0
		elseif  logotimer<542 then
		overworldfonebattle.sprite.alpha=math.cos((logotimer-361)*math.pi/360)
		elseif logotimer==600 then
		State("ENEMYDIALOGUE")
		overworldface.sprite.alpha=1
		SetMusic("prolog")
		logotimer=true
	end
end
if not GetGlobal("sansisdead") then
	elseif GetGlobal("sansisdead")>0 then
	if READYTOATTACK==true and Input.Confirm==1 then
		READYTOATTACK=false
		enemies[5].SetVar("currentdialogue",{"[next]"})
		SetGlobal("sansisdead",3)
		sansdeadtimer=-1
	end
	sansdeadtimer=sansdeadtimer+1
	if GetGlobal("sansisdead")==1 and sansdeadtimer==1 then
		State("NONE")
	end
	if GetGlobal("sansisdead")==1 and sansdeadtimer>70 then
		if sansdeadtimer==71 then
			Audio.PlaySound("hitsound")
		end
		if sansdeadtimer==190 then
			Audio.PlaySound("bonedust")	
			SetGlobal("sansisdead",2)
			sansdeadtimer=0
		end
		elseif GetGlobal("sansisdead")==2 and sansdeadtimer==150 then
		local dial=""
		dial={"[effect:twitch,1][font:floweyend]Он умер.[w:10].[w:10].[w:20] А теперь[waitall:5]...","А теперь моя очередь[waitall:5]...","Давай, сделай это.[w:10] Я[waitall:5]...","я так устал быть цветком[waitall:5]...","[noskip][func:HASTE][waitall:5]...[w:150][func:noHASTE][next]","Почему ты медлишь?","Пожалуйста, Метта, \nесли это правда ты...","То ты не оставишь меня\nпродолжать страдать[waitall:6]...","[func:Attacking][next]"}
		dial=EveryDial(dial,"[font:floweyend][effect:twitch,1]")
		enemies[5].SetVar("currentdialogue",dial)
		State("ENEMYDIALOGUE")
		elseif GetGlobal("sansisdead")==3 then
		if sansdeadtimer==1 then
			State("NONE")
		end
		if sansdeadtimer%45==1 and sansdeadtimer<302 then
			Audio.PlaySound("slice2")
			elseif sansdeadtimer%45==31 and sansdeadtimer<302 then
			Audio.PlaySound("hitsound")
		end
		if sansdeadtimer==420 then
			SetGlobal("sansisdead",4)
			sansdeadtimer=0
		end
		elseif GetGlobal("sansisdead")==5 and sansdeadtimer==180 then
		enemies[5].SetVar("dialogbubble", "end")
		dial={}
		local dialy=""
		if wons==0 then
			dialy={"[font:mtt][effect:twitch,1][waitall:3][noskip][color:ffffff]Приветствую.","[waitall:3][noskip][color:ffffff]Я Метта.","[waitall:3][noskip][color:ffffff]...",'[waitall:3][noskip][color:ffffff]"Метта".',"[waitall:3][noskip][color:ffffff]Истинный сценарист, стоящий за всем.","[waitall:3][noskip][color:ffffff]Всё происходит по моей задумке.","[waitall:3][noskip][color:ffffff]Неважно, где.","[waitall:3][noskip][color:ffffff]Неважно, когда.","[waitall:3][noskip][color:ffffff]И...[w:10] Когда шоу подходит к концу...","[waitall:3][noskip][color:ffffff]Ты.","[waitall:3][noskip][color:ffffff]Под моим руководством.","[waitall:3][noskip][color:ffffff]Положишь ему конец.","[waitall:3][noskip][color:ffffff]Теперь.","[waitall:3][noskip][color:ffffff]В этом мире шоу закончилось.","[waitall:3][noskip][color:ffffff]Снова.","[waitall:3][noskip][color:ffffff]Но в этот раз оно было другое.","[waitall:3][noskip][color:ffffff]Интересно, каким оно будет в \nследующий раз.","[waitall:3][noskip][color:ffffff]Давай уничтожим этот мир...","[waitall:3][noskip][color:ffffff]Чтобы узнать это скорее.","[w:1][func:choice]"}
			dialy=EveryDial(dialy,"[font:mtt][effect:twitch,1][noskip][color:ffffff]")
			enemies[5].SetVar("currentdialogue",dialy)
		--enemies[5].SetVar("currentdialogue",{"[font:mtt][effect:twitch,1][waitall:3][noskip][color:ffffff]Привет.","[waitall:3][noskip][color:ffffff]И перейдём к следующему.","[w:1][func:choice]"})
			elseif wons==1 then
			dialy={"[font:mtt][effect:twitch,1][waitall:3][noskip][color:ffffff]Приветствую.","[waitall:3][noskip][color:ffffff]Я Метта.","[waitall:3][noskip][color:ffffff]...",'[waitall:3][noskip][color:ffffff]Шоу становится всё более драматичным.',"[waitall:3][noskip][color:ffffff]Интересно, каким оно будет в \nследующий раз.","[waitall:3][noskip][color:ffffff]Давай уничтожим этот мир...","[waitall:3][noskip][color:ffffff]Чтобы узнать это скорее.","[w:1][func:choice]"}
			dialy=EveryDial(dialy,"[font:mtt][effect:twitch,1][noskip][color:ffffff]")
			enemies[5].SetVar("currentdialogue",dialy)
			elseif wons==2 then
			normalend="true"
			WriteSavio()
			local ignispeak={"[font:monster][effect:twitch,1][novoice]   [w:5][next]","Привет.","Я Владимир.","Поздравляю.",'Ты [waitall:3]"победил" [waitall:1]Чару.',"Уничтожил её семью.[w:10] \nЕё надежду. \n[w:10]Её Решительность.","И довёл её до депрессии.","Надеюсь, ты доволен.","Но теперь, [w:5]я не вижу смысла \nпродолжать этот бой, \nтак как дальше всё будет \nтаким же.","В общем.[w:3].[w:3].[w:10] Это конец.","Надеюсь, вам понравилось. [w:10]\nДо свидания.","...[w:450][next]","Постой.","У меня всё ещё есть \nодин вопрос к тебе.","Как ты думаешь...","Игра правда должна \nзакончиться...[w:10] так?","Разве ты ни капельки \nне расскаиваешься?",".[w:5].[w:5].","Может.[w:5].[w:5].","Тут есть какой-то.[w:5].[w:5]. [w:15]\nХороший конец?","И всё, что нужно, \nчтобы его получить...","Это проявить немного [waitall:3]ДОБРОТЫ[waitall:1],\n[w:15]и пощадить чару?",".[w:5].[w:5].","Хотя.[w:5].[w:5].[w:15] нет.","Это глупо.","Пощада в конце тринадцатого пути \n[color:ff0000]геноцида[color:ffffff] явно бессмысленна.","В любом случае,\nтеперь это действительно конец.","До свидания.","[func:ENDING][w:9999]"}
			for i=1,#ignispeak do
				ignispeak[i]="[color:ffffff][noskip]"..ignispeak[i]
			end
			enemies[5].SetVar("currentdialogue",ignispeak)
		end
		State("ENEMYDIALOGUE")
		SetGlobal("sansisdead",0)
		sansdeadtimer=0
		elseif GetGlobal("sansisdead")==4 then
		if sansdeadtimer==180 and wons<2 then
			SetMusic("theme")
			NewAudio.SetVolume("theme",1)
		end
		if sansdeadtimer>180 and wons<2 then
			NewAudio.SetVolume("theme",(sansdeadtimer-180)/420)
		end
		if sansdeadtimer==1 then
			mtt=CreateProjectile("empty",320-link.absx,150-link.absy)
			mtt.sprite.SendToTop()
			if wons==2 then
				mtt.sprite.Set("MTT/calm")
				else mtt.sprite.Set("MTT/calm")
			end
			mtt.sprite.alpha=0
			mtt.sprite.Scale(2,2)	
		end
		if sansdeadtimer>239 then
			mtt.sprite.Set("MTT/calm")
			mtt.sprite.Scale(2,2)	
			mtt.sprite.alpha=(1-math.cos((sansdeadtimer-180)*math.pi/720))
		end
		if sansdeadtimer==600 then
			SetGlobal("sansisdead",5)
			sansdeadtimer=0
		end
	end
end
if not GetGlobal("ENDING") then
	elseif GetGlobal("ENDING")==true then
	endtimer=endtimer+1
	if endtimer==145 then
		Player.lv=20
		if wons==0 then
			blanket.Set("system/endhpblanket2")
			else blanket=CreateSprite("system/"..color.."/endhpblanket2")
			blanket.x=330.5
			blanket.y=70
			blanket.SendToTop()
		end
		system.Set("system/"..color.."/lv")
		Audio.PlaySound("levelup")
		local awayhp=109/92*7
		system.x=system.x+awayhp
		num1.x=num1.x+awayhp
		num2.x=num2.x+awayhp
		SetGlobal("ENDING",false)
		endtimer=0
		killed=true
	end
end
if epilog == true then
	if endtimer==0 then
		nextwaves = {"dummy"}
		link=CreateProjectile("empty",0,0)
		fone1=CreateProjectile("overworld/fone1",320-link.absx,240-link.absy)
		fone2=CreateSprite("overworld/fone2")
		fone2.x=320
		fone2.y=240
		frisk=CreateProjectile("empty",480-link.absx,76-link.absy)
		frisk.sprite.Set("overworld/frisk")
		blackfone=CreateProjectile("overworld/beforebattle",320-link.absx,240-link.absy)
		fone1.sprite.SendToTop()
		fone2.SendToTop()
		frisk.sprite.SendToTop()
		frisk.sprite.Scale(2,2)
		blackfone.sprite.SendToTop()
		elseif endtimer<52 then
		blackfone.sprite.alpha=1*(51-endtimer)/50
		elseif endtimer>109 and endtimer<149 then
		local timin=endtimer-110
		if timin%8==4 or timin%8==2 then
			frisk.Move(3,0)
			elseif timin%8==0 or timin%8==6 then
			frisk.Move(-3,0)
		end
		elseif endtimer>199 and endtimer<650 then
		local timin=endtimer-200
		if timin%90<20 then
			if timin%90==0 then
				frisk.sprite.Set("overworld/friskstep")
			end
			frisk.Move(2,0)
			elseif timin%90==20 then
			frisk.sprite.Set("overworld/frisk")
		end
		elseif endtimer>649 and endtimer<700 then
		elseif endtimer>699 and endtimer<760 then
		blackfone.sprite.alpha=1*(endtimer-699)/60
		elseif endtimer==790 then
		blackfone.sprite.alpha=0
		fone1.sprite.color={0,0,0}
		fone2.color={0,0,0}
		enemies[1].Call("SetActive",false)
		enemies[2].Call("SetActive",false)
		enemies[5].Call("SetActive",true)
		enemies[5].SetVar("dialogbubble", "sans")
		local dial=""
		dial={"[noskip][waitall:2][effect:twitch,1][font:sans][color:ffffff]Привет.","[waitall:2][noskip][color:ffffff]Я не ждал сегодня посетителей.","[waitall:2][noskip][color:ffffff]...","[waitall:2][noskip][color:ffffff]Твоё выражение лица...","[waitall:2][noskip][color:ffffff]Хмм...","[waitall:2][noskip][color:ffffff]Ты довольно странный монстр.","[waitall:2][color:ffffff][noskip]Чем я могу помо[func:slash][next]"}
		--enemies[5].SetVar("currentdialogue",{"[noskip][waitall:2][effect:twitch,1][font:sans][waitall:2][color:ffffff][noskip]Чем я могу помо[func:slash][next]"})
		epilog=false
		dial=EveryDial(dial,"[font:sans][color:ffffff][noskip][effect:twitch,1]")
		enemies[5].SetVar("currentdialogue",dial)
		endtimer=-1
		State("ENEMYDIALOGUE")
	end
	endtimer=endtimer+1
end
if GetGlobal("Playerisdead")==true then
	RedoBut(0)
	SetGlobal("Playerisdead",false)
	if lives==2 then
		nameliv="Две жизни осталось"
		prog=0
		arenasize = {90, 90}
		SetGlobal("progress",0)
		elseif lives==1 then
		nameliv="Последняя жизнь"
		prog=0
		arenasize = {90, 90}
		SetGlobal("progress",0)
	end
	Placestompx=Player.absx
	Placestompy=Player.absy
	Player.Hurt(0,4)
	itemamount=12
	Player.hp=92
	SetMusic("none")
	deaths=deaths+1
	--[[if deaths==1 then
		enemies[1].SetVar("currentdialogue",{"Приветствую .","Этот твой взгляд ...","[func:NoMercy1]Хах.","Кажется, я опаснее,\nчем выгляжу ?","[func:TakeKnife][func:Devil,night][func:head][next]"})
		elseif deaths==2 then
		enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","[func:NoMercy1]Кажется, у тебя\nвсё идёт не по\nплану.","Ты выглядишь ...\nнедовольным.","[func:TakeKnife][func:Devil,night][func:head][next]"})
		elseif deaths==3 then
		enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","Это взгляд кого-то,\nкто умер трижды .","[func:NoMercy1]Кажется , я \nподзабыла \nматематику .","Что идёт после \nтрёх ?","[func:Danger1]Поможешь мне \n[color:ff0000]вспомнить ?","[func:TakeKnife][func:Devil,night][func:head][next]"})
		elseif deaths==4 then
		enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","Это взгляд кого-то,\nкто умер 4 раза .","Удобно , да ?","[func:NoMercy1]Это количество \nпальцев на руке \nмоего врага...","После игр со мной .","...","[func:Danger1][color:ff0000]Поиграем ?","[func:TakeKnife][func:Devil,night][func:head][next]"})
		elseif deaths==5 then
		enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","Это взгляд кого-то,\nкто умер 5 раз.","[func:NoMercy1]Красивое число , \nне правда ли ?","...","[func:Danger1]Но придётся его \n[color:ff0000]увеличить .","[func:TakeKnife][func:Devil,night][func:head][next]"})
		elseif deaths==6 then
		enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","Это взгляд кого-то,\nкто умер 6 раз","[func:NoMercy1]Это количество душ \nлюдей у монстров .","[func:Danger1]Ой , прости !","[func:Wink]Грубо говорить \nпро души \n[color:ff0000]БЕЗДУШНОМУ.","[func:TakeKnife][func:Devil,night][func:head][next]"})
		elseif deaths==7 then
		enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","Это взгляд кого-то,\nкто умер 7 раз","[func:NoMercy1]...","Раз ты дошёл до \nэтого числа ...","то ты точно не \n[func:Wink]7 пядей во лбу .","[func:NoMercy1]хех.","[func:TakeKnife][func:Devil,night][func:head][next]"})
		elseif deaths==8 then
		enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","Это взгляд кого-то, \nкто умер 8 раз","[func:NoMercy1]Это число \nсимволизирует \nвечность ...","[func:Danger1]И число твоих [color:ff0000]\nГРЕХОВ =)[color:ffffff]","[func:TakeKnife][func:Devil,night][func:head][next]"})
		elseif deaths==9 then
		enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","Это взгляд кого-то, \nкто умер 9 раз","[func:NoMercy1]Не лучшее число , \nда ?","Не волнуйся ...","[func:Wink]Я его поправлю =)","[func:TakeKnife][func:Devil,night][func:head][next]"})
		elseif deaths==10 then
		enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","Это взгляд кого-то, \nкто умер 10 раз.","[func:NoMercy1]...","[func:normal]Вау! Это же \nпраздник !","Надо это отметить !","Давай устроим \nшикарное меню !","Я принесу шоколад , \nи нарежу торт !","[func:Peachy]...","Постой , \nчто-то не так ...","[func:Danger1][novoice][voice:Flowey]Я буду резать не \nторт.","[func:TakeKnife][func:Devil,night][func:head][next]"})
		elseif deaths==11 then
		enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","Это взгляд кого-то, \nкто умер 11 раз","[func:NoMercy1]Мне уже лень \nсчитать .","Да и смысл ?","[func:Wink][color:ff0000]Мы будем играть [novoice][voice:Flowey]\nВЕЧНО =)","[func:TakeKnife][func:Devil,night][func:head][next]"})
		else
		enemies[1].SetVar("currentdialogue",{"Давай просто \nначнём.","[func:TakeKnife][func:Devil,night][func:head][next]"})
	end]]
	if lives==4 then
		if deaths==1 then
			enemies[1].SetVar("currentdialogue",{"Приветствую.","Этот твой взгляд...","[func:NoMercy1]Хах.","Кажется, игра \nслишком сложна\nдля тебя.","[func:Danger1]Может, тогда \nсыграем в другую? \nНе волнуйся,\nона простая.","[func:Wink]В ней всего \nодно правило","[func:NoMercy1][noskip]Если ты [waitall:3][color:ff0000]УМЕР...","[waitall:5][noskip][func:TakeKnife][func:head][color:ff0000]ТО ТЫ ПРО[func:Devil,night]ИГРАЛ[next]"})
			elseif deaths==2 then
			enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","[func:NoMercy1]Твой план пошёл\nне по плану?","Хе-хе-хе...","[func:TakeKnife][func:Devil,night][func:head][next]"})
			elseif deaths==3 then
			enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","Это взгляд кого-то,\nкто умер трижды.","[func:NoMercy1]Не волнуйся, Бог\nлюбит троицу","К сожалению...","[color:ff0000][func:Danger1]Бог не любит\nтебя.","[func:TakeKnife][func:Devil,night][func:head][next]"})
			elseif deaths==4 then
			enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","Это взгляд кого-то,\nкто умер 4 раза.","Забавно","[func:NoMercy1]Именно это число \nпальцев останется \nу тебя после \nнашей новой [color:ff0000]игры.","...","[func:Danger1][color:ff0000]Поиграем?","[func:TakeKnife][func:Devil,night][func:head][next]"})
			elseif deaths==5 then
			enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","Это взгляд кого-то,\nкто умер 5 раз.","[func:Danger1]О, стоит ли нам \nэто отметить?","[func:NoMercy1]...","Нет, не думаю.","[func:Danger1]Будет ещё повод\nдля [novoice][voice:Flowey][color:ff0000]праздника[color:000000].","[func:TakeKnife][func:Devil,night][func:head][next]"})
			elseif deaths==6 then
			enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","Это взгляд кого-то,\nкто умер 6 раз.","[func:NoMercy1]Именно столько \nДуш людей\nсобрали монстры.","...","[func:Danger1]Ой, прости !","[func:Wink]Не хочу заставлять\nтебя[color:ff0000] завидовать","[func:TakeKnife][func:Devil,night][func:head][next]"})
			elseif deaths==7 then
			enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","Это взгляд кого-то,\nкто умер 7 раз.","[func:NoMercy1]...","Раз мы досчитали\nдо семи...","[func:Wink]Не стоит ли уже \nначать резать?","[func:NoMercy1]Хе-хе.","[func:TakeKnife][func:Devil,night][func:head][next]"})
			elseif deaths==8 then
			enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","Это взгляд кого-то, \nкто умер 8 раз.","[func:NoMercy1]Это число \nсимволизирует \nвечность...","[func:Danger1]И именно столько ты будешь гореть в [color:ff0000]\nАДУ[color:ffffff]","[func:TakeKnife][func:Devil,night][func:head][next]"})
			elseif deaths==9 then
			enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","Это взгляд кого-то, \nкто умер 9 раз.","[func:NoMercy1]Я же говорила,\nчто юбилей близко.","[func:Wink]Мне стоит принести \nпраздничные \nколпаки?","[func:TakeKnife][func:Devil,night][func:head][next]"})
			elseif deaths==10 then
			enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","Это взгляд кого-то, \nкто умер 10 раз.","[func:NoMercy1]...","[func:normal]Вау! Это же \nпраздник!","Надо это отметить!","Давай устроим \nшикарное меню!","Я принесу шоколад, \nи нарежу торт!","[func:Peachy]...","Постой, \nчто-то не так...","[func:Danger1][novoice][voice:Flowey]Я буду резать не \nторт.","[func:TakeKnife][func:Devil,night][func:head][next]"})
			elseif deaths==11 then
			enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","Это взгляд кого-то, \nкто умер 11 раз.","[func:NoMercy1]Извини, но \nторта не будет.","[func:Danger1]Ведь ты убила всех, \nкто мог его \nприготовить.","[func:NoMercy1]Да и в любом \nслучае...","[novoice][voice:Flowey][func:Wink]Тебя [color:ff0000]РЕЗАТЬ[color:000000]\nпроще, чем торт.","[func:TakeKnife][func:Devil,night][func:head][next]"})
			elseif deaths==12 then
			enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","Это взгляд кого-то, \nкто умер 12 раз.","[func:NoMercy1]Полагаю, теперь \nты понимаешь, \nчто я чувствовала.","...[w:5][func:Danger1]Ой, прости, \nсовсем забыла.","[func:Wink]Люди ничего не \nчувствуют.","[func:TakeKnife][func:Devil,night][func:head][next]"})
			elseif deaths==13 then
			enemies[1].SetVar("currentdialogue",{"Этот твой взгляд...","Это взгляд кого-то, \nкто умер 13 раз.","[func:NoMercy1]И столько раз ты \nвырезала всю \nмою семью.","[func:Danger1]Можно сказать, что \nэто юбилейное число.","[func:Wink]А вот и твой приз.","[noskip][waitall:5][func:head][func:TakeKnife]БЕСПЛАТНЫЙ БИЛЕТ[func:Devil,night] В АД[next]"})
			else
			enemies[1].SetVar("currentdialogue",{"Давай просто \nначнём.","[func:TakeKnife][func:Devil,night][func:head][next]"})
		end
		if wons==1 then
			enemies[1].SetVar("currentdialogue",{"Давай просто \nначнём.","[func:TakeKnife][func:Devil,night][func:head][func:nohopeanger][next]"})
		end
		local dial=enemies[1].GetVar("currentdialogue")
		dial[#dial]="[func:noblack]"..dial[#dial]
		enemies[1].SetVar("currentdialogue",dial)
	end
		
	deathtimer=0
end
if not GetGlobal("choicen") then
	elseif GetGlobal("choicen")==true then
	if choicer==1 then
		choice1.sprite.color={1,1,0}
		choice2.sprite.color={1,1,1}
		elseif choicer==2 then
		choice2.sprite.color={1,1,0}
		choice1.sprite.color={1,1,1}
	end
	if Input.Left==1 then
		fPlayer.MoveTo(-136,308-link.absy)
		choicer=1
	end
	if Input.Right==1 then
		fPlayer.MoveTo(114,308-link.absy)
		choicer=2
	end
	if Input.Confirm==1 then
		for i=1,4 do
			enemies[i].Call("SetActive",false)
		end
		enemies[5].Call("SetActive",true)
		if choicer==2 then
			if answer_no==0 then
				enemies[5].SetVar("currentdialogue",{"[func:no][func:destroy][font:mtt][effect:twitch,1][waitall:3][noskip][color:ffffff]Нет?","[waitall:3][color:ffffff][noskip]Хмм...","[waitall:3][func:angry][noskip][color:ffffff]Ты что, до сих пор не понял?","[waitall:3][noskip][func:saw][color:ffffff]ТЫ ВСЕГО ЛИШЬ ПЕШКА![w:20][next]","[func:worldend]"})
				answer_no=1
				State("ENEMYDIALOGUE")
				else
				enemies[5].SetVar("currentdialogue",{"[func:destroy][font:mtt][effect:twitch,1][waitall:3][noskip][color:ffffff]Нет?","[waitall:3][color:ffffff][noskip]Хмм...","[waitall:3][func:angry][noskip][color:ffffff]Скажи...","[waitall:3][noskip][func:saw][color:ffffff]С КАКИХ ПОР АКТЁРЫ ПИШУТ СЦЕНАРИЙ?[w:20][next]","[func:worldend]"})
				State("ENEMYDIALOGUE")
			end
			elseif choicer==1 then
			if answer_yes==0 then
				enemies[5].SetVar("currentdialogue",{"[func:yes][func:destroy][font:mtt][effect:twitch,1][waitall:3][noskip][color:ffffff]Прекрасно.","[waitall:3][color:ffffff][noskip]Ты чудесный актёр.","[waitall:3][func:angry][color:ffffff][noskip]Мы будем выступать вечно, не так ли?","[func:worldend]"})
				answer_yes=1
				State("ENEMYDIALOGUE")
				else
				enemies[5].SetVar("currentdialogue",{"[func:destroy][font:mtt][effect:twitch,1][waitall:3][noskip][color:ffffff]Прекрасно.","[waitall:3][func:angry][color:ffffff][noskip]К следующему шоу.","[func:worldend]"})
				State("ENEMYDIALOGUE")
			end
		end
	end
	elseif GetGlobal("choicen")==1 then
	State("NONE")
	choice1=CreateProjectile("overworld/choice1",320-link.absx,340-link.absy)
	choice2=CreateProjectile("overworld/choice2",320-link.absx,340-link.absy)
	fPlayer=CreateProjectile("ut-heart",0,308-link.absy)
	fPlayer.sprite.color={1,0,1}
	SetGlobal("choicen",true)
	choicer=0
	choice1.sprite.SendToTop()
	choice2.sprite.SendToTop()
	fPlayer.sprite.SendToTop()
end
if not GetGlobal("worldend") then
	elseif GetGlobal("worldend")==1 then
	State("NONE")
	SetGlobal("worldend",2)
	SetMusic("none")
	Audio.PlaySound("slice")
	elseif GetGlobal("worldend")==2 then
	blackfone2=CreateProjectile("overworld/beforebattle",320-link.absx,240-link.absy)
	blackfone2.sprite.alpha=1
	blackfone2.sprite.SendToTop()
	slash=CreateProjectile("empty",320-link.absx,240-link.absy)
	slash.sprite.Set("chara/att0")
	slash.sprite.Scale(3,3)
	SetGlobal("worldend",3)
	elseif  GetGlobal("worldend")==3 then
	worldtimer=worldtimer+1
	if worldtimer%15==0 and worldtimer<105 then
		slash.sprite.Set("chara/att"..(worldtimer/15))
		slash.sprite.Scale(3,3)
		elseif worldtimer==105 then
		Audio.PlaySound("hitsound")
		worldnohp=CreateProjectile("empty",320-link.absx,240-link.absy)
		worldhp=CreateProjectile("empty",320-link.absx,240-link.absy)
		worldnohp.sprite.Set("system/enemynohp")
		worldhp.sprite.Set("system/enemyhp")
		worldnohp.sprite.Scale(2,2)
		worldhp.sprite.Scale(324,2)
	end
	if worldtimer>105 then
		placex=(math.random(17)-9)*5
		placey=(math.random(17)-9)*5
		worldhp.sprite.Scale(324*(195-worldtimer)/90,2)
		worldhp.MoveTo(158+324*(195-worldtimer)/90/2-link.absx+placex,240-link.absy+placey)
		worldnohp.MoveTo(320-link.absx+placex,240-link.absy+placey)
	end
	if worldtimer==195 then
		worldhp.Remove()
		worldnohp.Remove()
		State("NONE")
		SetGlobal("worldend",4)
		worldtimer=0
	end
	elseif GetGlobal("worldend")==4 then
	worldtimer=worldtimer+1
	if worldtimer==300 then
		blackfone2.Remove()
		SetGlobal("MTT",false)
		mtt.Remove()
		if wons==0 then
			enemies[5].SetVar("currentdialogue",{"[effect:twitch,1][font:mtt][noskip][waitall:2][color:ffffff]...","[color:ffffff][noskip][waitall:2]Итак, ты всё ещё здесь.","[color:ffffff][noskip][waitall:2]Не волнуйся.","[color:ffffff][waitall:2][noskip]Я уже восстановил мир.","[noskip][color:ffffff][waitall:2]В конце концов...","[waitall:2][noskip][color:ffffff]Ты уже продал мне свою\n[waitall:5]ДУШУ[w:10][next]","[func:worldback]"})
			nextwaves={"nothing"}
			elseif wons==1 then
			nextwaves={"nothing"}
			enemies[1].SetVar("randomdialogue",{"..."})
			enemies[1].SetVar("comments",{"..."})
			enemies[5].SetVar("currentdialogue",{"[effect:twitch,1][font:mtt][noskip][waitall:2][color:ffffff]...","[color:ffffff][noskip][waitall:2]Итак, ты всё ещё здесь.","[color:ffffff][noskip][waitall:2]Не волнуйся.","[color:ffffff][waitall:2][noskip]Я уже восстановил мир.","[func:worldback]"})
		end
		State("ENEMYDIALOGUE")
		worldtimer=300
		Wounded(1201,1201,1201)
		charalegs.x=345
		worldtimer=300
		SetGlobal("worldend",5)
		Player.lv=19
		Player.hp=92
		blanket.Remove()
		SetGlobal("sansisdead",0)
		prog=0
		SetGlobal("progress",prog)
	end
	elseif GetGlobal("worldend")==6 then
		wavetimer =1000
		enemies[1].SetVar("commands",{"ПРОВЕРИТЬ", "МОЛИТВА"})
		enemies[2].SetVar("commands",{"ПРОВЕРИТЬ", "МОЛИТВА"})
		enemies[1].SetVar("dodge",true)
		enemies[2].SetVar("dodge",true)
		enemies[4].Call("Recharge")
		SetGlobal("cursed",0)
		Player_ATK=338
		charasoul.alpha=0
		charasoul.Set(currentspr.."/chara/chara_soul1")
		SetGlobal("curse",0)
		State("NONE")
		SetGlobal("evasion",0)
		SetGlobal("timing",false)
		enemies[1].SetVar("hp",1200)
		enemies[2].Call("SetActive",false)
		enemies[5].Call("SetActive",false)
		enemies[1].Call("SetActive",true)
	       	SetGlobal("pray",0)
		if wons==1 then
			enemies[1].SetVar("commands",{"ПРОВЕРИТЬ"})
			enemies[1].SetVar("dodge",false)
			truedamage=9999999999
		end
		if wons==0 then
			hpknifeone.alpha=0
			SetGlobal("facial_expression",6)
			else	SetGlobal("facial_expression",32)
		end
		--if wons==1 then
		--	Wounded(1205)
		--	else 
			Wounded(1201,1201,1201)
		--end
		charalegs.x = 345
		SetGlobal("worldend",7)
		worldtimer=0
		system.Set("system/"..color.."/normal")
		local awayhp=109/92*7
		system.x=system.x-awayhp
		num1.x=num1.x-awayhp
		num2.x=num2.x-awayhp
		charahead.y = 71
		charatorso.y = 37
		charadead.Remove()
		deadbody=false
		SetGlobal("cursed",0)
	elseif GetGlobal("worldend")==7 then
	worldtimer=worldtimer+1
	fone1.sprite.alpha=1-(worldtimer-60)/90
	fone2.alpha=1-(worldtimer-60)/90
	if worldtimer==180 then
		SetGlobal("worldend",0)
		if wons==0 then
			enemies[1].SetVar("currentdialogue",{"[noskip]...","[noskip]Вот мы и снова \nздесь...","[noskip]...","[noskip][func:nohopeanger]Надеешься, что я \nсдамся только \nпотому, что ты \nбеспощадный \nманьяк-психопат?","[noskip][func:nohope2]Хе-хе... Надейся","[func:TakeKnife][func:Devil,night][func:nohopeanger][next]"})
			elseif wons==1 then
			enemies[1].SetVar("currentdialogue",{"[noskip]..."})
		end
		SetGlobal("charaisdead",0)
		wons=wons+1
		worldtimer=0
		prog=0
		State("ENEMYDIALOGUE")
	end
end
if not GetGlobal("MTT") then
	elseif GetGlobal("MTT")=="PROPOSAL" then
	mtt.sprite.Set("MTT/proposal")
	mtt.sprite.Scale(2,2)
	SetGlobal("MTT",false)
	elseif GetGlobal("MTT")=="ANGRY" then
	mtt.sprite.Set("MTT/angry")
	mtt.sprite.Scale(2,2)
	SetGlobal("MTT",false)
	elseif GetGlobal("MTT")=="SAW" then
	sawtime=sawtime+1
	if sawtime%3==0 then
		mtt.sprite.Set("MTT/saw"..(((sawtime/3)%2)+1))
	end
	mtt.sprite.Scale(2,2)
end
if not deathtimer then
	elseif deathtimer==true then
	if lives==1 then
		SetMusic("night")
		State("ACTIONSELECT")
		phone.Remove()
		else
		State("ENEMYDIALOGUE")
	end
	deathtimer=false
	elseif deathtimer<3 then
	if deathtimer==2 then
		link=CreateProjectile("empty",0,0)
		if GetGlobal("Betrayel")==false then
			wavetimer =1000
			for i=1,#blooddrop do
				blooddrop[i].Set("empty")
			end
			blooddrop={}
			blood.Set("empty")
			enemies[1].SetVar("dodge",true)
			enemies[2].SetVar("dodge",true)
			enemies[4].Call("Recharge")
			enemies[1].SetVar("weak",false)
			enemies[1].SetVar("def",30)
			enemies[1].SetVar("commands",{"ПРОВЕРИТЬ", "МОЛИТВА"})
			enemies[2].SetVar("commands",{"ПРОВЕРИТЬ", "МОЛИТВА"})
			SetGlobal("charaisdead",0)
			SetGlobal("cursed",0)
			Player_ATK=338
			charasoul.alpha=0
			charasoul.Set(currentspr.."/chara/chara_soul1")
			SetGlobal("curse",0)
			SetGlobal("burn",0)
			State("NONE")
			nextwaves ={"easy"}
			SetGlobal("evasion",0)
			SetGlobal("timing",false)
			enemies[1].SetVar("hp",1200)
			enemies[2].Call("SetActive",false)
			enemies[1].Call("SetActive",true)
	       		SetGlobal("pray",0)
			SetGlobal("facial_expression",23)
			Wounded(1201,1201,1201)
			if wons==1 then
				SetGlobal("facial_expression",6)
			end
			BackSprites(currentspr)
		end
		if currentspr=="1.2" then
			phone=CreateProjectile("system/lilo/phone",0,160-link.absy)
			else
			phone=CreateProjectile("system/black/phone",0,160-link.absy)
		end
		fdeath=CreateProjectileAbs("ut-heart",Placestompx,Placestompy)
		fdeath.sprite.color=Player.sprite.color
		deathfone=CreateProjectile("overworld/beforebattle",320,240)
		deathfone.sprite.alpha=1
		deathfone.sprite.SendToTop()
		fdeath.SendToTop()
		Player.MoveTo(0,0,true)
	end
	deathtimer=deathtimer+1
	elseif deathtimer<120 then
	deathtimer=deathtimer+1
	if deathtimer==45 then
		fdeath.sprite.Set("ut-heart-broken")
		Audio.PlaySound("heartbeatbreaker")
	end
	if deathtimer==90 then
		if not GetGlobal("Betrayel") or lives==0 then
			for i=1,6 do
				local piece = CreateProjectile("system/piece1",fdeath.x,fdeath.y)
				piece.SetVar("x",math.random(27)/3-5)
				piece.SetVar("y",(math.random(57)-9)/8)
				piece.SetVar("rot",math.random(20))
				table.insert(pieces,piece)
				piece.SetVar("rotation",math.random(20))
				piece.sprite.rotation=math.random(360)
				piece.sprite.color=fdeath.sprite.color
			end
			fdeath.Remove()
			Player.hp=92
			Audio.PlaySound("heartsplosion")
			else
			fdeath.sprite.Set("ut-heart")
			Audio.PlaySound("heartbeatbreaker")
			Player.hp=1
			system.Set("system/"..color.."/death"..lives-1)
			if lives==1 then
				maxHP=56
			end
		end
	end
	elseif deathtimer<150 then
	deathtimer=deathtimer+1
	elseif deathtimer<210 then
	deathtimer=deathtimer+1
	if lives>0 then
		deathfone.sprite.alpha=1-(deathtimer-150)/60
	end
	if fdeath.isactive then
		fdeath.sprite.alpha=1-(deathtimer-150)/60
	end
	elseif deathtimer==210 then
	if lives==0 then
		State("DONE")
	end
	if lives==1 then
		lives=0
	end
	deathtimer=true
end
for i=1,#pieces do
	local piece=pieces[i]
	if piece.isactive then
		if not timerp[i] then
			timerp[i]=0
			else timerp[i]=timerp[i]+1
		end
		if timerp[i]%piece.GetVar("rot")==0 then
			piece.sprite.Set("system/piece"..((timerp[i]/piece.GetVar("rot"))%4+1))
		end
		piece.Move(piece.GetVar("x"),piece.GetVar("y"))
		piece.SetVar("y",piece.GetVar("y")-0.1)
		piece.sprite.rotation=piece.sprite.rotation+piece.GetVar("rotation")
		if piece.absy<5 then
			piece.Remove()
		end
	end
end
		
if not GetGlobal("world") then
	else overworldface.sprite.Set(GetGlobal("world"))
	SetGlobal("world",false)
	overworldface.sprite.Scale(2,2)
end
if introinprogress==true then
	fPlayer.MoveTo(overworldfrisk.x,overworldfrisk.y)
end
num1.Set("system/"..color.."/number/"..(Player.hp/10 - Player.hp/10%1))
num2.Set("system/"..color.."/number/"..Player.hp%10)
if not GetGlobal("burn") then
	elseif GetGlobal("burn")>0 then
	local burn=GetGlobal("burn")
	br.Set("burn/1")
	burntime=burntime+1
	if burn>Player.hp-1 then
		SetGlobal("burn",Player.hp-1)
	end
	num1.color={1,0.5,0.15234375}
	num2.color={1,0.5,0.15234375}
	system.color={1,0.5,0.15234375}
	br.MoveTo(276+(109/92)*Player.hp-burn/184*109,70)
	br.Scale(burn*109/92,1)
 	if burntime%180==0 and burn-burn%1<3 then 
		Player.hp=Player.hp-1
		burntime=burntime-150
		SetGlobal("burn",burn-1)
		elseif burntime%(100/(burn-burn%1)-100/(burn-burn%1)%1)==0 then
		Player.hp=Player.hp-1
		burntime=burntime-(100/(burn-burn%1)-100/(burn-burn%1)%1)
		SetGlobal("burn",burn-1)
	end
	elseif GetGlobal("curse")==0 then
	num1.color={1,1,1}
	num2.color={1,1,1}
	if currentspr=="1.2" then
		system.Set("system/lilo/normal")
		else
		system.color={1,1,1}
	end
	burntime=0
	br.Set("burn/0")
end
if wavechange==false and sleep==true then
	nextwaves={"nonestatetwo"}
	wavachange=true
end
if knifereload>0 then	
	knifereload=knifereload-1
end
if healing==true then
	Player.Heal(5)
	healing=false
	elseif not healing then
	elseif healing<100 then
	healing=healing+1
	elseif healing==100 then
	healing=true
end
if knifestage==4 or knifestage==5 or knifestage==6 then
	if knifereload==238 then
		Audio.PlaySound("knife")
	end
	hpknifeone.y=hpknifeone.y+7.5
	if knifereload<10 then
		knifestage=10
		SetGlobal("charaisdead",12)
	end
	if hpknifeone.y>280 and knifestage==4 then
		knifestage=5
		sleep=false
		SetGlobal("ending",true)
		Audio.PlaySound("hit")
		SetGlobal("facial_expression",1)
		SetGlobal("hitted",charalegs.x)
	end
end
if GetGlobal("charaisdead")==12 then
		SetGlobal("charaisdead", 13)
		if quick==false then
			if lang=="rus" then
				enemies[1].SetVar("currentdialogue", rusout)
				elseif lang=="eng" then
				enemies[1].SetVar("currentdialogue", engout)
			end
			else
			enemies[1].SetVar("currentdialogue", {rusout[14]})
		end
		State("ENEMYDIALOGUE")
end
if Input.Confirm==1 and Player.absx>274 and Player.absx<387 and Player.absy<86 and Player.absy>54 and knifereload==0 and knifestage<4 then
	knifestage=knifestage+1
	if knifestage<4 then
		hpknifeone.rotation=knifestage*30
		knifereload=45
		else knifereload=240
	end
end
if Selecting  then
	if Input.Right==1 and Placex==2 then
		if page==1 and itemamount>4 then
			enemies[4].Call("Pager",2)
			elseif page==2 then
			if itemamount>8 then
				enemies[4].Call("Pager",3)
				else 
				enemies[4].Call("Pager",1)
			end
			elseif page==3 then
			enemies[4].Call("Pager",1)
		end
	end
	if Input.Left==1 and Placex==1 then
		if page==1 then
			if itemamount>8 then
				enemies[4].Call("Pager",3)
				elseif itemamount>4 then
				enemies[4].Call("Pager",2)
			end
			elseif page==2 then
			enemies[4].Call("Pager",1)
			elseif page==3 then
			enemies[4].Call("Pager",2)
		end
	end
	if itemamount>4 then
		pageblank.sprite.Set("system/page"..page)
	end
	if Player.absx==65 then
		Placex=1
	end
	if Player.absx==321 then
		Placex=2
	end
	if Player.absy==160 then
		Placey=1
	end
	if Player.absy==190 then
		Placey=2
	end
	if itemamount>4 then
		pageblank.sprite.Set("system/page"..page)
	end
	if Input.Cancel==1 then
		if itemamount>4 then
			pageblank.Remove()
		end
		Selecting=false
		enemies[4].Call("SetActive",false)
		if GetGlobal("evasion")==0 then
			enemies[1].Call("SetActive",true)
			else enemies[2].Call("SetActive",true)
		end
		State("ACTIONSELECT")
	end
	if Input.Confirm==1 then
		if itemamount>4 then
			pageblank.Remove()
		end
		Selecting=false
		useitem=true
	end
end
if not mercymenu then
	elseif mercymenu==true then
	State("ENEMYSELECT")
	if Input.Confirm==1 then
		enemies[3].Call("SetActive",false)
		HandleSpare()
		if systemfight==true then
			Fightmenu.Remove()
		end
		mercymenu=false
	end
	if Input.Cancel==1 then
		mercymenu=false
		if systemfight==true then
			Fightmenu.Remove()
		end
		enemies[3].Call("SetActive",false)
		if GetGlobal("evasion")==0 then
			enemies[1].Call("SetActive",true)
			else enemies[2].Call("SetActive",true)
		end
	end
end
if not GetGlobal("fightbegin") then
	elseif GetGlobal("fightbegin")==true then
	if not enctimer then
		SetGlobal("facial_expression",19)
		enctimer=0
		overworldface.Remove()
		SetMusic("none")
		introinprogress=false
		savex=fPlayer.x
		savey=fPlayer.y
		elseif enctimer==true then
		else
		enctimer=enctimer+1
		if enctimer<22 and enctimer%7==0 then
			if enctimer==7 or enctimer==21 then
				overworldfonebattle.sprite.alpha=1
				fPlayer.sprite.SendToTop()
				overworldfrisk.sprite.SendToBottom()
				overworldchara.sprite.SendToBottom()
				overworldfone1.sprite.SendToBottom()
				overworldfone2.SendToBottom()
				Audio.PlaySound("BeginBattle2")
				elseif enctimer==14 then
				overworldfonebattle.sprite.alpha=0
				fPlayer.sprite.SendToBottom()
				Audio.PlaySound("BeginBattle2")
				overworldfone1.sprite.SendToTop()
				overworldfone2.SendToTop()
				overworldfrisk.sprite.SendToTop()
				overworldchara.sprite.SendToTop()
			end
		end
		if enctimer==30 then
			overworldfone1.Remove()
			overworldfone2.Remove()
			overworldfrisk.Remove()
			overworldchara.Remove()
		end
		if enctimer==30 then
			Audio.PlaySound("BeginBattle3")
		end
		if enctimer>30 and enctimer<119 then
			fPlayer.sprite.SendToTop()
		end
		if enctimer>30 and enctimer<76 then
			fPlayer.MoveTo(savex*(75-enctimer)/45,savey*(75-enctimer)/45,true)
		end
		if enctimer>95 and enctimer<126 then
			overworldfonebattle.sprite.alpha=1*(115-enctimer)/30
		end
		if enctimer==130 then
				Player.MoveTo(fPlayer.x,fPlayer.y,true)
				fPlayer.Remove()
				enemies[5].Call("SetActive",false)
				enemies[1].Call("SetActive",true)
				local dial=""
				if lang=="rus" then
					dial={"[noskip][func:DUB,prolog/17][w:3]На [w:1]улице [w:1]такой \nзамечательный день.","[noskip][func:DUB,prolog/18][w:1]Я чувствую запах \nкрови, \nбурлящей в моих[w:3] \nвенах.","[noskip][func:DUB,prolog/19][w:1]И даже если все мои \n[w:1]близкие [w:2]мертвы[waitall:5]...","[noskip][func:DUB,prolog/20][w:1]Мне всё ещё [w:1]есть \n[w:1]за что бороться.","[func:Peachy][noskip][func:DUB,prolog/21][w:5]Знаешь,[w:20] [func:normal]я[w:5] сочинила \nдля тебя [w:1]стих.","[noskip][func:Peachy][func:DUB,prolog/22][w:1]Он [waitall:2]начинается [waitall:1][w:3]вот \nтак:","[noskip][waitall:2][func:DUB,prolog/23][w:1][waitall:1]Чу[w:1]де[w:1]сн[w:1]ый[w:1] де[w:1]нёк[w:1] \nпо[w:1]дх[w:1]од[w:1]ит[w:1] к[w:1] ко[w:1]нцу...","[noskip][func:DUB,prolog/24][waitall:2]И птички[waitall:1] [waitall:2]поют,[waitall:1][w:2]\n[waitall:2]им [waitall:1]ст[w:1]ра[w:1]х[w:2] не[w:1] к[w:1] лицу...","[noskip][func:DUB,prolog/25][w:5]И [w:2]чувс[w:1]твуя[w:1] си[w:1]лу[w:1],\nч[w:1]то[w:1] тв[w:1]ое[w:1]й [w:1]не[w:1] б[w:1]ыл[w:1]а...","[noskip][func:TakeKnife][func:head][effect:none][novoice][waitall:3][color:ff0000][func:DUB,prolog/26][w:4][waitall:1]СЕЙ[w:1]ЧАС[w:1] [waitall:1]ВЫ[w:1]ПЬЕ[w:1]ШЬ \n[waitall:2]ЧАШУ ИЗ БОЛИ\nДО [waitall:4][func:Devil,night]ДНА![w:10][next]"}
					if quick==true then
						dial={"[noskip][func:TakeKnife][func:head][effect:none][novoice][waitall:5]ДО [color:ff0000][func:Devil,night]ДНА![w:10][next]"}
					end
					elseif lang=="eng" then
					if quick==true then
						dial={"[noskip][func:TakeKnife][func:head][effect:none][novoice][waitall:5]ДО [color:ff0000][func:Devil,night]ДНА![w:10][next]"}
						else
						dial={"[noskip]It is such a vivid \nday today.","[noskip]I smell scent of my\nboiling blood.","[noskip]And even if all my \npals are gone[waitall:5]...","[noskip]I still have a reason\nto conquer.","[func:Peachy][noskip]Almost forgot,[w:15] [func:normal]i made \na poem for you.","[noskip][func:Peachy]It begins like \nthis:","[noskip][waitall:2]A magnificent day \ncomes to its end...","[noskip][waitall:2]Birds are still singing,\nignoring the threat...","[noskip][waitall:2]And feeling the \npower, that`s\nnot even yours...","[noskip][func:TakeKnife][func:head][effect:none][novoice][waitall:3][color:ff0000]BE READY TO SUFFER \nFOR EACH YOUR\nAB[func:Devil,night]USE![w:10][next]"}
					end
				end
				dial=EveryDial(dial,"[effect:twitch,1][noskip]")
				enemies[1].SetVar("currentdialogue",dial)
				State("ENEMYDIALOGUE")
				fPlayer.Remove()
				SetGlobal("fightbegin",false)
		end
	end
end
if GetGlobal("CHECKED") and Input.Confirm==2 then
	State("ACTIONSELECT")
	SetGlobal("CHECKED",false)
end
if prog==23 or ( prog==5 and wons==1) or wons==2 then
	enemies[1].SetVar("dodge",false)
end
if GetGlobal("charaisdead")==9 and sleep==true then
	SetGlobal("charaisdead",10)
	useknife=CreateProjectile("system/useknife",0,0)
end
if not GetGlobal("charaisdead") then
	elseif GetGlobal("charaisdead")<7 then
	hppoint.x=276+(109/maxHP)*Player.hp/2
	hppoint.Scale(Player.hp*109/maxHP,1)	
	br.SendToTop()
	cr.SendToTop()
	if Player.hp>maxHP then
		Player.hp=maxHP
	end
	hpbar.SendToTop()
	elseif GetGlobal("charaisdead")==7 then
	hppoint.alpha=1
	hpbar.alpha=1
	if hpknife==false then
		blanket=CreateSprite("system/"..color.."/endhpblanket")
		blanket.x=330.5
		blanket.y=70
		hpknife=true
		hpknifeone=CreateSprite("system/endhpbar")
		hpknifeone.x=330.5
		hpknifeone.y=70
		hpknifeone.SendToTop()
	end
end
if GetGlobal("phase1")==1 then
		local face=overworldface
	if not introtimer then
		introtimer=0 
		overworldfrisk.sprite.Set("overworld/friskstep")
		overworldfrisk.sprite.Scale(2,2)
		overworldface.sprite.alpha=0
		elseif introtimer==true then
		else introtimer=introtimer+1
		if introtimer<21 then
			overworldfrisk.Move(2,0)
		end
		if introtimer==21 then
			overworldfrisk.sprite.Set("overworld/frisk")
			overworldfrisk.sprite.Scale(2,2)
		end
		if introtimer==80 then
			local dial=""
			if lang=="rus" then
				dial={"[next]","[func:face,yes][font:overworld][effect:twitch,1][func:NoMercy1][color:ffffff][func:DUB,prolog/9]*[waitall:5]...[waitall:3] Ясно.", "[func:DUB,prolog/10][w:4]*[effect:twitch,1][waitall:2]Хех[waitall:5]...[waitall:1][w:3]\n[func:Danger]Даже смешно [waitall:2]отчасти.", "[func:NoMercy1][waitall:5]...","[func:DUB,prolog/11][w:3]*Я не буду утруждать \nсебя [w:1]раз[w:1]ъяс[w:1]нен[w:1]ия[w:1]ми[waitall:1] терминов.","[noskip][func:DUB,prolog/12][w:6][waitall:1]*На [w:2]самом [w:2]деле,[w:10] ты и \nтак [w:1]их знаешь[waitall:5]...[waitall:1]\n[w:12][func:Danger1][waitall:1]Не [w:1]так [w:1]ли?=)[w:50][func:ph2][func:face,no][next]"}
				elseif lang=="eng" then
				dial={"[next]","[func:face,yes][font:overworld][effect:twitch,1][func:NoMercy1][color:ffffff]*...[w:15] I see.", "[effect:twitch,1]*Heh[waitall:5]...[waitall:1][w:30]\n[func:Danger]It`s funny in a way.", "[func:NoMercy1][waitall:5]...","*I won`t bother myself with\nteaching you manners.","[noskip]*In fact,[w:5] you already\nknow them[waitall:5]...[waitall:1]\n[w:20][func:Danger1]Don`t you?=)[w:50][func:ph2][func:face,no][next]"}
			end
			dial=EveryDial(dial,"[font:overworld][effect:twitch,1][color:ffffff]")
			enemies[5].SetVar("currentdialogue",dial)
			SetGlobal("phase1", 0)
			introtimer=true
			State("ENEMYDIALOGUE")
		end
	end
end
if GetGlobal("phase1")==2 then
	local face=overworldface
	if introtimer==true then
		introtimer=0
		overworldfrisk.sprite.Set("overworld/friskstep")
		overworldfrisk.sprite.Scale(2,2)
		overworldface.sprite.alpha=0
		elseif introtimer==false then
		else introtimer=introtimer+1
		if introtimer<21 then
			overworldfrisk.Move(2,0)
		end
		if introtimer==21 then
			overworldfrisk.sprite.Set("overworld/frisk")
			overworldfrisk.sprite.Scale(2,2)
		end
		if introtimer==80 then
			local dial=""
			if lang=="rus" then
				dial={"[func:face,yes][next]","[effect:twitch,1][font:overworld][color:ffffff][func:NoMercy1][func:DUB,prolog/13][w:10]*вздох*","[func:NoMercy1][func:DUB,prolog/14][w:9]*Вечно тянуть момент \nневозможно.","[func:DUB,prolog/15][w:3]*И раз [w:1]мой мир обречён \n[w:2]опять [w:2]исчезнуть[waitall:5]...","[func:NoMercy1][func:DUB,prolog/16][w:2]*Я хотя бы попробую \nзаставить исчезнуть [w:5]\n[color:ff0000][waitall:2]тебя[color:ffffff].","[func:fightbegin][func:face,no][next]"}
				elseif lang=="eng" then
				dial={"[func:face,yes][next]","[effect:twitch,1][font:overworld][color:ffffff][func:NoMercy1]*sigh*","[func:NoMercy1]*Nothing can last \nforever.","*And if my world is \ndestined to fade away[waitall:5]...","[func:NoMercy1]*Then i will at least try\n to fade [color:ff0000]you [color:ffffff]away.","[func:fightbegin][func:face,no][next]"}
			end
			dial=EveryDial(dial,"[font:overworld][effect:twitch,1][color:ffffff]")
			enemies[5].SetVar("currentdialogue",dial)
			SetGlobal("phase1",0)
			State("ENEMYDIALOGUE")
		end
	end
end
if not GetGlobal("curse") then
	elseif GetGlobal("curse")>0 then
	if GetGlobal("curse")>Player.hp then
		SetGlobal("curse",Player.hp)
	end
	cr.Scale(GetGlobal("curse")*109/92,1)
	cr.alpha=1
	if currentspr=="1.2" then
		system.Set("system/lilo/crhp")
		else
	      	system.color = {123/256,0,27/256}
	end
       	num1.color = {123/256,0,27/256}
       	num2.color = {123/256,0,27/256}
	cr.MoveTo(276+(109/92)*Player.hp-GetGlobal("curse")/184*109,70)
	elseif GetGlobal("curse")==0 and GetGlobal("burn")==0 then
        system.color = {1,1,1}
        num1.color = {1,1,1}
        num2.color = {1,1,1}
	cr.alpha=0
end
if not GetGlobal("cursed") then
	else curse.alpha=GetGlobal("cursed")
	SetGlobal("cursed",false)
end
curse.y=70+4*math.sin(alltimer*math.pi/30)
	alltimer = alltimer+1 --да, мы долго к этому шли
if GetGlobal("judge") then
	if GetGlobal("curse")==Player.hp then
		if not timer1 then
			State("NONE")
			timer1=0
			placestompx=Player.x
			healthstomp=Player.hp
			else timer1=timer1+1
		end
		Player.MoveTo(placestompx+(1+timer1/18)*math.sin(timer1*math.pi/6),Player.y,true)
		if timer1%12==0 then
			Audio.PlaySound("hurtsound")
		end
		if timer1%6==0 then
			if math.floor(healthstomp*(180-timer1)/180)>0 then
				Player.hp=math.floor(healthstomp*(180-timer1)/180)
				else Player.hp=92
				judge=false
				SetGlobal("curse",0)
				SetGlobal("Playerisdead",true)
			end
		end
		elseif GetGlobal("curse")>0 then
		if not timer1 then
			timer1=0
			else timer1=timer1+1
		end
		if timer1>40 then
			SetGlobal("curse",0)	
			timer1=false
			SetGlobal("judge",false)
			else cr.alpha=1-0.025*timer1
		end
		else SetGlobal("judge",false)
	end
end
	if(Player.absy == 25) then -- Сердечко игрока в нижнем ряду с кнопками.\
		fightstage = 0
		if systemfight==true then
			RedoBut()
		end
		if(Player.absx == 48) then -- FIGHT
			lastbutton = 1
			SetGlobal("button",1)
			if mercypoint==1 then
				Player.MoveTo(Player.x-3,Player.y,true)
			end
		elseif(Player.absx == 202) then -- ACT  154 149 154
			lastbutton = 2
			SetGlobal("button",2)
			if mercypoint==2 then
				Player.MoveTo(Player.x-3,Player.y,true)
			end
		elseif(Player.absx == 361) then -- ITEM
			lastbutton = 3
			SetGlobal("button",3)
			if mercypoint==3 then
				Player.MoveTo(Player.x-3,Player.y,true)
			end
		elseif(Player.absx == 515) then -- MERCY
			lastbutton = 4
			if systemfight==false then
				Player.MoveTo(Player.x-3,Player.y,true)
			end
			if mercypoint==4 then
				Player.MoveTo(Player.x-3,Player.y,true)
			end
			SetGlobal("button",2)
		end
		if lastbutton==3 and Input.Confirm==1 and enemies[4].GetVar("used")==false and systemfight==false and (GetGlobal("charaisdead")<2 or wons>0) then
			page=1
			enemies[4].Call("Firstpage")
			enemies[1].Call("SetActive",false)
			enemies[2].Call("SetActive",false)
			enemies[4].Call("SetActive",true)
			Selecting=true
			if itemamount>4 then
				pageblank=CreateProjectile("system/page1",0,0)
			end
			State("ACTMENU")
		end
		RedoBut(lastbutton)
	elseif(Player.absx == 65 and Player.absy == 190 and lastbutton == 1 and fighstage ~= -1) then  -- Выбрали FIGHT, но Чара ещё не уклоняется.
		if(fightstage == 0) then
			fightstage = 1
		else
			if(Input.Confirm == 1) then
				fightstage = fightstage + 1
			end
		end
	end
	AnimateChara()
	if Input.Menu == 1 and currentspr=="1.1.7" then	 
	ColorSwitch()
	WriteSavio()
	if MyState=="Sprites!" then
		lanans.sprite.Set(currentspr.."/show"..clmd)
	end
	end
if fighting==true then
	fighttimer=fighttimer+1
	if misstime==1 then
		local miss=CreateProjectileAbs("system/MISS",centerlegs+charalegs.x,120)
		table.insert(damages,miss)
	end
	if slashtime==2  then
		slash=CreateProjectile("system/attacks/slash0",charalegs.x-320+centerlegs,150)
		slash.sprite.Scale(1.5,1.5)
		if Player_ATK==338 then
			Audio.PlaySound("slice")
			slash.sprite.rotation=-31+math.random(61)
			elseif Player_ATK==38 then
			slash.sprite.rotation=-61+math.random(121)
			Audio.PlaySound("slice2")
		end
		if truedamage==1 then
			slash.sprite.rotation=30
		end
		if pointer.x>0 then
			firstdamage=Player_ATK*((273- pointer.x)/273)-3+math.random(5)
			else firstdamage=Player_ATK*((273 + pointer.x)/273)-3+math.random(5)
		end
		firstdamage=firstdamage-firstdamage%1
		if pointer.x>-fightspeed-1 and pointer.x<fightspeed+1 then
			firstdamage=math.floor(Player_ATK*5/4-math.random(math.random(math.floor(Player_ATK/8))))
			pointer.sprite.color={1,177/255,0}
		end
		enddamage=firstdamage-enemies[1].GetVar("def")-3+math.random(5)
		if enemies[1].GetVar("dodge")==true or enemies[1].GetVar("block")==true then
			enddamage=0
		end
		if truedamage==false then
			else enddamage=truedamage
			truedamage=true
		end
		if enddamage<0 then	
			enddamage=0
		end
		calcdamage=enddamage
		numbers=0
		if calcdamage>0 then
			while(calcdamage>0) do
				calcdamage=(calcdamage/10-(calcdamage/10)%1)
				numbers=numbers+1
			end
		end
		calcdamage=enddamage
	end
	if slashtime==70 then
		if  enddamage>0  then
			if truedamage==false and Player_ATK<50 then
				Player.Heal(enddamage)
			end
			local numberofblood=0
			local dam=enddamage
			while (dam>0 and numberofblood<50) do
				numberofblood=numberofblood+1
				dam=dam-2*numberofblood
			end
			truedamage=false
			dam=enddamage
			for i=1,numbers do
				local number=CreateProjectileAbs("system/damage/"..enddamage%10,19.5+numbers*14.5-29*i+centerlegs+charalegs.x,140)
				enddamage=(enddamage/10-(enddamage/10)%1)
				number.sprite.SendToTop()
				number.sprite.color={1,0,0}
				table.insert(damages,number)
			end
			blooddrop={}
			for i=1,numberofblood do
				local b=#blooddrop+1
				if #blooddrop+1>#bloodforever then
					local blood=CreateSprite("empty","BelowArena")
					bloodforever[b]=blood
				end
				if b==0 then
					else
					bloodforever[b].Set("blood")
					if dam==1 and enemies[1].GetVar("hp")==1200 then
						bloodforever[b].x=charatorso.x+charalegs.x+woundx+charahead.x+firstbloodx+EvadeSpeed(evadelevel)*math.sin(legshift/2+0.5*math.pi)*2
						bloodforever[b].y=charatorso.y+charalegs.y+charahead.y+firstbloody
						else
						bloodforever[b].x=charatorso.x+charalegs.x+woundx+(math.random(woundrandx)-woundrandx/2)
						bloodforever[b].y=charatorso.y+charalegs.y+woundy+(math.random(woundrandy)-woundrandy/2)
					end
					bloodforever[b].SetVar("done",false)
					bloodforever[b].SetVar("time",0)
					local speed=1+0.125*(math.random(25)-1)
					local ugol=-70+math.random(250)
					if dam==1 and enemies[1].GetVar("hp")==1200 then
						bloodforever[b].SetVar("speedx",speed*math.cos(ugol*math.pi/180)+EvadeSpeed(evadelevel)*math.sin(legshift/2+0.5*math.pi))
						else
						bloodforever[b].SetVar("speedx",speed*math.cos(ugol*math.pi/180))
					end
					bloodforever[b].SetVar("speedy",speed*math.sin(ugol*math.pi/180))
					bloodforever[b].alpha=0.8
					bloodforever[b].Scale(2+2*math.random(4),2+2*math.random(4))
					table.insert(blooddrop,bloodforever[b])
				end
			end
			Audio.PlaySound("hit")
			SetGlobal("hitted",charalegs.x)
			elseif enemies[1].GetVar("dodge")==true then
			local number=CreateProjectileAbs("system/MISS",centerlegs+charalegs.x,140)
			table.insert(damages,number)
			elseif enddamage<1 or enemies[1].GetVar("block")==true then
			local number=CreateProjectileAbs("system/BLOCK",centerlegs+charalegs.x,140)
			table.insert(damages,number)
			Audio.PlaySound("hit")
			SetGlobal("hitted",charalegs.x)
			
		end
	end
	if (slashtime%10)==0 and slashtime>0 and slashtime<61 and Player_ATK==338 then
		slash.sprite.Set("system/attacks/slash"..slashtime/10)
	end
	if slashtime%5==0 and slashtime>0 and slashtime<31 and Player_ATK==38 then
		slash.sprite.Set("system/attacks/slash"..(slashtime)/5)
		if slashtime==30 then
			slashtime=60
		end
	end
	if slashtime%20==0 and slashtime>0 then
		pointer.sprite.Set("system/pointer1")
		elseif slashtime>0 and slashtime%20==10 then
		pointer.sprite.Set("system/pointer")
	end
	if slashtime==20  then
		firsthp=enemies[1].GetVar("hp")
		endhp=firsthp-enddamage
		if endhp<0 then
			endhp=0
		end
	end
	if slashtime>70 and slashtime<152  then
		enemies[1].SetVar("hp",firsthp*((151-slashtime)/80)+endhp*(slashtime-71)/80)
		enemies[2].SetVar("hp",endhp)
		Wounded(enemies[1].GetVar("hp"),firsthp,endhp)
	end
	if slashtime>0 and slashtime<172 then
		enemyhp.x=-81+81/1200*enemies[1].GetVar("hp")+2*distance2*math.sin(timestamp2*math.pi/6)+centerlegs+charalegs.x
		enemynohp.SendToTop()
		enemyhp.SendToTop()
		enemyhp.Scale(162*(enemies[1].GetVar("hp"))/1200,1)
		enemynohp.x=2*distance2*math.sin(timestamp2*math.pi/6)+centerlegs+charalegs.x
		if slashtime<21 then
			local alp=math.sin(math.pi*slashtime/40)
			enemyhp.alpha=alp
			enemynohp.alpha=alp
		end
		if slashtime>150 then
			local alp=math.sin(math.pi*(slashtime-130)/40)
			enemyhp.alpha=alp
			enemynohp.alpha=alp
		end
	end
	if slashtime>0 then
		slashtime=slashtime+1
	end
	if misstime>0 then
		misstime=misstime+1
	end
	if fighttimer==1 then
		if GetGlobal("evasion")==0 then
			numbers=0
			target=1
			notarget=2
			else
			numbers=0
			target=2
			notarget=1
		end
		if prog>22 or (prog==5 and wons==1) then
			target=1
			notarget=2
			slash_x=5
		end
		fightspeed=5+math.random(3)
		targeting=CreateProjectile("system/target",0,0)
		pointer=CreateProjectile("system/pointer",279,0)
	end
	if pointer.isactive and pointer.x>-fightspeed-1 and pointer.x<fightspeed+1 and slashtime==0 and systemfight==true then
		pointer.MoveTo(0,0)
		slashtime=1
	end
	if pointer.isactive and slashtime==0 then
		pointer.Move(-fightspeed,0)
	end
	if Input.Confirm==1 and fighttimer>1 and slashtime==0 and misstime==0 and systemfight==false then
		slashtime=1
	end
	if TimeEvade(slashtime)==true then
		SetGlobal("evasion",GetGlobal("evasion")+1)
	end
	if pointer.x<-273 and pointer.isactive then
		if misstime==0 then
			misstime=1
		end
		fightspeed=0
		pointer.Remove()
	end
	if slashtime==185 or misstime==2 then
		if slashtime==185 then
			prog=prog+1
			attacked=true 
			SetGlobal("progress",prog)
			if (prog<24 and wons==0) or (wons==1 and prog<6) then
				enemies[notarget].Call("SetActive",true)
				enemies[target].Call("SetActive",false)
				enemies[notarget].Call("HandleAttack")
				elseif ( prog==24 and wons==0 ) or ( wons==1 and prog==6 ) then
				enemies[1].Call("SetActive",true)
				enemies[2].Call("SetActive",false)
				enemies[1].Call("HandleAttack")
				else
				enemies[target].Call("HandleAttack")
			end
			if wons==1 and prog==5 then
				SetGlobal("facial_expression", 31)
			end
			if wons==2 then
				enemies[1].Call("HandleAttack")
			end
		end
		if evadelevel==5 then
			truedamage=1
		end
		fighting=false
		fighttimer=0
		fightspeed=0
		slashtime=0
		misstime=0
		numbers=0
	end
end
for i=1,#damages do
	local number=damages[i]
	if number.isactive then
		if not timing1[i] then
			timing1[i]=1
			else timing1[i]=timing1[i]+1
		end
		if timing1[i]==90 then
			fighttim=0
		end
		number.MoveTo(number.x,120+75*math.sin(timing1[i]*math.pi/100))
		if timing1[i]==110 then
			number.Remove()
		end
	end
end
if #blooddrop>0 then
	local counter=0
	for i=1,#blooddrop do
		local b=blooddrop[i]
		if b.GetVar("done")==false then
			b.SendToTop()
			local x=b.GetVar("speedx")
			local y=b.GetVar("speedy")-0.15
			local time=b.GetVar("time")+1
			b.SetVar("speedy",y)
			if y>-6000 then
				b.x=b.x+x
				b.y=b.y+y
			end
			if (b.y-0.5*b.yscale)<246 and y>-6000 then
				b.SetVar("speedy",-6000)
				b.SetVar("sy",b.yscale)
				b.SetVar("sx",b.xscale)
				b.SetVar("size",b.xscale*b.yscale)
				b.y=244+b.yscale/2
			end
			if b.GetVar("speedy")<-6000 then
				if b.yscale>2 then
					local sy=b.yscale-(b.yscale-2)/4
					if sy<2.5 then
						sy=2
					end
					local size=b.yscale*b.xscale
					local sx=size/sy
					b.Scale(sx,sy)
					b.y=244+b.yscale/2
					b.SetVar("sx",sx)
					b.SetVar("sy",sy)
					b.SetVar("firstsx",sx)
					else
					local sx=b.GetVar("sx")
					local newsx=sx+(1+math.sqrt(b.alpha))*b.GetVar("firstsx")/16
					local newsize=newsx*2
					local size=b.GetVar("size")
					local newalpha=0.8*size/newsize
					b.Scale(newsx,2)
					b.SetVar("sx",newsx)
					b.alpha=newalpha
					if newalpha<0.05 then
						b.SetVar("done",true)
					end
				end
			end
					
			elseif i==#blooddrop then
			counter=counter+1
		end
	end
	if counter==#blooddrop then
		blooddrop={}
	end
end
if #PlayerBloodDrop>0 then
	local counter=0
	for i=1,#PlayerBloodDrop do
		local b=PlayerBloodDrop[i]
		local time=b.GetVar("time")+1
		if time<182 then
			b.SendToTop()
			b.SetVar("time",time)
			local speedy=b.GetVar("speedy")-0.05
			b.SetVar("speedy",speedy)
			b.y=b.y+speedy
			local speedx=b.GetVar("speedx")
			b.x=b.x+speedx
			if time<165 then
				elseif time<181 then
				b.alpha=1-math.sin((time-165)*math.pi/30)
				elseif time==181 then
				b.Set("empty")
			end
			else
			counter=counter+1
		end
	end
	if counter==#PlayerBloodDrop then
		PlayerBloodDrop={}
	end
end




end

function HandleSpare()
	local health = enemies[1].GetVar("hp")
	local bleeding = health -40
	if prog >23 and wons==0  then
		BattleDialog({"Ты зашёл слишком далеко...\nЭто точка невозврата"})
		elseif wons==0 then
		SetMusic("none")
		if GetGlobal("evasion")==0 then
			number=1
			else
			number=2
		end
		mercy=mercy+1
		enemies[number].Call("SetActive",true)
		if mercy==1 then
			enemies[number].SetVar("currentdialogue", {"[effect:none][noskip][func:Suprise1]Ты щадишь меня?", "[func:NoMercy1][effect:none][noskip]Хех ...[w:10][next]","[effect:none][func:Bad][noskip]Ты что , \nправда думаешь ...", "[effect:none][waitall:3][noskip][func:NoMercy2]что обманешь меня \nтак просто !?[w:10][next]"})
			nextwaves = {"pisdez"}
			elseif mercy==2 then
			enemies[number].SetVar("currentdialogue", {"[effect:none][noskip][func:Suprise1]Снова ?",  "[func:NoMercy1][effect:none][noskip][func:Suprise2]Хех ...[w:10][next]","[effect:none][noskip][func:Bad]Мы оба знаем ,\nчто будет после \nэтого...", "[effect:none][noskip][func:NoMercy1]Ты предашь меня...","[effect:none][waitall:3][noskip][func:NoMercy2]Как и моего \nбрата .[w:10][next]"})
			nextwaves = {"pisdez"}
			elseif mercy==3 then
			enemies[number].SetVar("currentdialogue", {"[effect:none][noskip][func:Suprise1]Снова ?", "[effect:none][noskip][func:head4]. . .[w:10][next]","[effect:none][noskip]Не делай вид , \nчто ты жалеешь о \nсделанном. ", "[effect:none][noskip]В конце концов...", "[func:NoMercy2][effect:none][noskip]Мы оба знаем, \nчто люди \nне умеют жалеть."})
			--enemies[number].SetVar("currentdialogue", {"[effect:none][noskip][func:Suprise1]Снова ?"})
			nextwaves = {"pisdez"}
			elseif mercy==4 then
			enemies[number].SetVar("currentdialogue", {"[effect:none][noskip][func:Suprise1]...","[effect:none][noskip][func:head4]...", "[effect:none][noskip][func:head4]Что такое, фриск?[w:20]\nПосле всего этого \nвдруг.[w:4].[w:4].[w:14]\nпочувствовала \nрасскаяние?","[effect:none][noskip][waitall:5]...[waitall:1]", "[effect:none][noskip]Послушай[waitall:5]...[waitall:1]", "[effect:none][noskip]Ты же знаешь, \nчто мне не нужно \nвсё это.[w:10] Я \nпросто хочу вернуть \nсвою[waitall:5]...[waitall:1][w:10] свою семью.","[effect:none][noskip]И,[w:10] если ты хочешь \nисправить всё[waitall:5]...[waitall:1]","[effect:none][noskip][func:mercy]Я могу дать \nтебе этот шанс.","[effect:none][noskip]Шанс [waitall:3]исправить [waitall:6]ВСЁ.","[effect:none][noskip]С моешь помощью \nты перезапустишь \nтаймлайн.","[effect:none][noskip]Сделаешь \n[waitall:3]ИСТИННЫЙ \nПЕРЕЗАПУСК[","[effect:none][noskip][func:Peachy]...","[effect:none][noskip]Наверное, \nя зря тебе доверяю, \nно[waitall:5]...[waitall:1]","[func:head4][effect:none][noskip]Я устала от всего \nэтого"})
			nextwaves = {"transform"}
			enemies[3].SetVar("name","[starcolor:ffff00][color:ffff00]ИСТИННЫЙ ПЕРЕЗАПУСК")
			
			elseif mercy==6 then
			enemies[number].SetVar("currentdialogue", {"[effect:none][noskip][func:HAPPY][func:Suprise1]Ты.[w:10].[w:10].[w:20] Правда.[w:10].[w:10].[w:20][func:nohope2][next]","[noskip].[w:10].[w:10].[w:20][func:happycry]Спасибо.[w:10].[w:10].[w:40][next]"})
			nextwaves={"HappyEnd"}
			wavetimer=99999999999999999999999999
		end
		State("ENEMYDIALOGUE")
		elseif wons==1 then
		mercy=mercy+1
		if GetGlobal("evasion")==0 then
			number=1
			else
			number=2
		end
		enemies[number].Call("SetActive",true)
		if mercy==1 then
			SetMusic("none")
			enemies[number].SetVar("currentdialogue", {"[effect:none][noskip][func:Suprise1]Что? [w:20]Пощада?", "[func:NoMercy1][effect:none][noskip]Ты [waitall:3]ЩАДИШЬ\nменя?","[effect:none][func:Bad][noskip]Хех[waitall:5]...[waitall:1] \nТебе не говорили[waitall:5]...", "[func:BackMusic][effect:none][waitall:3][noskip][func:NoMercy2]Что у тебя больное \nчувство юмора?[w:10]"})
			elseif mercy==2 then
			enemies[number].SetVar("currentdialogue", {"[effect:none][noskip][func:Suprise1]Да ладно тебе.", "[func:NoMercy1][effect:none][noskip]Не делай вид, что \nжалеешь о чём либо.","[effect:none][func:Bad][noskip]Ты могла прекратить \nэто всё в любой \nмомент."})
			elseif mercy==3 then
			enemies[number].SetVar("currentdialogue", {"[effect:none][noskip][func:Suprise1]В любой момент ты\nмогла бы \nПЕРЕЗАПУСТИТЬ мир[waitall:5]...", "[func:NoMercy1][effect:none][noskip]Но зачем это \nделать, если можно \nповеселиться?[w:30]\n[color:ff0000]Да, Фриск?"})
			elseif mercy==4 then
			enemies[number].SetVar("currentdialogue", {"[effect:none][noskip][func:Suprise1]Так зачем?[w:20]\n[waitall:3]ЗАЧЕМ [waitall:2]ты меня\nщадишь?", "[func:NoMercy1][effect:none][noskip]Это такая издёвка? \nПоманить желанной \nмечтой...","[noskip][effect:none]Чтобы разбить её \nпрямо у меня \nна глазах?"})
			elseif mercy==5 then
			enemies[number].SetVar("currentdialogue", {"[effect:none][noskip][func:Suprise1][waitall:2]Не думай, что я \nкуплюсь на твой \nобман.", '[func:NoMercy1][effect:none][noskip][color:ff0000][novoice][voice:Flowey]Я прекрасно знаю, \nкак [waitall:3]"честны"[waitall:1] люди. '})
		end
		State("ENEMYDIALOGUE")
	end
end

function HandleItem(ItemID)
    BattleDialog({"Вы выбрали " .. ItemID .. "...\nНо он бесполезен."})
end
function RemoveAttacking()
		pointer.Remove()
		targeting.Remove()
end
	
function TimeEvade(time)
	local timing=-10
	if evadelevel==1 then
		timing=10
		elseif evadelevel==2 then
		timing=20
		elseif evadelevel==3 then
		timing=30
		elseif evadelevel==4 then
		timing=40
		elseif evadelevel==5 then
		timing=50
	end
	local output=false
	if timing==time then
		output=true
	end
	return output
end

function PlayerHurted(damage)
	local back=WideHP(Player.hp)
	local part1=back[1]
	local part2=back[2]
	local twice=true
	if part2[1]==100 and part2[2]==100 then
		twice=false
	end
	local maxy=damage
	if maxy>40 then
		maxy=40
	end
	--[[for i=1,maxy do
		local px=hpbar.x-109/2+Player.hp*109/92
		local py=0
		if twice==true then
			local dist1=(part1[2]-part1[1])
			local dist2=(part2[2]-part2[1])
			py=math.random(dist1+dist2)
			if py>dist2 then
				py=part1[1]+math.random(part1[2])
				else
				py=part2[1]+math.random(part2[2])
			end
			else
			py=part1[1]+math.random(part1[2])
		end
		py=py+hpbar.y
		local blood=playerblood[playerbloodnumber]
		blood.x=px
		blood.y=py
		blood.Set("blood")
		blood.Scale(2,1+2*math.random(2))
		local speed=(2+2*math.random(3))/8
		local angle=155+5*math.random(9)
		blood.SetVar("speed",speed)
		blood.SetVar("angle",angle)
		blood.SetVar("time",0)
		blood.SetVar("working",true)
		blood.alpha=1
		table.insert(PlayerBloodDrop,blood)
		playerbloodnumber=playerbloodnumber+1
		if playerbloodnumber>100 then
			playerbloodnumber=1
		end
	end]]
	local px=hpbar.x-109/2+Player.hp*109/92+2
	local py=0
	if twice==true then
		local b=playerblood[playerbloodnumber]
		local dist2=(part2[2]-part2[1])
		b.Set("blood")
		b.x=px
		b.y=(part2[2]+part2[1])/2+hpbar.y
		b.Scale(damage+2,dist2/3*2)
		StabBlood(b)
		b.SetVar("speedy",1.5)
		b.SetVar("speedx",(math.random(8))/10)
		b.SetVar("time",0)
		b.alpha=1
		table.insert(PlayerBloodDrop,b)
		playerbloodnumber=playerbloodnumber+1
		if playerbloodnumber>100 then
			playerbloodnumber=1
		end
	end
	py=py+hpbar.y+(part1[2]+part1[1])/2
	local blood=playerblood[playerbloodnumber]
	blood.x=px
	blood.y=py
	blood.Set("blood")
	blood.Scale(damage+2,(part1[2]-part1[1])/3*2)
	StabBlood(blood)
	local speed=0.5
	blood.SetVar("speedy",1.5)
	blood.SetVar("speedx",(math.random(8))/10)
	blood.SetVar("time",0)
	blood.alpha=1
	table.insert(PlayerBloodDrop,blood)
	playerbloodnumber=playerbloodnumber+1
	if playerbloodnumber>100 then
		playerbloodnumber=1
	end
end

function WideHP(point)
	local outgo={0,0}
	local max1=0
	local max2=0
	local min1=0
	local min2=0
	local ingo=(point/92*109)
	if ingo%1>0 then
		ingo=ingo+1-ingo%1
	end
	--for max1
	if (ingo>42 and ingo<109) or (ingo>1 and ingo<27) then
		max1=6.5
		elseif (ingo==1) or (ingo>33 and ingo<43) then
		max1=5.5
		elseif ingo==33 then
		max1=4.5
		elseif (ingo>26 and ingo<33) then
		max1=-4.5+(ingo-26)
	end
	--for max2
	if (ingo<27 and ingo>20) then
		max1=-4.5+(ingo-26)
		else
		max2=100
	end
	--for min1
	if ingo==109 then
		min1=5.5
		elseif ingo<109 and ingo>106 then
		min1=4.5
		elseif ingo<107 and ingo>104 then
		min1=3.5
		elseif ingo<105 and ingo>92 then
		min1=2.5-math.floor((107-ingo)/3)
		elseif ingo<93 and ingo>80 then
		min1=-0.5-math.floor((96-ingo)/4)
		elseif ingo<81 and ingo>70 then
		min1=-3.5-math.floor((85-ingo)/5)
		elseif ingo<71 and ingo>62 then
		min1=-6.5
		elseif ingo<63 and ingo>26 then
		min1=-7.5
		elseif ingo==26 then
		min1=6.5
		elseif ingo==25 then
		min1=5.5
		elseif ingo==24 then
		min1=3.5
		elseif ingo==23 or ingo<4 then
		min1=2.5
		elseif ingo<23 and ingo>3 then
		min1=1.5
	end
	if ingo>20 and ingo<27 then
		min2=-7.5
		else
		min2=100
	end
	outgo={{min1,max1},{min2,max2}}
	return outgo
end

function StabBlood(ingo)
	local sx=ingo.xscale
	local sy=ingo.yscale
	if sx>15 then
		sx=15
	end
	if sy>sx*2 then
		sy=sx*2
		elseif sy*2<sx then
		sx=sy*2
	end
	ingo.Scale(sx,sy)
end











