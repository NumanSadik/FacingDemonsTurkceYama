-- A basic monster script skeleton you can copy and modify for your own creations.
--Game hunters çeviri ekibi
commentater = {"Последний актёр на сцене", "Чара выглядит недовольной", "Осталось только ДРАТЬСЯ", "Ты наполнен ПРЕДАТЕЛЬСТВОМ.", "Пахнет трусом.", "Сотри их в пыль.", "Очередной дурак.", "ДЕРИСЬ или УМРИ.", "Тебе ничего не остаётся.", "Ещё не поздно умереть.", "Чара хихикнула.", "Прячься или дерись.", "Точка невозврата.", "Тебе стоит попытаться сильнее.", "Объясни себе свои действия.", "Присоединяйся к битве.", "Никакой ПОЩАДЫ.", "Тебе придётся уМЕРГеть.", "Чара дрожит.", "Ничего особенного.", "Вступи в шоу и закончи его!", "Новое начало.", "Необычная временная линия.", "Суд.", "Навсегда один.", "Пыль на твоих руках кажется \rнормой.", "Просто ДЕРИСЬ.", "Не останавливайся отныне!"}
comments=commentater
comments={"Последний актёр на сцене"}
randomdialogue = {"[next]"}
fakespare = 0
pray = 0
goneto=0
lostgoneto=0
NewAudio.CreateChannel("dubber")
stomp1=1200
commands = {"ПРОВЕРИТЬ", "МОЛИТВА"}
----------------- Последние слова --------------------

outro1 = "[func:Final_2,finale][noskip][color:797979][effect:shake][waitall:5]Чтож..."
outro2 = "[noskip][color:797979][effect:shake][waitall:5]Кажется...\nТы победил."
outro3 = "[func:head4][noskip][color:797979][effect:shake][waitall:5]Хех..."
outro4 = "[func:head][noskip][color:797979][effect:shake][waitall:5]Вот и всё.\nНикогда не думала ,\nчто я умру вот..."
outro5 = "[noskip][color:797979][effect:shake][waitall:5]так."
outro6 = "[func:Final_3][noskip][color:797979][effect:shake][waitall:5]Умру перед лицом\nпредателя..."
outro7 = "[func:head][noskip][color:797979][effect:shake][waitall:5]Какой же ты\nтрус."
outro8 = "[func:Final_3][noskip][color:797979][effect:shake][waitall:5]Он... верил в тебя..."
outro9 = "[noskip][color:797979][effect:shake][waitall:5]А ты...\nпредала нас..."
outro10 = "[noskip][color:797979][effect:shake][waitall:5]предала все...\nнаши...\nнадежды..."
outro11 = "[func:Final_creepy][noskip][effect:shake][waitall:5][color:ff0000]ТЫ ЖЕ ПРОСТО...\nМЕЛКИЙ...\nБРАТОУБИЙЦА."
outro12 = "[func:Final_4][noskip][color:797979][effect:shake][waitall:5]. . ."
outro13 = "[noskip][color:797979][effect:shake][waitall:5]...Азриель...я..."
outro14 = "[noskip][color:797979][effect:shake][waitall:5]...Я иду к...\n[w:20]т е б е...[func:dead][w:60][func:WON][next]"
-----------------------------------------------------------------
plotdialogue = {d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31, d32, d33, d34, d35, d36, d37, d38, d39, d40, d41} -- это наш массив диалогов, сюда вставляем ссылки на фразы.
num_dial = #plotdialogue+1 -- костыль, который пришлось воткнуть, чтобы игра не зависала по истечению заготовленных реплик.
sprite = "empty" --Always PNG. Extension is added automatically.
name = "Чара Дримурр"
hp = 1500
atk = 1
def = 30
check = "Она использует силу\rПОДЗЕМЕЛЬЯ"
dialogbubble = "rightwide"
LostGotMissed=false
LostChildHopes=false
canspare = false
cancheck = false
dodge=true
unkillable=true
dialogueprefix="[effect:none]"
function Lang(ingo)
	if ingo=="rus" then
		name = "Чара Дримурр"
		commands = {"ПРОВЕРИТЬ", "МОЛИТВА"}
		else
		name = "Chara Dreemurr"
		commands = {"İNCELE", "DUA ET"}
	end
end

function Think()
	SetGlobal("facial_expression",47)
end

function Irony()
	SetGlobal("facial_expression",49)
end

function TakeOutChocolate()
	local t=Encounter.GetVar("charatorso")
	local sp="1.2/chara/chocalatebody0"
	if hp<1500 then
		sp=sp.."_wounded"
	end
	t.Set(sp)
end

function EatChocolate1()
	local t=Encounter.GetVar("charatorso")	
	local l=Encounter.GetVar("charalegs")
	local sp="1.2/chara/chocalatebody1"
	if hp<1500 then
		sp=sp.."_wounded"
	end
	t.Set(sp)
	Encounter.Call("DoHand")
end

function EatChocolate2()
	hp=hp+360
	Audio.PlaySound("healsound")
	local h=Encounter.GetVar("ChocolateHand")
	h.sprite.Set("1.2/chara/chocalatehand1")
	local t=Encounter.GetVar("charatorso")	
	local sp="1.2/chara/chocalatebody1"
	if hp<1500 then
		sp=sp.."_wounded"
	end
	t.Set(sp)
	
end
function HealUp()
	hp=hp+360
	Audio.PlaySound("healsound")
	local t=Encounter.GetVar("charatorso")	
	local sp="1.2/chara/chocalatebody1"
	if hp<1500 then
		sp=sp.."_wounded"
	end
	t.Set(sp)
end

function BackChocolate()
	local t=Encounter.GetVar("charatorso")
	t.Set("1.2/chara/chocalatebody2")
	Encounter.Call("NoDoHand")
end

function NoChocolate()
	local t=Encounter.GetVar("charatorso")
	t.Set("1.2/chara/Chara_body0")
end

function KnifeInPocket()
	local t=Encounter.GetVar("charatorso")
	local sp="1.2/chara/Chara_body0"
	if hp<1500 then
		sp=sp.."_wounded"
	end
	t.Set(sp)
end

function GiveChocolate()
	local t=Encounter.GetVar("charatorso")
	t.Set("1.2/chara/chocalatebody3")
end
	
function HappyCharaMeal2()
	local dial={}
	if Encounter.GetVar("lang")=="rus" then
		dial={"Вы утвердительно киваете и подбегаете ближе к Чаре.","[func:HappyCharaMeal3]"}
		else
		dial={"Başınla onaylayıp Chara'ya yaklaştın.","[func:HappyCharaMeal3]"}
	end
	for i=1,#dial do
		dial[i]="[noskip][novoice][voice:uidial]"..dial[i]
	end
	BattleDialog(dial)
end
	
function HappyCharaMeal4()
	local dial={}
	if Encounter.GetVar("lang")=="rus" then
		dial={"Вы спрашиваете Чару,[w:3] в порядке ли она.","[func:HappyCharaMeal5]"}
		else
		dial={"Chara'ya iyi olup olmadığını sordun.","[func:HappyCharaMeal5]"}
	end
	for i=1,#dial do
		dial[i]="[noskip][novoice][voice:uidial]"..dial[i]
	end
	BattleDialog(dial)
end
	
function HappyCharaMeal6()
	local dial={}
	if Encounter.GetVar("lang")=="rus" then
		dial={"Вы соглашаетесь взять[next]","[func:HappyCharaMeal7]"}
		else
		dial={"Almayı kabul ettin[next]","[func:HappyCharaMeal7]"}
	end
	for i=1,#dial do
		dial[i]="[noskip][novoice][voice:uidial]"..dial[i]
	end
	BattleDialog(dial)
end
	
function HappyCharaMeal8()
	local dial={}
	if Encounter.GetVar("lang")=="rus" then
		dial={"[w:3].[w:4].[w:4].[w:4]Вы послушно открываете рот и Чара кладет вам на язык кусочек шоколада.[w:6]\nОн будто тает во рту[waitall:4][w:3]...","[health:19]Вы восстановили ОЗ[waitall:4][w:3]...[waitall:1][w:3] \nПросто ОЗ","[func:HappyCharaMeal9]"}
		else
		dial={"[waitall:4][w:3]...[waitall:1][w:3]Ağzını açtın, Chara dilinin üzerine bir miktar çikolata koydu.[w:6]\nAğzında erimişe benziyor.[w:6].[w:6]","[health:19]CP'ni geri kazandın[waitall:4][w:3]...[waitall:1][w:3] \nKendiliğinden","[func:HappyCharaMeal9]"}
	end
	for i=1,#dial do
		dial[i]="[noskip][novoice][voice:uidial]"..dial[i]
	end
	BattleDialog(dial)
end
	
function HappyCharaMeal10()
	Encounter.SetVar("ToHappyEnd",1)
	State("NONE")
end

function Cough1()
	Encounter.SetVar("coughtime",30)
	Encounter.SetVar("cough",3)
end

function Cough2()
	Encounter.SetVar("coughtime",60)
	Encounter.SetVar("cough",6)
end

function LostHasLost()
	local lang=Encounter.GetVar("lang")
	local dial={}
	if lang=="rus" then
		dial={"[waitall:4][w:3]...[waitall:1][w:3]\nНу и трепло[waitall:4][w:3]...","Теперь[waitall:4][w:3]...[waitall:1][w:3] \nЧто касается тебя,[w:3] дорогуша[waitall:4][w:3]...[waitall:1][w:3]","[func:LostToMetta1]"}
		else
		dial={"[waitall:4][w:3]...[waitall:1][w:3]\nBalon gibi[waitall:4][w:3]...[waitall:1][w:3]","Şimdi[waitall:4][w:3]...[waitall:1][w:3]\nSana ne demeli,[w:3] tatlım[waitall:4][w:3]...[waitall:1][w:3]","[func:LostToMetta1]"}
	end
	for i=1,#dial do
		dial[i]="[noskip][color:8040ff]"..dial[i]
	end
	BattleDialog(dial)
end

function Remember()
	SetGlobal("facial_expression",48)
end

function GetsAngry()
	Encounter.Call("GetsAngry")
end

function ToAngry()
	SetGlobal("facial_expression",64)
end

function DUB(ingo)
	if Encounter.GetVar("dubbing")==true then
		NewAudio.PlaySound("dubber",Encounter.GetVar("lang").."/chara/"..ingo)
		Encounter.SetVar("IsTalk",true)
	end
end

function trigered()
	SetGlobal("facial_expression",45)
end

function trigeredrem()
	SetGlobal("facial_expression",50)
end

function trigeredclosed()
	SetGlobal("facial_expression",46)
end

function thoughts()
	SetGlobal("facial_expression",40)
end

function thoughtsleft()
	SetGlobal("facial_expression",42)
end

function LostKidFace(ingo1,ingo2)
	if ingo2=="+" then
		Encounter.SetVar("LostHead","/lost child/lost_"..ingo1)
		SetGlobal("facial_expression",60)
		else
		Encounter.SetVar("LostHead","/lost child/lost_"..ingo1)
		SetGlobal("facial_expression",61)
	end
end

function Reminder()
	Encounter.SetVar("Reminder",true)
	State("NONE")
end
function thoughtsright()
	SetGlobal("facial_expression",41)
end

function BackMusic()
	local songs=Encounter.GetVar("songs")	
	Encounter.Call("SetMusic",songs[1])
end
function mercy()
	SetGlobal("facial_expression",36)
end
function noblack()
	local phone=Encounter.GetVar("phone")
	phone.Remove()
end
function happycry()
	SetGlobal("facial_expression",35)
end
function HAPPY()
	Encounter.SetVar("happyending",0)
end

function lowpitchmusic()
	Encounter.SetVar("phase15slowmusic",0)
end
function stopmusic()
	Encounter.SetVar("lowmusic",0)
end
function nohope1()
	SetGlobal("facial_expression",30)
end
function nohopeanger()
	SetGlobal("facial_expression",34)
end
function nohope2()
	SetGlobal("facial_expression",31)
end
function nohope3()
	SetGlobal("facial_expression",32)
end
function nohope4()
	SetGlobal("facial_expression",33)
end
function Wink()
	SetGlobal("facial_expression",29)
end
function WON()
	local lang=Encounter.GetVar("lang")
	local wons=Encounter.GetVar("wons")
	local prog=Encounter.GetVar("prog")
	local lost=Encounter.GetVar("LostMercy")
	if wons==0 then
		if lang=="rus" then
			BattleDialog("[noskip][waitall:1]Ты победил![w:10]\nТы получил 0 М и 50000 ОП\nТвой УР вырос![func:Level20][w:1800] ")
			else
			BattleDialog("[noskip][waitall:1]Kazandın![w:10]\n0 Altın ve 50000 TP aldın\nSV'n yükseldi![func:Level20][w:1800] ")
		end
		elseif wons==1 then
		local dial={}
		if lost<6 then
			if lang=="rus" then
				dial={"[noskip][color:8040ff]Значит ей ещё было что сказать?[w:6]\nЖаль.[w:6] В следующий раз послушаем.[w:6]","[noskip][color:8040ff]Идем дальше.[w:6]\nТвой УР повышен и все дела.[w:6]\nНе будем задерживаться.[func:Level20][w:1800] "}
				else
				dial={"[noskip][color:8040ff]Yani söyleyecek bir şeyi mi var?[w:6]\nYazık.[w:6] Başka bir zaman dinleriz.[w:6]","[noskip][color:8040ff]Hadi ama.[w:6]\nSV'n yükseldi falan filan.[w:6]\nHadi zamanımızı boşa harcamayalım.[func:Level20][w:1800] "}
			end
			elseif lost<19 then
			if lang=="rus" then
				dial={"[waitall:4][w:3]...[waitall:1][w:3]Вопреки тому,[w:6] что мне было интересно,[w:6] эта сказка и правда затянулась.[w:6]","Ты всё правильно сделал.[w:6]\nТвой УР повышен и все дела.[w:6]\nНе будем задерживаться.[w:6][func:Level20][w:1800] "}
				else
				dial={"[waitall:4][w:3]...[waitall:1][w:3]Meraklı olsam da,[w:6] bu hikaye hala çok fazla zaman alıyor.[w:6]","Her şeyi doğru yaptın.[w:6]\nSV'n yükseldi falan filan.[w:6]\nHadi zamanımızı boşa harcamayalım.[w:6][func:Level20][w:1800] "}
			end
			elseif lost<21 then
			if lang=="rus" then
				dial={"Слава Богу[waitall:4][w:3]...[waitall:1][w:3] Ещё бы немного,[w:6] и я точно её убил.[w:6]\nКакая же она мерзкая[waitall:4][w:3]...[waitall:1][w:3] Даже на эмоции смогла пробить.[w:6]","Я не хочу больше здесь оставаться.[w:6]\nИдем дальше.[w:6][func:Level20][w:1800] "}
				else
				dial={"Şükürler olsun[waitall:4][w:3]...[waitall:1][w:3] Birazcık daha bundan ve onu kesinlikle öldüreceğim.[w:6]\nZaten çok iğrençti[waitall:4][w:3]...[waitall:1][w:3] Duygularıma dokunmuş olmasına rağmen bir şekilde.[w:6]","Burada daha fazla kalmak istemiyorum.[w:6]\nHadi.[w:6][func:Level20][w:1800] "}
			end
			else
			if lang=="rus" then
				dial={"Ты был на грани моего терпения.[w:6] \nЧто это значит?[w:6] Тебе не нравится моя постановка?[w:6] Выскажись.[w:6]","Я с радостью учту твои замечания в следующей постановке.[w:6]\nА пока закончим эту.[w:6] Да?[w:6][func:Level20][w:1800] "}
				else
				dial={"Sabrımın sınırındaydın.[w:6] \nBuda neydi böyle? [w:6]Oyunumu beğenmedin mi?[w:6] Dilindekileri tükür bakalım.[w:6]","Memnuniyetle sonraki oyunum için uyarılarını dinleyeceğim.[w:6]\nAma şimdi,[w:3] bunu bitirelim.[w:6] Evet?[w:6][func:Level20][w:1800] "}
			end
		end
		for i=1,#dial do
			dial[i]="[noskip][color:8040ff]"..dial[i]
		end
		BattleDialog(dial)
	end
	SetGlobal("prog",true)
end
function dead()
	SetGlobal("dying",true)
end
function closedyesend()
	SetGlobal("facial_expression",26)
end
function headend()
	SetGlobal("facial_expression",27)
end
function sleepy()
	SetGlobal("facial_expression",25)
end
function Final3()
	SetGlobal("facial_expression", 24)
end
function action()
	State("ACTIONSELECT")
end
function Act1()
	SetGlobal("CHECKED",true)
end
function Final_5()
	SetGlobal("facial_expression",28)
end
function Act2()
	State("ACTIONSELECT")
end
function ph1()
	SetGlobal("phase1", 1)
end
function ph2()
	SetGlobal("phase1",2)
end
function phcon()
	SetGlobal("phase1",3)
end
function phend()
	SetGlobal("phase1",0)
end
function ChangeMusic()
	Encounter.Call("ChangeMusic")
end
function MoveToCenter()
	Encounter.SetVar("TimeToMove",1)
end
function Danger1()
	SetGlobal("facial_expression",23)
end
function Peachy()
	SetGlobal("facial_expression",22)
end

function NoMercy2()
        SetGlobal("facial_expression", 18)
end

function Suprise1()
        SetGlobal("facial_expression", 17)
end

function Surprise1()
        SetGlobal("facial_expression", 17)
end

function NoMercy1()
        SetGlobal("facial_expression", 19)
end

function Suprise2()
        SetGlobal("facial_expression", 20)
end

function Surprise2()
        SetGlobal("facial_expression", 20)
end

function Bad()
        SetGlobal("facial_expression", 21)
end

function Dodging()
	SetGlobal("runy", true)
end

function EveryDial(ingo, part,dubi)
	local outgo=ingo
	if Encounter.GetVar("dubbing")==true then
		for i=1,#ingo do
			outgo[i]=dubi..ingo[i]
		end
	end
	for i=1,#ingo do
		outgo[i]=part..ingo[i]
	end
	return outgo
end

function smart()
	SetGlobal("facial_expression", 53)
	--G.,A.,M.,E .,H.,U.,N.,T.,E.,R.,S
end 

function tired()
	SetGlobal("facial_expression", 13)
end 

function normal()
	SetGlobal("facial_expression", 15)
end 

function normal1()
	SetGlobal("facial_expression", 16)
end 

function tired1()
	SetGlobal("facial_expression", 14)
end 

function cens() 
	Audio.PlaySound("dogsecret")
end 

function deadly()
	SetGlobal("facial_expression", 10)
end

function angry()
	SetGlobal("facial_expression", 12)
end

function cry ()
	SetGlobal("facial_expression", 11)
end

function Final_1()
	SetGlobal("facial_expression", 1)
end

function TakeKnife()
	Encounter.Call("SetMusic","none")
	Encounter.SetVar("standtime",0)
	Encounter.SetVar("standnow",2)
	Encounter.SetVar("standnew",2)
	Audio.PlaySound("appear")
	SetGlobal("knifeinhand", true)
end

function DramaIn()
	Encounter.SetVar("drama",true)
end

function DramaOut()
	Encounter.SetVar("drama",false)
end

function weak()
	SetGlobal("facial_expression", 52)
end

function AUCH()
	SetGlobal("facial_expression", 51)
end

function Look()
	SetGlobal("facial_expression", 43)
end
function Lookleft()
	SetGlobal("facial_expression", 44)
end
function Music(ingo)
	Encounter.Call("SetMusic",ingo)
end
function Music2()
	local songs=Encounter.GetVar("songs")
	Encounter.Call("SetMusic",songs[3])
end
function Final_2()
	SetGlobal("facial_expression", 2)
end

function sad()
	SetGlobal("facial_expression", 8)
end

function Final_6()
	SetGlobal("facial_expression", 38)
end

function Final_7()
	SetGlobal("facial_expression", 39)
end

function Final_3()
	SetGlobal("facial_expression", 3)
end

function smile()
	SetGlobal("facial_expression", 9)
end

function Final_4()
	SetGlobal("facial_expression", 4)
end

function Final_creepy()
	SetGlobal("facial_expression", 5)
end

function head4()
	SetGlobal("facial_expression", 6)
end

function head()
	SetGlobal("facial_expression", 7)
end

function BADBad()
	SetGlobal("facial_expression", 54)
end

function mercy()
	SetGlobal("facial_expression",36)
end

function BADsad()
	SetGlobal("facial_expression", 55)
end

function BADIrony()
	SetGlobal("facial_expression", 56)
end

function BADRemember()
	SetGlobal("facial_expression", 57)
end

function BADthoughts()
	SetGlobal("facial_expression", 58)
end

function BADsmart()
	SetGlobal("facial_expression", 59)
end

function BADweak()
	SetGlobal("facial_expression", 63)
end

function hurtme(wound)
	local songs=Encounter.GetVar("songs")	
	Encounter.Call("SetMusic",songs[3])
end

function start(prolog)
	Encounter.Call("SetMusic",prolog)
end

function start1()
	Encounter.Call("SetMusic","none")
end

function start2()
	local songs=Encounter.GetVar("songs")
	Encounter.Call("SetMusic",songs[1])
end

function TireStand()
	Encounter.SetVar("standnew",5)
end

function Bloodshed()
	local songs=Encounter.GetVar("songs")	
	Encounter.Call("SetMusic",songs[2])
	Encounter.SetVar("CharaIsRaging",true)
end

function Devil()
	local songs=Encounter.GetVar("songs")
	if songs[1]=="night" then
		if Encounter.GetVar("prog")<27 then
			Encounter.Call("SetMusic",songs[1])
			else
			Encounter.Call("SetMusic","wound")
		end
		else
		Encounter.Call("SetMusic",songs[1])
	end
end

function BoneFriend()
	Encounter.Call("GiveSprite","Paps_Sprite")
end

function SendToCenter()
	SetBubbleOffset(0,0)
end

function ShowSoul()
	Encounter.SetVar("SoulShowsUp",1)
end

function CrashSoul()
	Encounter.SetVar("SoulShowsUp",61)
	State("NONE")
end

function HideKnife()
	local torso=Encounter.GetVar("charatorso")
	torso.Set(Encounter.GetVar("currentspr").."/chara/Chara_body0")
	Encounter.SetVar("trs_sp",Encounter.GetVar("currentspr").."/chara/Chara_body0")
	Encounter.SetVar("standnew",1)
end

function EpicKnife()
	if Encounter.GetVar("currentspr")=="1.2" then
		local torso=Encounter.GetVar("charatorso")
		torso.Set(Encounter.GetVar("currentspr").."/chara/Chara_body_fight")
		Encounter.SetVar("trs_sp",Encounter.GetVar("currentspr").."/chara/Chara_body_fight")
		local torso=Encounter.GetVar("charalegs")
		torso.Set(Encounter.GetVar("currentspr").."/chara/Chara_legs_fight")
		Encounter.SetVar("trs_sp",Encounter.GetVar("currentspr").."/Chara_legs_fight")
	end
	Encounter.SetVar("standnew",3)
	Encounter.SetVar("standnow",3)
	Encounter.SetVar("standtime",0)
	Encounter.SetVar("EpicKnife",true)
end
	
function NoEpicKnife()
	if Encounter.GetVar("currentspr")=="1.2" then
		local torso=Encounter.GetVar("charatorso")
		torso.Set(Encounter.GetVar("currentspr").."/chara/Chara_body")
		Encounter.SetVar("trs_sp",Encounter.GetVar("currentspr").."/chara/Chara_body")
		local legs=Encounter.GetVar("charalegs")
		legs.Set(Encounter.GetVar("currentspr").."/chara/Chara_legs")
		Encounter.SetVar("lgs_sp",Encounter.GetVar("currentspr").."/Chara_legs")
		torso.x=8
		local head=Encounter.GetVar("charahead")
		Encounter.SetVar("hdx",-7)
	end
	Encounter.SetVar("standnew",5)
	Encounter.SetVar("standnow",5)
	Encounter.SetVar("standtime",0)
	Encounter.SetVar("EpicKnife",false)
end

function GiveCurse()
	Encounter.SetVar("IsCursed",true)
	Encounter.SetVar("cursefade",0)
	Encounter.SetVar("cursetime",0)
end

function NoCurse()
	Encounter.SetVar("IsCursed",false)
	Encounter.SetVar("cursetime",0)
end

function QuietMusic()
	Encounter.SetVar("QuietMusic",true)
	Encounter.SetVar("QuietMusicTime",0)
end

function CheckWound()
	Audio.PlaySound("healsound")
	Encounter.Call("Wounded",hp)
end

function Bubble()
	local eva=GetGlobal("evasion")
	if eva==1 or eva==2 then
		SetBubbleOffset(-100,0)
		else
		SetBubbleOffset(0,0)
	end
end
function HandleAttack()
	local prog=GetGlobal("progress")
	local wav={"nothing"}
	local nrus={}
	local neng={}
	local engcom=""
	local ruscom=""
	local eva=GetGlobal("evasion")
	if eva==1 or eva==2 then
		SetBubbleOffset(-100,0)
		else
		SetBubbleOffset(0,0)
	end
	local diff=Encounter.GetVar("diff")
	local lang=Encounter.GetVar("lang")
		comments = commentater
	if GetGlobal("progress") == 1 then
		Encounter.SetVar("evadelevel",1)
		neng={'"Kaçındı mı?",[w:3]\n değil mi?', "[func:NoMercy1]Bak,[w:3] ne sen benim \nprensimsin,[w:3] ne de ben \nsenin prensesin.", "[func:Bad]Kendi başımın \nçağresine bakabilirim." ,"[func:head][next]"}
		nrus={'"Как она \nувернулась?", \n[w:3]верно?', "[func:NoMercy1]Послушай,[w:3] ты же \nне принц,[w:3] а я \nне твоя принцесса.", "[func:Bad]Я умею за себя \nпостоять.","[func:head][next]"}
		ruscom="Настало время для первого акта."
		engcom="İlk eylemini yapma zamanı."
		wav={"phase1/k_random1"}
	elseif GetGlobal("progress") == 2 then
		nrus={"[func:NoMercy1]Позволь задать \nтебе вопрос.", "Ты серьезно \nдумаешь,[w:3] \n[func:head]что я настолько \nглупа?" }
		neng={"[func:NoMercy1]Sana bir soru \nsormama izin ver.", "Sence kimim \nSadece bir [func:head]aptal mı?"  }
		ruscom="Вопрос с подвохом?"
		engcom="Bu retorik bir soru muydu?"
		wav={"phase1/rain"}
	elseif GetGlobal("progress") == 3 then
		nrus={"[func:NoMercy1][waitall:2]Всё,[waitall:1] [w:3]что ты \nнатворил на \nпути сюда[waitall:5][w:3]...[waitall:1][w:5]\nВся эта кровь \nна твоих руках[waitall:5][w:3]...", "Разве я настолько \nдура,[w:3] \n[func:head]чтобы верить тебе?" }
		neng={"[func:NoMercy1][speed:1][w:3]Yolunda yaptığın [speed:0.55]\nher şey[waitall:5][w:3]...[waitall:1][w:5] \nElindeki tüm bu toz[waitall:5][w:3]...", "[func:head]Lanet olsun sana \ninanabilecek kadar \naptal mıydım?" }
		ruscom="Чара истерично хихикает."
		engcom="Chara histerik olarak gülüyor."
		wav={"phase1/random"}
	elseif GetGlobal("progress") == 4 then
		nrus={"Мой ответ - [w:6][waitall:2]нет.", "[func:Think]Взгляни вокруг.[w:6] \nТы и я.[w:6] \nОдин на один.", "[func:NoMercy1]Этот коридор \nпропах запахом \nчеловеческой крови.", "На моих руках уже \nесть кровь людей. \n[w:6]Ты - [w:6]не первый [w:6]\nи не последний.", "[func:head]Но только ты \nпричинил столько \nболи.", "И это мой повод \nне опускать руки." }
		neng={"Cevabım - [w:6]hayır.", "Etrafına bak.[w:6]\n[func:Think]Şu an sadece sen ve \nben varız.[w:6] \nBire bir.", "[func:NoMercy1]Bu koridor insan kanı \nkokuyor.", "Benimki onlarınki ile \nkirlendi.[w:6]\nSen [w:6]ilk yada sonuncu \ndeğilsin.", "[func:head]Ama sadece sen bu \nkadar acıya neden \noldun.", "Ve bu benim bir kez \ndaha savaşma \nnedenim."}
		ruscom="Не забывай о своей миссии."
		engcom="Görevini unutma."
		wav={"phase1/k_5_new"}
	elseif GetGlobal("progress") == 5 then
		nrus={"[func:NoMercy1]И знаешь,[w:3] что?", "[func:head]С меня хватит \nпритворства.", "[func:sad]Это ведь не \nвпервые?[w:6] \nЯ чувствую, [w:3]будто \nвсё повторяется \nраз за разом.", "[func:head4]Это не похоже на \nСбросы.[w:6] \[func:sad]Временная \nлиния остается \nвсё той же.", "[func:head4]Будто меняется[waitall:4][w:3]...[waitall:1][w:5]\n[func:Suprise1]Сам [w:3][waitall:3]мир.", "[func:NoMercy1]Это ведь[waitall:4][w:3]...[waitall:1][w:5] \n[func:head]Твоих рук дело?" }
		neng={"[func:NoMercy1]Ve biliyor musun?", "[func:head]Bütün bunlar yetti.", "[func:sad]Bu ne ilki, nede \nsonuncusu, [w:3]değil mi? \n[w:6]Her şey \ntekrarlanıyormuş \ngibi hissediyorum.", "[func:head4]Sıfırlamadan \nbahsetmiyorum.[w:6] [func:sad]\nZaman çizelgesi hala \naynı.", "[func:head4]Şey gibi hissetiriyor[waitall:4][w:3]...[waitall:1][w:5]\n[func:Suprise1]Bütün [waitall:2]dünyanın \n[waitall:1][w:5]değişimi.", "[func:NoMercy1]Bu senin suçun[waitall:4][w:3]...[waitall:1][w:5] [func:head]\nDeğil mi?"}
		ruscom="В её словах есть смысл."
		engcom="Doğru bir noktaya vardı."
		wav={"phase1/k_random2"}
	elseif GetGlobal("progress") == 6 then
		nrus={"[func:sad]Ты тоже это \nчувствуешь[waitall:5]...", "[func:head4]Тем не менее[waitall:4]...[waitall:1][w:4] [func:NoMercy1]Есть\nкое-что важнее,[w:10]\nчем мои \nпредчувствия.", "[func:mercy]Ты ведь чувствуешь? [w:15]\n[waitall:2][func:head]Грехи,[waitall:1][w:5] что ползут \nпо твоей спине?"}
		neng={"[func:sad]Yani, aynı \nhissediyorsun[waitall:4][w:3]...", "[func:head4]Yine de[waitall:4][w:3]...[waitall:1][w:4]\n[func:NoMercy1]Burada benim \nönyargımdan daha \nönemli bir şey var.", "[func:mercy]Onları hissediyor \nmusun?[w:15] [func:head]\n[waitall:1][w:5]Sırtında karıncalanan\n[waitall:2]günahlarını?"}
		ruscom="Нас не одурачить этой пугалкой."
		engcom="Bu sözlerle bizi kandıramaz."
		wav={"phase1/warning"}
	elseif GetGlobal("progress") == 7 then
		nrus={"[func:NoMercy1]Так вот.[w:15] Мой тебе \nсовет [w:4]- не \nповорачивайся.", "[func:head]Иначе нож в ту же \nсекунду пронзит \nтвою глотку.", "Я не отпущу тебя \nбез достойной \nбитвы.[w:6] \nТы отплатишь за \nсвои грехи." }
		neng={"[func:NoMercy1]Yanisi senin için bir \ntavsiyem var.[w:6] \n[waitall:2]Arkana bakma.", "[func:head]Çünkü her bakışında \nyüzünde bir bıçak \nbelirecek.", "Uygun bir savaş \nolmadan gitmene izin \nvermeyeceğim.[w:6] \nYaptıklarını \nödeyeceksin."}
		ruscom="Ну,[w:3] этот совет был хорошим,[w:3] кажется."
		engcom="Napalım,[w:3] bu tavsiye çok katıydı,[w:3] merak ediyorum acaba arkamı dönersem."
		wav={"phase1/Quickly"}
	elseif GetGlobal("progress") == 8 then
		nrus={"[func:sad]Кому я это говорю[waitall:4][w:3]...",  "[func:head4]Ты ведь не слышишь.[w:15] \n[func:sad]Не хочешь [w:5]или \nне можешь [w:5]- не \nважно.", "[func:Final_7]Полагаю[waitall:4][w:3]...[waitall:1][w:4] \n[func:NoMercy1]Мы оба знаем,[w:3] \n[func:head]что будет в конце."}
		neng={"[func:sad]Neden zahmet \nediyorum ki[waitall:4][w:3]...", "[func:head4]Dinlemiyorsun bile.[w:15] [func:sad]\nYapamıyorsan [w:6]yada \nyapmak istemiyorsan,[w:15] \nbunun pek bir önemi \nyok.", "[func:Final_7]Düşünüyorum da[waitall:4][w:3]...[waitall:1][w:3] \n[func:NoMercy1]Sanırım ikimizde \nhikayemizin sonunu \nbiliyoruz."}
		ruscom="Осторожнее.[w:6] \nЧто-то с ней не так[waitall:4][w:3]..."
		engcom="Dikkatli ol[waitall:4][w:3]...[waitall:1][w:3] \nOnun hakkında bir şeyler yanlış gibi."
		wav={"phase1/Reaction"}
	elseif GetGlobal("progress") == 9 then
		nrus={"[func:head4]Ты думаешь, [w:3]что я \nнаивная[waitall:4][w:3]...[waitall:1][w:3]\nпредсказуемая и \nжалкая.", "[func:Look]Думаешь,[w:3] [func:Lookleft]что я \nвообразила из себя \nсудью,[w:3] \n[func:sad]хотя сама ничем \nне лучше тебя[waitall:4][w:3]...", "[func:head4]Может,[w:3] ты и прав.","[func:head][next]"}
		neng={"[func:head4]Saf olduğumu[waitall:4][w:3]...[waitall:1][w:3] \nTahmin edilebilir ve \nzavallı olduğumu \ndüşünüyorsun.", "[func:Look]Düşünüyorsun ki,[w:3] [func:Lookleft]seni \nbiraz yargılayacağım \nve [func:sad]hala senden daha \niyi değilim[waitall:4][w:3]...", "[func:head4]Belki de,[w:3] doğru bir \nnoktaya değindin.","[func:head][next]"}
		ruscom="Конечно,[w:3] прав."
		engcom="Elbette,[w:3] değindim."
		wav={"phase1/BeFast"}
	elseif GetGlobal("progress") == 10 then
		nrus={"Но я не одинока.", "[func:DramaIn][func:head4]Точнее[waitall:4][w:4]...[waitall:1][w:3] Была.[w:15]\nНо пусть их и нет \nсо мной[waitall:4][w:4]...", "[func:Final_3]Я чувствую их \nвнутри своей Души.", "[func:Final_4]Каждого,[w:3] кого я \nлюбила и уважала,[w:3]\nи они отвечали \nтем же[waitall:4][w:3]...", "[func:Peachy]Каждый из \nних [w:5]-[w:5] [func:mercy]моя \nсемья.", "[func:DramaOut][func:Peachy]Я многому у них \nнаучилась[waitall:4][w:4]...", "[noskip][func:NoMercy1]Например.[w:16] [speed:0.5][func:head]Этому.[w:30][next]"}
		neng={"Ama yalnız değilim.", "[func:DramaIn][func:head4]Peki[waitall:4][w:4]...[waitall:1][w:3] \nÖyleydim[waitall:4][w:4]...[waitall:1][w:15] \nAma şu an yanımda \nolmasalarda[waitall:4][w:4]...", "[func:Final_4]Ruhumun \nderinliklerinde onları \nhissediyorum.", "[func:head4]Herkesi hissediyorum \ndeğer verdiğim ve \nsaygı duyduğum.", "[func:Peachy]Her birini[w:9] [func:mercy]ailem \nolarak.", "[func:DramaOut][func:Peachy]Onlardan çok fazla \nşey öğrendim.", "[noskip][func:NoMercy1]Örneğin. [w:15][func:head][waitall:2]\nBu.[w:30][next]"}
		ruscom="Ну конечно,[w:3] сила любви.[w:6]\nКак я раньше не понял."
		engcom="Elbette,[w:3] sevginin gücü.[w:6]\nDaha önceden tahmin etmeliydim."
                --Encounter.SetVar("wavetime",11)
		wav={"phase1/bones0"}
		Encounter.SetVar("evadelevel",2)
	elseif GetGlobal("progress") == 11 then
		nrus={"[func:Peachy]Понимаешь,[w:3][func:mercy] я ещё \nне совсем привыкла \nк этой[waitall:4][w:3]...[waitall:1][w:3] силе.", "[func:Remember]Моя решимость \nрезонирует внутри \nмоей души[waitall:4][w:3]...", "[func:Peachy]Я чувствую,[w:3] как \nони[waitall:4][w:3]...[waitall:1][w:3] [func:Remember]поддерживают \nменя. \n[w:6]Заботятся обо мне.", "[func:Peachy]И их сила[waitall:4][w:3]...[waitall:1][w:3] \n[func:mercy]Передалась мне.", "[func:NoMercy1]Ну что?[w:9] [func:head]Готов \nко второму раунду?"}
		neng={"[func:Peachy]Üzgünüm,[w:3] [func:mercy]bunda hala \npek iyi değilim[waitall:4][w:3]...[waitall:1][w:3] \nGüç.", "[func:Remember]Ruhum ve azmimle \nyankılanıyor[waitall:4][w:3]...[waitall:1]", "[func:Peachy]Şey gibi \nhissettiriyor[waitall:4][w:3]...[waitall:1][w:3] [func:Remember]\nBeni \ndestekliyorlarmış gibi.[w:6] \nBeni önemsiyorlarmış \ngibi.", "[func:Peachy]Ve onların güçleri[waitall:4][w:3]...[waitall:1][w:3] [func:mercy]\nŞimdi benim.", "[func:NoMercy1]Yani? [w:9][func:head]İkinci tura \nhazır mısın?"}
		ruscom="Она адаптируется к новым силам.[w:6]\nУ нас всё меньше времени,[w:3] \rдорогой актер."
		engcom="Yeni güçlerine alışıyor.[w:6] \nPek zamanımız kalmadı,[w:3] \rsevgili aktör."
		wav={"phase1/bullettest_touhou"}
		--Encounter.SetVar("wavetimer", 13.0)
	elseif GetGlobal("progress") == 12 then
		nrus={"[func:head4]Эта сила[waitall:4][w:3]...", "[func:Final_5]Я будто слышу в \nушах его голос[waitall:4][w:3]...", "[func:Peachy]Такой родной\nи близкий[waitall:4][w:3]...", "Папайрус[waitall:5]...", "[waitall:4][w:3]...", "[func:mercy]Да,[w:3] я совсем забыла \nпро тебя,[w:3] извини.", "[func:NoMercy1]Итак,[w:6][func:head] на чем мы \nостановились?"}
		neng={"[func:head4]Bu güç[waitall:4][w:3]...", "[func:Final_5]Seslerini kafamda \nduyuyor gibiyim[waitall:4][w:3]...", "[func:Peachy]Çok yakın ve \nsevecen[waitall:4][w:3]...", "Papyrus[waitall:4][w:3]...", "[waitall:4][w:3]...", "[func:mercy]Evet,[w:3] az kalsın seni \nunutuyordum,[w:3] \nsaldırmak için.", "[func:NoMercy1]Yani,[w:6] [func:head]devam \nedelim mi?"}
		ruscom="Мне не нравится новый вектор \rбитвы.[w:6]\nОна стала сильнее."
		engcom="Bu yeni savaşı pek sevmedim.[w:6] Aşırı güçlü hale gelmiş."
		wav={"phase1/bones1"}
		--Encounter.SetVar("wavetimer", 13.0)
	elseif GetGlobal("progress") == 13 then
		nrus={"[func:head4]Он так заботился \nо тебе[waitall:4][w:3]...", "[func:sad]Папайрус глупо \nпросил меня обещать \nему,[w:3] \nчто я не трону \nтебя.", "[func:head4]Ты был ему \nкак брат[waitall:4][w:3]...", "[waitall:4][w:3]...", "[func:head]Почему мне должно \nбыть стыдно,[w:3] что \nя не сдержала \nклятву?"}
		neng={"[func:head4]Seni çok önemsedi...", "[func:sad]Papyrus seni \nincitmememi sağladı.", "[func:head4]Onun için \nonun kardeşi gibiydin...", "...", "Nasıl[waitall:4][w:3]...[waitall:1][w:3] [func:head]\nSözümü bozduğum \nhalde nasıl \nüzülebilirim?"}
		ruscom="У меня одного кости болят?"
		engcom="Kemikleri ağrıyan tek kişi ben miyim?"
                --Encounter.SetVar("wavetime",10.5)
		wav={"phase1/bullettest_chaseorb"}
	elseif GetGlobal("progress") == 14 then
		nrus={"[func:Think]Даже в пылу боя,[w:3] \nон заботился о \nтебе[waitall:4][w:3]...", "[func:head]Я не буду такой \nдоброй,[w:3] не смотри \nна меня.", "[func:head4]Мне так не хватает \nразговоров с ним \nу двери[waitall:4][w:3]...", "Когда я увидела,[w:3] \nчто от двери \nостался лишь \nщебень,[w:3] я поняла,[w:3] \nчто настал [waitall:2][w:2]конец.", "Конец всему[waitall:4][w:3]...[waitall:1][w:3] \n[func:head]Что я любила."}
		neng={"[func:Think]Savaşırken bile seni \nönemsedi[waitall:4][w:3]...", "[func:head]Pek iyi olmayacağım,[w:3] \ndüşlerinde bile.", "[func:head4]Onunla kapıdan \nkonuşmayı çok \nözledim[waitall:4][w:3]...", "Ondan kalan tozları \ngördüğümde,[w:3] bunun \nson olduğunu anladım.", "[func:head]Sevdiğim [waitall:1][w:9]her şeyin [waitall:2][w:1]\nsonu."}
		ruscom="Чара кажется отчаявшейся."
		engcom="Chara çaresiz görünüyor."
		wav={"phase1/bones2"}
	elseif GetGlobal("progress") == 15 then
		nrus={"[func:NoMercy1]Любовь[waitall:4][w:3]...", "Конечно,[w:3] [func:head]нас обоих \nсвязала любовь.", "[func:NoMercy1]Не настоящая.[w:6] \nНе семейная.[w:6] \nА та,[w:3] что \nгниет внутри нас.", "Любовь[waitall:4][w:3]...[waitall:1][w:3][func:head] \nк убийствам.[w:6] \nК ненависти,[w:3] \nживотной натуре.", "[func:Think]В конце концов[waitall:4][w:3]...[waitall:1][w:3] \n[func:NoMercy1]Все мы такие,[w:6][speed:0.5] \n[color:ff0000]люди[color:000000][waitall:4][w:3]...","[func:head][next]"}
		neng={"[func:NoMercy1]Sevgi[waitall:4][w:3]...", "Elbette,[w:3] [func:head]sevgi bizi \nbağladı.", "[func:NoMercy1]Gerçek olanı değil.[w:6] \nAilevi olanı değil.[w:6] \nAma içimizde çürüyen \nşey buydu.", "Sevgiden[waitall:4][w:3]...[waitall:1][w:3] [func:head]\nKatliama,[w:6] nefrete,[w:3] \navlanmaya.", "[func:Think]Sonunda[waitall:4][w:3]...[waitall:1][w:3] \n[func:NoMercy1]Bu bizim için doğal,[w:6] \n[color:ff0000]insanlar için[color:000000][waitall:4][w:3]...","[func:head][next]"}
		ruscom="Атака фантомных ножей![w:6]\nЭто читы!"
		engcom="Hayalet bıçakların egemenliği![w:6]\nHile yapıyor olmalısın!"
		wav={"phase1/nostop"}
	elseif GetGlobal("progress") == 16 then
		nrus={"[func:head4]Голоса в голове[waitall:4][w:3]...[waitall:1][w:3] \nИх слишком много[waitall:4][w:3]...", "Они все[waitall:4][w:3]...[waitall:1][w:3] Все \nхотят твоей \nсмерти[waitall:4][w:3]...", "[func:NoMercy1]Но я не дам её тебе \nтак просто.", "[func:closedyesend]Так же,[w:3] как ты \nмучила милую \nАльфис,[w:3] \nты будешь гореть \nв [speed:0.5][w:2]агонии[waitall:4][w:3]...", "[func:head][waitall:3][w:3]Д о л г о[w:4]"}
		neng={"[func:head4]Kafamdaki sesler[waitall:4][w:3]...[waitall:1][w:3] \nOnlardan çok fazla \nvar[waitall:4][w:3]...", "Hepsi[waitall:4][w:3]...[waitall:1][w:3] \nSenin ölmeni istiyor[waitall:4][w:3]...", "[func:NoMercy1]Ama çabuk bitirirsek \nsenin için çok \nmerhametli olur.", "[func:closedyesend][waitall:2][w:2]Izdırap içinde \nyanacaksın. [waitall:1][w:2]\nTatlı Alphys'e işkence \nettiğin kadar uzun \nsüre[waitall:4][w:3]...", "[func:head][waitall:2][w:2]Çok [waitall:3][w:3]u z u n[waitall:2][w:3] \nbir süre."}
		ruscom="Голоса[waitall:4][w:3]?..[waitall:1][w:3]\nУ неё крыша поплыла."
		engcom="Sesler[waitall:4][w:3]?...[waitall:1][w:3]\nDelirmiş mi?"
		wav={"phase1/electro_rain"}
	elseif GetGlobal("progress") == 17 then
		nrus={"[func:head4]Они[waitall:4][w:3]...[waitall:1][w:3] Взрываются\nв моей голове[waitall:4][w:3]...", "Но эта боль[waitall:4][w:3]...[waitall:1][w:3] \n[func:NoMercy1]Она ничто по \nсравнению с тем,[w:3]\nчто ты причинил\nмне.", "Я[waitall:4][w:3]...[waitall:1][w:3] Я справлюсь[waitall:4][w:3]...", "[func:head4]Я[waitall:4][w:3]...[waitall:1][w:3] Справлюсь[waitall:4][w:3]...", "[waitall:4][w:3]...", "[func:NoMercy1]Покажем ему,[w:9] \n[func:head]Альфи[waitall:4][w:3]..."}
		neng={"[func:head4]Sesler[waitall:4][w:3]...[waitall:1][w:3] \nKafamda patlıyorlar[waitall:4][w:3]...", "Ama bu acı[waitall:4][w:3]...[waitall:1][w:3] [func:NoMercy1]\nSenin yaptığın şeyin \nyanında bir hiç.", "Yapabilirim[waitall:4][w:3]...[waitall:1][w:3] \nOnunla anlaşabilirim[waitall:4][w:3]...", "[func:head4]Ben[waitall:4][w:3]...[waitall:1][w:3] \nYapabilirim[waitall:4][w:3]...", "[waitall:4][w:3]...", "[func:NoMercy1]Göster ona,[w:9] [func:head]Alph[waitall:4][w:3]..."}
		ruscom="В её руках сила твоих погибших врагов[waitall:4][w:3]...[waitall:1][w:3] Она[waitall:3][w:3]...[waitall:1][w:3] Настроена серьезно."
		engcom="Düşen düşmanlarının güçlerine sahip[waitall:4][w:3]...[waitall:1][w:3] \nO[waitall:3][w:3]...[waitall:1][w:3] \nŞu an ciddi."
		wav={"phase1/alph"}
	elseif GetGlobal("progress") == 18 then
		nrus={"[func:NoMercy1][waitall:4][w:3]...", "Скажи,[w:3] [func:head]в чем смысл \nвсего этого?", "[func:Think]Мы встречаемся \nвновь и вновь.[w:9] \n[func:head]Я вновь и вновь \nдаю тебе отпор.", "[func:head4]Раз за разом[waitall:4][w:3]...[waitall:1][w:3] \n[func:deadly]Этот бесконечный \nкошмар[waitall:4][w:3]...", "Ты в погоне за \nсилой?[w:13] \n[func:Surprise1]Тебе не нравится \nнаш мир?", "[func:head4]Что[waitall:4][w:3]...[waitall:1][w:3] \n[func:Surprise1]Что тебе нужно?", "[waitall:4][w:4]Чего[waitall:1][w:9] тебе не \nхватает?","[func:head][next]"}
		neng={"[func:NoMercy1][waitall:4][w:3]...", "Söyle,[w:3] [func:head]bunların amacı \nne?", "[func:Think]Tekrar ve tekrar \nsavaşıyoruz.[w:9][func:head] \nHer seferinde seni \nyeniyorum.", "[func:head4]Ardarda[waitall:4][w:3]...[waitall:1][w:3] \nBu kabus sonsuz[waitall:4][w:3]...", "Gücü mü takip \nediyorsun?[w:9] \n[func:Surprise1]Dünyamı sevmiyor \nmusun?", "[func:head4]Ne[waitall:4][w:3]...[waitall:2][w:3] [func:Surprise1]\nHedefin[waitall:1][w:6] ne?", "[waitall:4][w:4]Neyi[waitall:1][w:9] takip ediyorsun?","[func:head][next]"}
		ruscom="Ей всё равно не понять.[w:6]\nНе отвлекайся."
		engcom="Nede olsa anlayamayacak.[w:6]\nDert etme."
		wav={"phase1/NotMiddleRoad"}
	elseif GetGlobal("progress") == 19 then
		nrus={"[func:head4]Твоя цель \nоправдывает \nтвои действия?", "[func:Surprise1]Моя семья погибла \nне напрасно,[w:3] [func:sad]верно?", "[func:Surprise1]Ты рушишь семьи,[w:6]\n[func:head4]ты уничтожаешь мир.", "[func:deadly]Каждый раз ты \nставишь нас на \nколени.", "[func:head4]Азриэль верил,[w:3] что \nв тебе есть что-то \nмогущественное.", "Сила,[w:6] [func:Surprise1]способная \nизменить мир.","[func:head][next]"}
		neng={"[func:head4]Hedefin yaptıklarına \ndeğer mi?", "[func:Surprise1]Ailem hiçbir şey \nuğruna ölmedi,[w:3] [func:sad]\nöyle mi?", "[func:Surprise1]Aileleri yok ediyorsun,[w:3] \n[func:head4]Tüm dünyayı da.", "[func:deadly]Her seferinde \nkemiklerimizi \nkırıyorsun.", "[func:head4]Asriel sana inanmıştı,\n[w:3]içinde iyi biri \nolduğuna.", "[func:Surprise1]Tüm dünyayı \ndeğiştirme gücün var.","[func:head][next]"}
		ruscom="Чара меланхолично крутит \rножом в руках."
		engcom="Chara melankolik olarak bıçağını sallıyor."
		wav={"phase1/rei"}
	elseif GetGlobal("progress") == 20 then
		Encounter.SetVar("evadelevel",3)
		neng={"[func:Peachy]Evet[waitall:4][w:3]...[waitall:1][w:3] \nSeni duyuyorum.[w:6] \nBu kadar palavra \nyeter[waitall:4][w:3]...", "Rei,[w:3] sen her zaman[waitall:4][w:3]...[waitall:1][w:3] \n[func:head4]Ağlayan bir bebek \ngibiydin[waitall:4][w:3]...", "[waitall:4][w:3]...", "[func:Peachy]Ah,[w:3][func:mercy] yine mi daldım?", "[func:Peachy]Özür dilerim[waitall:4][w:3]...", "Tüm o sesler[waitall:4][w:3]...[waitall:1][w:3] [func:Remember]\nOnlardan çok fazla \nvar.", "[func:head4]Neredeyse her \nkurbanını duyar \ngibiyim.", "Hepsini[waitall:4][w:3]...[waitall:1][w:3] [func:sad]\nVe aynı zamanda \nhiçbirini[waitall:4][w:3]...", "[func:head4][waitall:4][w:3]...", "[func:head]Şansın yaver \ngitmeyecek,[w:6] düşleme \nbile."}
		nrus={"[func:Peachy]Да[waitall:4][w:3]...[waitall:1][w:3] Я слышу тебя.[w:6] \nХватит спорить[waitall:4][w:3]...", "Аззи,[w:3] ты всегда[waitall:4][w:3]...[waitall:1][w:3][func:head4] \nбыл плаксой[waitall:4][w:3]...", "[waitall:4][w:3]...", "[func:Peachy]Ох,[w:3][func:mercy] я опять \nотвлеклась?", "[func:Peachy]Извини[waitall:4][w:3]...", "Эти голоса[waitall:4][w:3]...[waitall:1][w:3] \n[func:Remember]Их слишком много.", "[func:head4]Я будто слышу \nкаждого монстра,[w:3] \nчто ты убил.", "Каждого[waitall:4][w:3]...[waitall:1][w:3] [func:sad]И никого \nодновременно[waitall:4][w:3]...", "[func:head4][func:head4][waitall:4][w:3]...", "[func:head]Я не дам тебе \nвоспользоваться \nмоими слабостями."}
		ruscom="Чара готовит Бластеры Хаоса[waitall:4][w:3]...[waitall:1][w:5]\nПогоди,[w:3] мне это что-то напомнило[waitall:4][w:3]..."
		engcom="Chara Kaos Ateşleyicilerini hazırlıyor[waitall:4][w:3]...[waitall:1][w:5]\nBekle,[w:3] bu isim neden bu kadar tanıdık?"
		wav={"phase1/bullettest_bouncy"}
	elseif GetGlobal("progress")==21 then
		nrus={"[func:NoMercy1]Я изучала тебя.", "[func:Think]Следила за каждым \nтвоим шагом.[w:6] [func:head]И \nпришла к некоторым \nинтересным выводам.", "[func:NoMercy1]Азриэль верил,[w:3] что \nты великий человек.[w:6] \n[func:Think]Так и есть.", "[func:NoMercy1]Но твоя \nвеличественность \nвовсе не во благе.[w:6][func:head]\nА в пороке."}
		neng={"[func:NoMercy1]Seni inceledim.", "[func:Think]Her adımını takip \nettim.[w:6] [func:head]\nVe birkaç ilginç \nsonuç için buraya \ngeldim.", "[func:NoMercy1]Asriel iyi biri \nolduğuna inanmıştı.[w:6] \n[func:Think]Öylesin.", "[func:NoMercy1]Ama senin iyiliğin \nsende değil,[w:3] [func:head]\ngünahlarında."}
		engcom="Çekinme.[w:6] \nBu bir dayanıklılık savaşı."
		ruscom="Не колеблись.[w:6] \nЭто бой на выносливость."
		wav={"phase1/asrielaser"}
	elseif GetGlobal("progress")==22 then
		nrus={"[func:NoMercy1]Твой порок - \n[func:head]неутолимый голод.", "Ты жаждешь всё \nбольше и больше.", "Твоя жадность \nпоглощает собой \nвесь мир.", "[func:Think]Для тебя нет \n<чужого>.[waitall:1][w:6] [func:head]\nЕсть лишь [waitall:2][w:1]<мое>", "[func:NoMercy1]И именно поэтому \nты раз за разом \nуничтожаешь всё,[w:3] \nчто мне дорого.", "[func:head]Ты ненасытен."}
		neng={"[func:NoMercy1]Kötülüğe [func:head]açsın.", "Daha fazlasını \nistiyorsun.", "Bencilliğin tüm \ndünyayı yiyip \nbitiriyor.", "[func:Think]Senin için orada \n<başkaları> yok,[waitall:1][w:3] [func:head]ama[waitall:2] \n<benim> var[waitall:1],[w:3] değil mi?", "[func:NoMercy1]Ve bu sevdiğim her \nşeyi ardarda yok \netmenin sebebi.", "[func:head]Açgözlüsün."}
		engcom="Tüm bu açlık muhabbeti beni gerçekten açıktırdı[waitall:4][w:3]..."
		ruscom="После этой тирады захотелось \rперекусить[waitall:4][w:3]..."
		wav={"phase1/SoulOfHunger"}
	elseif GetGlobal("progress") == 23 then
		nrus={"[func:head4]Все эти разговоры \nо голоде[waitall:4][w:3]...", "Я[waitall:4][w:3]...[waitall:1][w:3] Я вспоминаю \nмамину выпечку[waitall:4][w:3]...", "[func:Peachy]Её голос[waitall:4][w:3]...[waitall:1][w:3] самый \nзвонкий.", "Я слышу его \nотчетливее других.", "[func:head4]Он[waitall:4][w:3]...[waitall:1][w:3] Он будто \nвыжигает мои уши[waitall:4][w:3]...", "[func:NoMercy1][waitall:4][w:3]...", "Взамен всей этой \nболи я[waitall:4][w:3]...[waitall:1][w:3] [func:head]Я выжгу \nтебя!" }
		neng={"[func:head4]Tüm bu açlık \nkonuşması[waitall:4][w:3]...", "Ben[waitall:4][w:3]...[waitall:1][w:3] \nAnnemin hamurişlerini \nhatırladım[waitall:4][w:3]...", "[func:Peachy]Onun sesi[waitall:4][w:3]...[waitall:1][w:3] \nEn şiddetli olanı.", "Onu çok net \nduyabiliyorum[waitall:4][w:3]...", "[func:head4]Ses[waitall:4][w:3]...[waitall:1][w:3] \nKulaklarımda \nyanıyor[waitall:4][w:3]...", "[func:NoMercy1][waitall:4][w:3]...", "Bu acının yerine,[w:3] \nBen[waitall:4][w:3]...[waitall:1][w:3] [func:head]\nSeni yakacağım!"}
		engcom="Sakın yanma."
		ruscom="Не обожгись."
		wav={"phase1/firespears"}
	elseif GetGlobal("progress") == 24 then
		nrus={"[func:thoughts]Я вижу это пламя[waitall:4][w:3]...", "[func:head4]И перед глазами \nмелькают образы из \nдетства.", "Пожар[waitall:4][w:3]...[waitall:1][w:3] \nДеревня[waitall:4][w:3]...", "[func:trigeredclosed]Гх[waitall:4][w:3]...[waitall:1][w:3] [func:trigered]Почему ты \nне можешь наконец \nсдохнуть?!", "Сгори в аду,[w:3] чертов \nпсих!"}
		neng={"[func:thoughts]Bu alevler[waitall:4][w:3]...", "[func:head4]Geçmişteki anılarım \ngibiler[waitall:4][w:3]...", "Ateş[waitall:4][w:3]...[waitall:1][w:3] \nKöy[waitall:4][w:3]...", "[func:trigeredclosed]Off[waitall:4][w:3]...[waitall:1][w:3] [func:trigered]\nNeden şimdi \nölmüyorsun?!", "Cehennemde yan,[w:3] \nlanet olası psikopat!"}
		engcom="Chara kızmış gibi.[w:6] \nBir nedenden dolayı[waitall:4][w:3]?.."
		ruscom="Чара выглядит безумной.[w:6] \nПо какой-то причине?"
		wav={"phase1/RandomFire"}
	elseif GetGlobal("progress") == 25 then
		nrus={"[func:Final_1]Погодите[waitall:4][w:3]...", "Я[waitall:4][w:3]...[waitall:1][w:3] [func:NoMercy1]Я поняла.", "[func:closedyesend]Ты такой же,[w:3] \nкак и они[waitall:4][w:3]...", "Жадный и полный \nненависти человек.", "[func:NoMercy1][waitall:4][w:3]...", "Сначала[w:6] я хотела \nтебе верить.[w:6] \n[func:Think]Правда,[w:3] хотела.", "[func:NoMercy1]Но сейчас[waitall:4][w:3]...[waitall:1][w:3] \nНет пощады таким,[w:3] \n[func:head]как ты." }
		neng={"[func:Final_1]Bekle[waitall:4][w:3]...", "Ben[waitall:4][w:3]...[waitall:1][w:3] [func:NoMercy1]\nAnladım.", "[func:closedyesend]Sen neredeyse onlar \ngibisin[waitall:4][w:3]...", "Açgözlü ve nefret \nedilesi bir insan.", "[func:NoMercy1][waitall:4][w:3]...", "Başlangıçta[w:6] sana \ninanmak istedim.[w:6]\n[func:Think]Gerçekten,[w:3] istedim.", "[func:NoMercy1]Ama şimdi[waitall:4][w:3]...[waitall:1][w:3] \n[func:head]Senin gibi biri \nmerhameti \nhak etmiyor ."}
		engcom="Chara dondu,[w:3] sana bakıyor. "
		ruscom="Чара замерла,[w:3] пристально глядя \rвам в глаза."
		Encounter.SetVar("evadelevel",2)
		wav={"phase1/NoMercyToYou"}
	elseif GetGlobal("progress") == 26 then
		nrus={"[func:Final_1]Казалось,[w:3] будто я \nувидела в твоих \nглазах раскаяние[waitall:4][w:3]...", "[noskip][func:QuietMusic][func:Final_5]Лишь на миг,[w:3] но[waitall:4][w:3]...", "Милое зеркальце.[w:9] \nПартнёр.[w:9] \nКомпаньон.", "[func:Final_5]Если ты[waitall:4][w:3]...[waitall:1][w:3] \nЕсли ты слышишь[waitall:4][w:3]...", "[func:Music,spare]Я[waitall:4][w:3]...[waitall:1][w:3][func:Final_1] [func:HideKnife]Я хочу дать \nтебе шанс[waitall:4][w:3]...", "[func:head4]Но если нет[waitall:4][w:3]...[waitall:1][w:3] \nЕсли я ошибаюсь[waitall:4][w:3]...", "[waitall:4][w:3]...", "[func:Final_7]То тогда я \nдействительно \nдура[waitall:4][w:3]...","[func:Peachy][w:10][func:mercy][next]"}
		neng={"[func:Final_1]Şey gibi hissettim[waitall:4][w:3]...[waitall:1][w:3] \nGözlerinden, vicdan \nazabı duyduğunu[waitall:4][w:3]...", "[noskip][func:QuietMusic][func:Final_5]Sadece bir anlığına,[w:3] \nama[waitall:4][w:3]...", "Arkadaşım.[w:9] \nOrtağım.[w:9]\nDostum.", "[func:Final_5]Eğer[waitall:4][w:3]...[waitall:1][w:3] \nEğer beni \nduyuyorsan[waitall:4][w:3]...", "[func:Music,spare]Ben[waitall:4][w:3]...[waitall:1][w:3] [func:Final_1][func:HideKnife]\nSana bir şans \nvermek istiyorum[waitall:4][w:3]...", "[func:head4]Ama dinlemiyorsan[waitall:4][w:3]...[waitall:1][w:3] \nEğer yanılıyorsam[waitall:4][w:3]...", "[waitall:4][w:3]...", "[func:Final_7]O zaman gerçekten \nbir aptal olmalıyım.","[func:Peachy][w:10][func:mercy][next]"}
		engcom="Chara sana ikinci bir şans veriyor.[w:10][speed:0.75] \n[color:8040ff]Sakın cüret etme, tatlım..."
		ruscom="Чара дает вам второй шанс. \n[w:10][speed:0.75][color:8040ff]Даже не смей, дорогуша..."
		wav={"nothing"}
		Encounter.SetVar("forcedfight",true)
		Encounter.SetVar("FightGoes",false)
	elseif GetGlobal("progress") == 27 then
		nrus={"Гх!", "[func:deadly][waitall:4][w:3]...", "[func:closedyesend]Ну конечно[waitall:4][w:3]...", "[func:NoMercy1]Даже если ты \nи слышишь[waitall:4][w:3]...[waitall:1][w:3] \n[func:Think]Ты не выше \nпоследствий.", "[func:NoMercy1]Сила нашего с тобой \nУР[waitall:4][w:3]...[waitall:1][w:3] \n[func:Think]Слишком высока,[w:3] \nчтобы ей \nпротивостоять.", "[func:head]У тебя есть высшая \nцель.[w:6] \nКак и у меня.", "[func:Music,wound]Так что давай не \nбудем отступать от \nнеё."}
		neng={"Ah!", "[func:deadly][waitall:4][w:3]...", "[func:closedyesend]Her şey ortada[waitall:4][w:3]...", "[func:NoMercy1]Beni duyuyorsan bile[waitall:4][w:3]...[waitall:1][w:3] \n[func:Think]Sonuçlardan üstün \ndeğilsin.", "[func:NoMercy1]SV'mizin gücü[waitall:4][w:3]...[waitall:1][w:3] \n[func:Think]Direnmek için fazla \nyüksek.", "[func:head]Tamamlaman gereken \nmutlak bir görevin var.[w:6] \nBenimde var.", "[func:Music,wound]Yani, hadi dikkatimiz \ndağılmasın."}
		ruscom="Чара разочарована в вас."
		engcom="Chara hüsrana uğramış gibi görünüyor."
		wav={"phase1/shadows"}
		Encounter.SetVar("forcedfight",false)
		Encounter.SetVar("FightGoes",true)
		Encounter.SetVar("globalstage","2")
		Encounter.Call("WriteSavio")
------------------------------------------------------------------------
	elseif GetGlobal("progress") == 28 then
		nrus={"[func:head]Мой папа,[w:3] Асгор,[w:3] \nизучал мою Душу.", "[func:NoMercy1]Он изучал,[w:3] что \nтакое человеческая \nРешимость.", "[func:Think]Он добился \nинтересных \nрезультатов.[w:6] \nКак я считаю.", "[func:NoMercy1]Ты,[w:3] конечно же,[w:3] \n[func:Bad]знаешь о \nфункциональном \nменю и \nСохранениях[waitall:4][w:3]...", "[func:NoMercy1]Но ты понятия не \nимеешь о[waitall:4][w:3]...[waitall:1][w:3] [func:head]\n[waitall:2]Деформировании[waitall:1][w:3]."}
		neng={"[func:head]Babam,[w:3] Asgore,[w:3] \nruhum üzerine çalıştı.", "[func:NoMercy1]İnsan azmi üzerine \nçalıştı.", "[func:Think]Ve ilginç sonuçlar ile \nkarşılaştı.", "[func:NoMercy1]Elbette,[w:3] [func:Bad]kullanışlı \nmenüyü ve \nkaydetmeyi \nbiliyorsun[waitall:4][w:3]...", "[func:NoMercy1]Ama bu nedir hiçbir \nfikrin yok[waitall:4][w:3]...[waitall:1][w:3] [func:head][w:3][waitall:2]\nKatman \nbirleştirme[waitall:1]nin ne \nolduğunu bilmiyorsun."}
		engcom="İşler ilginç olmaya başladı."
		ruscom="Теперь это кажется интересным."
		wav={"phase1/listopad"}
	elseif GetGlobal("progress") == 29 then
		nrus={"[func:NoMercy1]Когда папа смог \nсинтезировать \nискусственную \nРешимость[waitall:4][w:3]...", "[func:head4]Она не прижилась.[w:6] \n[func:sad]Тела монстров были \nобезображены.[w:6] \nОни слились в \nАмальгамов.", "[func:head4]Ты знаешь эту \nисторию.", "Однако[waitall:4][w:3]...[waitall:1][w:3] Был второй \nэксперимент.[w:6] \nПохожий.", "[func:NoMercy1]Но с моей \nРешимостью.", "[func:Think]С естественной.[w:6] Я \nприняла выведенную \nим искусственную \nРешимость.", "[func:NoMercy1]И[waitall:4][w:3]...[waitall:1][w:3] [func:head]И это дало свои \nплоды."}
		neng={"[func:NoMercy1]Babam azmi \nsentezleyerek yapay \nolarak oluşturdu[waitall:4][w:3]...", "[func:head4]Bu bir hataydı.[w:6] \n[func:sad]Canavar vücutları \nbunu kaldıramadı ve \neriyip \nkarmançormanlara \ndönüştüler.", "[func:head4]Bu hikayeyi \nbiliyorsun.", "Belki[waitall:4][w:3]...[waitall:1][w:3] \nBurada buna benzer \nbaşka bir deney \nvardı.", "[func:NoMercy1]Ama benim azmim \nüzerine.", "[func:Think]Doğal olan.[w:6] \nKendime yapay azim \naşıladım.", "[func:NoMercy1]Ve[waitall:4][w:3]...[waitall:1][w:3] [func:head]\nİşe yaradı."}
		engcom="Bu hikayeyi daha önce duydum mu[waitall:4][w:3]?.."
		ruscom="Мне кажется, или я слышал эту историю[waitall:4][w:3]?.."
		wav={"phase1/krug"}
	elseif GetGlobal("progress") == 30 then
		Encounter.SetVar("evadelevel",3)
		nrus={"[func:NoMercy1]Помимо текущего \nтаймлайна \nпараллельно \nсуществует \nмножество других.", "[func:head4]Я[waitall:4][w:3]...[waitall:1][w:3] Я увидела их.[w:6][func:sad]\nКогда Решимость \nначала реакцию.", "Я видела хорошие \nконцовки,[w:3] \nальтернативные \nверсии себя[waitall:4][w:3]...", "Даже[waitall:4][w:3]...[waitall:1][w:3] [waitall:2][w:3][func:deadly]себя[waitall:1][w:3] на \nтвоем месте.", "[func:head4]Всё это[waitall:4][w:3]...[waitall:1][w:3] [func:thoughts]не \nукладывалось у меня \nв голове.", "[func:head4]Тогда я не понимала,[w:3] \nк чему были эти \nобразы.", "[func:head4]Сейчас[waitall:4][w:3]...[waitall:1][w:3] [func:NoMercy1]Я всё \nпоняла.[w:6] [func:head]\nНе трудно сложить \nдва и два."}
		neng={"[func:NoMercy1]Bu zaman çizelgesi \ndışında başkaları da \nvar.", "[func:head4]Ben[waitall:4][w:3]...[waitall:1][w:3] \nOnları gördüm.[w:6][func:sad]\nAzmim tepki vermeye \nbaşladığında.", "İyi sonlar gördüm,[w:3] \nalternatif benleri[waitall:4][w:3]...", "Hatta[waitall:4][w:3]...[waitall:1][w:3] [waitall:2][w:3][func:deadly]\nKendimi[waitall:1][w:3] senin \nyerindeyken.", "[func:head4]Tüm bunlar[waitall:4][w:3]...[waitall:1][w:3] \n[func:thoughts]Aklımı uçurdu.", "[func:head4]O gün ne gördüğümü \nanlayamadım.", "Ama şimdi[waitall:4][w:3]...[waitall:1][w:3] [func:NoMercy1]\nAçıkça anlıyorum.[w:6] [func:head]\nBir ve biri toplamak \no kadar zor değil."}
		engcom="Chara akıl sağlığının bir kısmını yeniledi.[w:6] \nAma şu an çok bitkin."
		ruscom="Чара восстанавливает ясность ума.[w:6]\nНо настолько же она и устала."
		--Encounter.SetVar("wavetimer", 20.0)
		wav={"phase1/k_storm"}
	elseif GetGlobal("progress") == 31 then
		nrus={"[func:Peachy]Андайн\nбеспокоилась,[w:3] что \nАсгор зря ввязал \nменя,[w:3] ребенка,[w:3] в \nсвои работы.", "Она настаивала,[w:3] \nчтобы я больше не \nвмешивалась.", "[func:Remember]Мои силы были \nслишком ценны для \nеё боевой арены.", "[func:Peachy]Она не хотела \nтерять такого \nоппонента,[w:3] как я.", "[func:mercy]Мне льстила такая \nвысокая оценка.", "[func:Peachy]Андайн умела \nподнять боевой \nдух.[w:6] Азриэль всегда \nей вдохновлялся.", "[func:NoMercy1][waitall:2]Теперь[waitall:1][w:6] [func:head]моя очередь."}
		neng={"[func:Peachy]Undyne Asgore'un \nbeni teşvik etmesinde \nyanlış olmasından \nendişelendi,[w:3] \ndeneylerinde,[w:3] bir \nçocuk.", "Beni rahatsız \netmemek için ısrar \netti.", "[func:Remember]Güçlerim onun savaş \narenası için çok \ndeğerliydi.", "[func:Peachy]Benim gibi değerli bir \ndövüşçüyü kaybetmek \nistemedi.", "[func:mercy]Bu kadar saygıdan \nmemnundum.", "[func:Peachy]Undyne senin savaş \nbecerini her zaman \nyükseltebilir.[w:6] \nAsriel ondan ilham \nalıyordu.", "[func:NoMercy1][waitall:2]Şimdi[waitall:1][w:6] [func:head]yani ben."}
		engcom="Sushi soğuk ve bıçaksız olarak servis edildi."
		ruscom="Суши подаются холодными и без ножей."
		wav={"phase1/und"}
	elseif GetGlobal("progress") == 32 then
		nrus={"[func:NoMercy1]Теперь,[w:3] когда я \nизучаю таймлайны,[w:3] \n[func:Think]я всё больше и \nбольше понимаю, как \nработает моя память", "[func:NoMercy1]Тот раз,[w:3] когда я \nприняла \nискусственную \nРешимость,[w:3] стал \nрешающим фактором.", "Ты понимаешь,[w:3][func:Bad] о \nчем я?", "[w:2][waitall:2][func:NoMercy1]Да[waitall:4][w:3]...[waitall:1][w:3] Именно в тот \nдень [w:6][func:head]я получила \nспособность читать \nвременные линии."}
		neng={"[func:NoMercy1]Şimdi,[w:3] tüm o zaman \nçizelgelerine çalışmış \nolarak,[w:3] [func:Think]hafızamı daha \niyi anlayabiliyorum.", "[func:NoMercy1]Gerçek için bir \nanahtardı,[w:3] yapay \nazmi aşıladığımda.", "[func:Bad]Ne demek istediğimi \nanladın mı?", "[w:2][waitall:2][func:NoMercy1]Evet[waitall:4][w:3]...[waitall:1][w:3] \nO gün[w:6] [func:head]zaman \nçizelgelerini \nokuyabilir oldum."}
		engcom="O[waitall:4][w:3]...[waitall:1][w:3] \nO [waitall:2][w:3]ne?"
		ruscom="Она[waitall:4][w:3]...[waitall:1][w:3] Она [waitall:2][w:3]что?"
		wav={"phase1/stoplights"}
	elseif GetGlobal("progress") == 33 then
		nrus={"[func:head4]Не знаю,[w:3] что это \nбыло.[w:6] Судьба,[w:3] карма.[w:6] \n[func:sad]Без разницы.", "Главное,[w:3] [func:head4]что я \nблагодарю и \nпроклинаю эту силу \nодновременно.", "[func:sad]Из-за неё я вижу \nсмерти близких мне \nлюдей каждый \nраз,[w:3] как открываю \nглаза.", "[func:NoMercy1]Но с другой?[w:6] [func:head]Я как \nникогда ближе к \nтому,[w:3] чтобы изгнать \nтебя.", "[func:NoMercy1]Твоя сила[waitall:4][w:3]...[waitall:1][w:3] [func:Bad]Ты \nзнаешь о других \nтаймлайнах?", "[func:head]Ты как никто другой \nзнаешь,[w:3] что я хочу \nсделать."}
		neng={"[func:head4]Buna ne demeliyim \nbilmiyorum.[w:6] \nFate [w:3]yada karma, [w:3][func:sad]\nher neyse.", "Ne önemi var ki? [w:3] [func:head4]\nBu güçten nefret \neder oldum.", "[func:sad]Onunla, her gözümü \naçtığımda \nakrabalarımın \nöldüğünü gördüm.", "[func:NoMercy1]Ama orada?[w:6] [func:head]\nSeni yenmeye \nyaklaşamıyordum bile.", "[func:NoMercy1]Senin gücün[waitall:4][w:3]...[waitall:1][w:3] [func:Bad]\nDiğer zaman \nçizelgelerini \nbiliyorsun,[w:3] değil mi?", "[func:head]Kimse olarak ne \nyapmak istediğimi \nbilmiyorsun."}
		engcom="Bizi kendi silahımız ile yenmeye çalışıyor.[w:6] Bu kaygan sincabı hemen yakala!"
		ruscom="Она пытается одолеть нас нашим же оружием.[w:6] Поймай же эту изворотливую белку!"
		wav={"phase1/brave"}
	elseif GetGlobal("progress") == 34 then
		nrus={"[func:head4]Наш Король[waitall:4][w:3]...", "[func:sad]Я дала ему клятву,[w:3] \nчто остановлю \nлюбого человека,[w:3] \nкоторый станет на \nпути Стражи.", "[func:head4]Он желает твоей \nсмерти так же,[w:3] \nкак и я.", "[func:NoMercy1]Его мотивы,[w:3] а \nтеперь и его сила[waitall:4][w:3]...", "Я будто с ним на \nодной волне.[w:6] [func:head]\nМоя воля никогда \nне была так крепка."}
		neng={"[func:head4]Kralımıza[waitall:4][w:3]...", "[func:sad]Hiçbir insanın muhafızı \ngeçemeyeceğine söz \nverdim.", "[func:head4]O da benim yaptığım \ngibi ölmeni diliyor.", "[func:NoMercy1]Nedenleri ve şimdi [w:4] \ngücü[waitall:4][w:3]...", "Sanki yanımda gibi.[w:6] \n[func:head]İradem hiç bu kadar \ngüçlü olmamıştı."}
		engcom="Sanki bu durum[waitall:4][w:3]...[waitall:1][w:3] \nOnu iliklerine kadar kesmiş gibi.[w:6]\nHe-he"
		ruscom="Похоже,[w:3] эта ситуация[waitall:4][w:3]...[waitall:1][w:3] проняла её до костей.[w:6]\nХе-хе"
		wav={"phase1/2lasers"}
	elseif GetGlobal("progress") == 35 then	
		nrus={"[func:Final_7]Как иронично,[w:3] что я \nстолько раз видела \nего смерть[waitall:4][w:3]...", "[func:Irony]В тех,[w:3] других \nтаймлайнах[waitall:4][w:3]...", "[func:head4]А в этом[waitall:4][w:3]...[waitall:1][w:3] [func:sad]При \nнашей первой \nвстрече он был \nготов убить меня.", "[func:NoMercy1]И какова ирония[waitall:4][w:3]...[waitall:1][w:3] \n[func:Think]Сейчас я служу ему.[w:6] \n[func:NoMercy1]Зная,[w:3] что скоро \nпробьет его час.", "[func:head4][waitall:4][w:3]...", "Может[waitall:4][w:3]...[waitall:1][w:3] Было бы \nлучше,[w:3] [func:sad]убей он меня \nтогда?","[func:head][next]"}
		neng={"[func:Final_7]Ne kadar da ironik,[w:3] \nonun ölümünü \ndefalarca gördüm[waitall:4][w:3]...", "[func:Irony]Tüm o,[w:3] diğer zaman \nçizelgelerinde.", "[func:head4]Ama benimkinde[waitall:4][w:3]...[waitall:1][w:3] [func:sad]\nBeni ilk görüşte \nöldürmeye niyetliydi.", "[func:NoMercy1]Ve şimdi ironik olarak,[w:3] [func:Think]\nşimdi onun \nhizmetindeyim.[w:6] \n[func:NoMercy1]Ve onun zamanının \ndolduğunu biliyorum.", "[func:head4][waitall:4][w:3]...", "Belkide[waitall:4][w:3]...[waitall:1][w:3] [func:sad]\nO gün beni öldürmüş \nolsaydı daha iyi \nolurdu[waitall:4][w:3]?..","[func:head][next]"}
		engcom="Chara kasvetle gülüyor."
		ruscom="Чара печально ухмыляется."
		wav={"phase1/sans3"}
	elseif GetGlobal("progress") == 36 then
		nrus={"[func:head]А ведь он[waitall:4][w:3]...[waitall:1][w:3] [func:NoMercy1]Он \nведь даже не \nподозревает.", "[func:Think]Сидит в тронном \nзале, ожидает \nчеловека[waitall:4][w:3]...", "С которым у него \nдолжен пройти бой \nза 'судьбу' монстров", "[func:NoMercy1]Знал бы он, что на \nсамом деле \nпроисходит[waitall:4][w:3]...", "[func:Final_7]Это был бы слишком \nсильный удар для \nнего[waitall:4][w:3]...","[func:head][next]"}
		neng={"[func:head]Ve o[waitall:4][w:3]...[waitall:1][w:3] [func:NoMercy1]\nOnun halen neler \nolduğundan \nhaberi yok.", "[func:Think]Taht odasında bir \ninsanın gelmesini \nbekliyor[waitall:4][w:3]...", "Canavarların \n'kaderini' \nbelirleyecek o \nsavaşın gelmesini \nbekliyor.", "[func:NoMercy1]Ortada karar \nverilebilecek bir şey \nolmaması ne kadar da \nacınası[waitall:4][w:3]...", "[func:Final_7]Onun için çok sert bir \nvuruş olurdu[waitall:4][w:3]...","[func:head][next]"}
		engcom="Atağımızın ne kadar sert olacağını düşünseydi onun için daha iyi olurdu.[waitall:4][w:3]...[waitall:1][w:3]"
		ruscom="Лучше бы подумала о том,[w:3] каким сильным будет наш удар по ней[waitall:4][w:3]...[waitall:1][w:3]"
		wav={"phase1/sansnew"}
		currentdialogue = {"[noskip]"}
	elseif GetGlobal("progress") == 37 then
		nrus={"[func:head]Я[waitall:4][w:3]...[waitall:1][w:3] [func:head4]Я не буду врать.", "Я устаю.[w:6] [func:sad]Ты и сам \nэто понимаешь.", "[func:head4]И эти голоса в \nголове[waitall:4][w:3]...[waitall:1][w:3] они \nне утихают.[w:6] Они всё \nгромче и громче.", "[func:sad]Что,[w:3] если даже этой \nсилы будет мало?[w:6] \nЧто,[w:3] если я вновь \nпроиграю?", "[func:NoMercy1]Черт,[w:3] если бы я \nзнала.", "Поживем [w:4]- увидим,[w:3][func:head] \nверно?[w:6] Хех[waitall:4][w:3]..."}
		neng={"[func:head]Ben[waitall:4][w:3]...[waitall:1][w:3] [func:head4]\nYalan söylemeyeceğim.", "Yoruluyorum.[w:6] \n[func:sad]Ve sende tabiki \nbunun farkındasın.", "[func:head4]Ve kafamdaki o \nsesler[waitall:4][w:3]...[waitall:1][w:3] \nSakinleşmiyorlar.[w:6] \nSadece [w:4]daha da \ngüçleniyorlar.", "[func:sad]Ya bu güç bile \nyeterli olmaz ise?[w:6] \nYa yine kaybedersem?", "[func:NoMercy1]Kahretsin,[w:3] ah bir \nbilsem.", "Sonunda öğreneceğiz,[w:3][func:head] \ndeğil mi?[w:6] \nHeh[waitall:4][w:3]..."}
		engcom="Büyük ihtimalle görürüz.[w:6]\nOnun görebileceğinden pek emin değilim."
		ruscom="Мы,[w:3] может,[w:3] и поживём.[w:6]\nОна -[w:3] вряд ли."
		wav={"phase1/kniferain"}
		currentdialogue = {"[noskip]"}
	elseif GetGlobal("progress") == 38 then
		nrus={"Хотя,[w:3] [func:NoMercy1]что тебе \nзнать о лишениях?", "[func:head]Ты ведь так жестоко \nрасправился с \nпитомцем Маффет[waitall:4][w:3]...", "Я лично ухаживала \nза ним.[w:6] Он был \nпочти что моим \nпитомцем.", "[func:sad]Если бы Маффет,[w:3] \nконечно,[w:3] знала \nслово [waitall:2][w:3]<делиться>[waitall:4][w:3]...", "[func:NoMercy1]А затем пришел ты.[w:6] [func:head]\nЖестоко \nрасправился с ними \nобоими[waitall:4][w:3]...", "[func:head4]Не знаю,[w:3] почему[waitall:4][w:3]...[waitall:1][w:3] \nНо во мне даже нет \nзлости,[w:3] когда я \nдумаю о паукексе.", "Только [waitall:2][w:3]звенящая \nпустота[waitall:1][w:3] в груди.", "Интересно.[w:6] [func:sad]\nК чему бы это?","[func:head][next]"}
		neng={"Düşün [w:3][func:NoMercy1]tanıdığın birini \nkaybetmek nasıl bir \nduygu?", "[func:head]Muffet'ın evcil \nhayvanını acımasızca \nöldürdün[waitall:4][w:3]...", "Onunla bizzat \nilgilendim.[w:6] \nNeredeyse kendi \nevcil hayvanım gibiydi.", "[func:sad]Olabilirdi de,[w:3] eğer \nMuffet [waitall:2][w:3]<paylaşmak> \nkelimesini bilseydi[waitall:4][w:3]...", "[func:NoMercy1]Ama sen geldin.[w:6] [func:head]\nVe ikisininde \ngitmesine neden \noldun[waitall:4][w:3]...", "[func:head4]Neden bilmiyorum[waitall:4][w:3]...[waitall:1][w:3] \nAma o çörümceği \ndüşünmekten kızgın \ndeğilim.", "Sadece göğsümde \nçınlayan [waitall:2][w:3]sessiz bir \nboşluk[waitall:1][w:3].", "İlginç.[w:6] [func:sad]\nNeden?","[func:head][next]"}
		engcom="Bir örümcek dansına ne dersin?[w:6]\nO aptal şakayı unutması ne kadar da rahatlatıcı."
		ruscom="Как насчёт танца с пауками?[w:6]\nКак хорошо,[w:3] что она избавилась от этой тупой шутки."
		wav={"phase1/muffet"}
		currentdialogue = {"[noskip]"}
	elseif GetGlobal("progress") == 39 then
		nrus={"[func:head4]Так сложно просто \nперестать \nзаботиться.", "[func:sad]Перестать \nволноваться \nо пустяках и \nотпустить любую \nмотивацию.", "[func:head4]Буги смог,[w:3] потому \nчто он бездушный \nцветок[waitall:4][w:3]...", "[func:thoughts]А у меня есть \nстремления.[w:6] Рвения.[w:6] \nНадежды и мечты.", "[func:NoMercy1]Я не могу[waitall:4][w:3]...[waitall:1][w:3] [func:head]Не могу \nпозволить тебе их \nразрушить."}
		neng={"[func:head4]Her şeyi akışına \nbırakmak kolay değil.", "[func:sad]Detayları  ve \nherhangi bir \nmotivasyonu \nunutmak için.", "[func:head4]Boogie bunu yapabilir,[w:3] \nçünkü o ruhsuz bir \nçiçek[waitall:4][w:3]...", "[func:thoughts]Ama benim kendi \nsloganım,[w:6] hedeflerim,[w:6] \numutlarım ve \nhayallerim var.", "[func:NoMercy1]Seni bırakamam[waitall:4][w:3]...[waitall:1][w:3] \n[func:head]Onları mahvetmene \nizin veremem."}
		engcom="Umutlar ve hayaller[waitall:4][w:3]...[waitall:1][w:3] Ne büyük bir dert.[w:6]\nTüm bunlar çok [w:3]-[w:3] IŞILTILI."
		ruscom="Надежды и мечты[waitall:4][w:3]...[waitall:1][w:3] Что за вздор.[w:6]\nВсё, что имеет значение [w:3]-[w:3] ГЛАМУР."
		wav={"phase1/field"}
		currentdialogue = {"[noskip]"}
	elseif GetGlobal("progress") == 40 then
		Encounter.SetVar("evadelevel",4)
		nrus={"[func:NoMercy1]Какое тебе дело до \nнас,[w:3] не так ли?", "[func:head4]Буги рассказывал \nмне,[w:3] что есть сила,[w:3] \nкоторая \nпревосходит \nРешимость.", "[func:sad]Я ему не поверила.[w:6] \n[func:NoMercy1]Но,[w:3] кажется,[w:3] теперь \nэто очевидно.", "[func:head]Наша с тобой \n[waitall:2][w:3]ЛЮБОВЬ.", "[func:Think]Неважно,[w:3] сколько у \nнас Решимости,[w:3][func:head] лишь \n[waitall:2][w:3]ЛЮБОВЬ[waitall:1] -[w:3] мерило \nнаших сил."}
		neng={"[func:NoMercy1]Bu nede olsa senin \nişin değil,[w:3] değil mi?", "[func:head4]Boogie bana azimden \ndaha güçlü bir güç \nolduğunu söyledi.", "[func:sad]O sıralar ona \ninanmamıştım.[w:6] [func:NoMercy1]\nAma şimdi, bu apaçık \nortada.", "[func:head]SEVGİMİZ.", "[func:Think]Ne kadar azimli \nolduğumuzun bir önemi \nyok,[w:3] eğer hiç [waitall:2][w:3]SEVGİ[waitall:1][w:3] \nelde etmez isek,[w:3][func:head] \ndeğil mi?"}
		engcom="Chara kaotik derecede normal gözüküyor.."
		ruscom="Чара выглядит хаотично нейтральной."
		currentdialogue = {"[noskip]"}
		wav={"phase1/buggy1"}
	elseif GetGlobal("progress") == 41 then
		nrus={"[func:head4]Подобно этим \nсеменам \nразлетелись [func:sad]\nнаши жизни[waitall:4][w:3]...", "[func:head4]Этот танец \nнапоминает мне \nо прошлом,[w:3] что \nбеспощадно \nулизнуло[waitall:4][w:3]...", "У меня больше нет \nни дома,[w:3] \nни семьи,[w:3] \nни цели в жизни[waitall:4][w:3]...", "[func:deadly]И во всём[waitall:4][w:3]...[waitall:1][w:3] [func:closedyesend]\nВиноват[waitall:4][w:3]...[waitall:1][w:3] [func:head]\nТы[waitall:4][w:3]..."}
		neng={"[func:head4]Yaşamlarımız tüm o [func:sad]\ntaç yaprakları gibi \nuçup gidiyor[waitall:4][w:3]...", "[func:head4]Bu dans bana kayıp \ngeçmişimi hatırlatıyor[waitall:4][w:3]...", "Evim yok,[w:3] \nailem yok,[w:3] \nhayatta bir hedefim \nyok[waitall:4][w:3]...", "[func:deadly]Ve tüm bunlar[waitall:4][w:3]...[waitall:1][w:3] \n[func:closedyesend]Senin[waitall:4][w:3]...[waitall:1][w:3] \n[func:head]Hatan[waitall:4][w:3]..."}
		engcom="Suçunu inkar etmek kabalık olur."
		ruscom="Невежливо спихивать свои ошибки на других."
		wav={"phase1/buggy2"}
	elseif GetGlobal("progress") == 42 then
		nrus={"[func:head4]Виноват[waitall:4][w:3]...[waitall:1][w:3] [func:NoMercy1]\nДа[waitall:4][w:3]...", "[func:head]Да,[w:3] черт возьми!", "А-ха-ха-ха!!", "[func:Think]Я такая дура и \n[func:head]вправду!!", "[func:NoMercy1]Ведь ты[waitall:4][w:3]...[waitall:1][w:3] [func:head]Это ты \nразрушил наш мир[waitall:4][w:3]...[waitall:1][w:3] \n[func:Think]Нет моей вины в \nтом,[w:3] что я не \nсмогла его \nзащитить!", "[func:NoMercy1]Это ты[waitall:4][w:3]...[waitall:1][w:3] [func:head]\nТвоя вина![w:6] \nТвоя вина!!"}
		neng={"[func:head4]Suç[waitall:4][w:3]...[waitall:1][w:3] [func:NoMercy1]\nEvet[waitall:4][w:3]...", "[func:head]Evet,[w:3] lanet olsun!", "A-ha-ha-ha-ha!!", "[func:Think]Tam bir aptalım,[w:3][func:head] \ngerçekten!!", "[func:NoMercy1]Bu sensin[waitall:4][w:3]...[waitall:1][w:3] [func:head]\nDünyamızı yok ettin[waitall:4][w:3]...[waitall:1][w:3] \n[func:Think]Onu korumadığım için \nsuçlanacak olan \nben değilim!", "[func:NoMercy1]Sensin[waitall:4][w:3]...[waitall:1][w:3] [func:head]\nSenin hatan![w:6] \nSenin hatan!!"}
		engcom="Tamam,[w:3] şimdi o kaotik derecede kötü."
		ruscom="Окей,[w:3] теперь она хаотично зла."
		wav={"phase1/k_3"}
		Encounter.SetVar("evadelevel",5)
	elseif GetGlobal("progress") == 43 then
		Encounter.SetVar("evadelevel",6)
		dodge=false
		block=true
		if GetGlobal("pray")<4 then
			SetGlobal("pray",4)
		end
		nrus={"[func:start1][func:head4]Хватит![w:6] [func:trigeredclosed]С меня \nдовольно этих \nдетских игр!!", "Давай,[w:3][func:trigered][func:EpicKnife] покажи,[w:3] \nна что ты способен!", "Я не дам тебе \nпройти дальше![w:6] \nНи за что!!", "Ты будешь вечно \nумирать и \nвозвращаться,[w:3] \nумирать и \nвозвращаться!", "[func:trigeredclosed]Это мой последний \nоплот!", "[func:Bloodshed][func:trigered]Да начнется \nкровопролитие!!","[func:MoveToCenter][next]"}
		neng={"[func:start1][func:head4]Yeter![w:6] [func:trigeredclosed]\nTüm bu oyunundan \nbıktım!!", "Hadi gel,[w:3][func:trigered][func:EpicKnife] neyin var \ngöster!", "Beni geçmene izin \nvermeyeceğim![w:6] \nAsla!!", "Sonsuza kadar ölüp \ndöneceksin,[w:3] \nölüp döneceksin!", "[func:trigeredclosed]Bu benim son \ndirenişim!", "[func:Bloodshed][func:trigered]Katliam başlasın!!","[func:MoveToCenter][next]"}
		engcom="Demek sert oynamak istiyor[waitall:4][w:3]...[waitall:1][w:3] \nTamam babam."
		ruscom="Значит,[w:3] она хочет сыграть по-взрослому[waitall:4][w:3]...[waitall:1][w:3] \nХорошо,[w:3] папик."
		Encounter.SetVar("phase",1.5)
		wav={"phase1.5/easy"}
		Encounter.SetVar("globalstage","3")
		Encounter.Call("WriteSavio")
		Encounter.SetVar("ghostsnow",{"Asriel_Sprite"})
	elseif GetGlobal("progress") == 44 then
		nrus={"Ты даже \nпредставить себе \nне можешь,[w:3] каково \nэто!", "Ты просто ведешь \nсебя как кусок \nдерьма!", "[func:trigeredrem]Каждый раз ты \nвтаптываешь меня \nи мой мир в грязь!", "[func:trigered]Да ты сам кусок \nжалкой и мерзкой \nгрязи!!"}
		neng={"Nasıl hissettirdiğini \nhayal bile edemezsin!", "Aşağılık biri gibi \ndavranıyorsun!", "[func:trigeredrem]Beni ve dünyamı her \nseferinde çamura \nittiğinde!", "[func:trigered]Evet, sen sefil ve \niğrenç bir pisliksin!!"}
		engcom="Şu an şaka yapmıyor![w:6] \nDikkatin dağılmasın,[w:3] onu yor!"
		ruscom="Она не шутит![w:6] Не отвлекайся,[w:3] надо её измотать!"
		wav={"phase1.5/BroFight"}
		Encounter.SetVar("ghostsnow",{"Toriel_Sprite","Asgore_Sprite"})
	elseif GetGlobal("progress") == 45 then
		nrus={"Я доверяла не тому \nчеловеку!", "[func:trigeredrem]Может,[w:3] мне вообще \nникому не стоило \nдоверять!", "Все одинаковые![w:6] [func:trigeredclosed]\nЛживые и наивные \nидиоты!", "Никого не волнует,[w:3] \nчто я чувствую! [w:6][func:trigered]\nС меня хватит!!"}
		neng={"Yanlış kişiye \ngüvendim!", "[func:trigeredrem]Belki de kimseye \ngüvenmemeliyimdir!", "Herkes aynı![w:6] [func:trigeredclosed]\nYalancı ve saf \naptallar!", "Nasıl hissettiğimi \nkimse anlamıyor![w:6] [func:trigered]\nBu kadarı yetti!!"}
		engcom="Cildin kemiklerine kadar yanıyor."
		ruscom="Ожоги прожигают твои кости."
		wav={"phase1.5/firehell"}
		Encounter.SetVar("ghostsnow",{"Alphys_Sprite","Muffet_Sprite","Undyne_Sprite"})
	elseif GetGlobal("progress") == 46 then
		nrus={"[func:trigeredclosed]Мне не стоило ни к \nкому привязываться!", "Завести питомца?![w:9] [func:trigeredrem]\nЗачем?!", "[func:trigeredclosed]Дружить с \nмонстрами?![w:9] \nКак же я была глупа!", "[func:trigered]Все,[w:3] все вы \nодинаковые!", "Никто не понимает \nменя![w:9] \nИ не пытается!"}
		neng={"[func:trigeredclosed]Kimseye \nbağlanmamalıyım!", "Bir evcil hayvanı mı \nvar?![w:9] [func:trigeredrem]\nNe için?!", "[func:trigeredclosed]Canavarlar ile \narkadaşlığı kesmek \niçin mi?![w:9] \nÇok aptaldım!", "[func:trigered]Hepiniz aynısınız!", "Kimse beni \nanlayamıyor,[w:3] sen \nbunun için uğraşmadın \nbile!"}
		engcom="Çürük kan gibi kokuyor[waitall:4][w:3]...[waitall:1][w:3]\nSınırımızdayız,[w:3] aktör."
		ruscom="Я чувствую запах гниющей крови[waitall:4][w:3]...[waitall:1][w:3]\nМы на пределе,[w:3] актер."
		wav={"phase1.5/spidercombo"}
		Encounter.SetVar("ghostsnow",{"Paps_Sprite","Sans_Sprite","Flowey_Sprite"})
	elseif GetGlobal("progress") == 47 then
		nrus={"Знаешь,[w:3] как я сюда \nпопала?![w:6] \n[func:trigeredclosed]Я сбежала!", "Сбежала от пожара,[w:3] \nкоторый сама же и \nустроила!", "[func:trigered]Да,[w:3] твою мать,[w:3] \nя спалила свою \nродную деревню![w:6] \nДотла!![w:6] \nДо тлеющих трупов!!!"}
		neng={"Buraya nasıl geldim \nbilmek ister misin?![w:6] [func:trigeredclosed]\nKaçtım!", "Başlattığım ateşten \nkaçtım!", "[func:trigered]Evet,[w:3] lanet olası,[w:3] \nkendi köyümü yaktım![w:6] \nSon evine kadar!![w:6] \nSon cesedine kadar!!!"}
		dodge=true
		block=false
		engcom="O[waitall:4][w:3]...[waitall:1][w:3] \nO [waitall:2][w:3]ne yaptı?!"
		ruscom="Она[waitall:4][w:3]...[waitall:1][w:3] Она [waitall:2][w:3]что?!"
		wav={"phase1.5/FullBloom"}
		Encounter.SetVar("evadelevel",2)
	elseif GetGlobal("progress") == 48 then
		nrus={"[func:trigeredclosed]Да,[w:3] ты правильно \nрасслышал!", "[func:trigered]Я ненавидела их![w:6] \nЯ хотела им смерти!", "[func:trigeredclosed]У меня было всё,[w:3] но \nв один момент жизнь \nотобрала у меня \nэто!", "Семью,[w:3] свободу,[w:3] \nжелание жить!", "Когда весь мой мир,[w:3] \nмоя деревня \nсгорела,[w:3] \nя сбежала \nв Подземелье!", "Раньше я мечтала,[w:3] \nчто покажу миру,[w:3] \nкакие монстры \nдобрые[waitall:4][w:3]...", "[func:trigered]А они -[w:6] ничем не \nлучше людей![w:6] [func:trigeredrem]Они \nхотели меня убить,[w:3] \nпотому что я \nчеловек!", "[func:trigeredclosed]Я ни человек,[w:3] ни \nмонстр!","Я[waitall:4][w:3]...[waitall:1][w:3] \nЯ [waitall:2]Д е м о н,[waitall:1][w:3] \n[func:trigered]понимаешь?!", "Вот моя сущность!"}
		neng={"[func:trigeredclosed]Evet,[w:3] duyduğun gibi!", "[func:trigered]Onlardan nefret \nettim![w:6] \nÖlmelerini istedim!", "[func:trigeredclosed]Hayal edebileceğim \nher şeye sahiptim,[w:3] \nama hayat hepsini \nyok etti!", "Ailemi,[w:3] özgürlüğümü,[w:3] \nhayatımı!", "Tüm dünyamı,[w:3] \nsevgili köyüm küllere \nbüründü,[w:3] \nYer altına geldim", "Düşüşümden kısa bir \nsüre önce \ncanavarların nasıl \nnazik ve sevecen \nolduklarını \ndüşündüm[waitall:4][w:3]...", "[func:trigered]Ama insanlar ile \naynıydılar![w:6] [func:trigeredrem]\nSırf insan olduğum \niçin beni öldürmek \nistediler!", "[func:trigeredclosed]Ama ben bir insan \ndeğilim,[w:3] yada bir \ncanavar!", "Ben[waitall:4][w:3]...[waitall:1][w:3] \nBen ş e y t a n ı m,[w:3] [func:trigered]\nanladın mı?!", "Bu benim!"}
		engcom="[waitall:4][w:3]...[waitall:1][w:3]O yoruldu."
		ruscom="[waitall:4][w:3]...[waitall:1][w:3]Она вымоталась."
		Encounter.SetVar("evadelevel",2)
		block=false
		dodge=true
		wav={"phase1.5/bereadytodie"}
	elseif GetGlobal("progress") == 49 then
		Encounter.SetVar("evadelevel",2)
		Encounter.SetVar("SuddenStrike",true)
		Encounter.SetVar("CharaIsRaging",false)
		nrus={"[noskip][func:trigeredclosed]И теперь[waitall:4][w:3]...", "[noskip][func:head4][func:NoEpicKnife][func:lowpitchmusic]Я не знаю,[w:3] \nзачем я живу[waitall:4][w:3]...", "[noskip]Я[waitall:4][w:3]...[waitall:1][w:3] Я больше не \nхочу жить[waitall:4][w:3]...[waitall:1][w:3] \nжить [waitall:2][w:3]так[waitall:4][w:3]...", "[noskip][func:tired][waitall:2][w:5]Я просто хочу \nпокоя[waitall:4][w:3]..."}
		neng={"[noskip][func:trigeredclosed]Ve şimdi[waitall:4][w:3]...", "[noskip][func:head4][func:NoEpicKnife][func:lowpitchmusic]Neden hala yaşadığımı \nbile bilmiyorum[waitall:4][w:3]...", "[noskip]Ben[waitall:4][w:3]...[waitall:1][w:3] \nYaşamak istemiyorum[waitall:4][w:3]...[waitall:1][w:3] \nBöyle [waitall:2][w:3]yaşamak[waitall:1][w:3] \nistemiyorum.", "[noskip][func:tired][waitall:2][w:5]Sadece barış \nistiyorum[waitall:4][w:3]..."}
		engcom="Zamanı geldi,[w:3] aktör![w:6] \nSaldır!"
		ruscom="Сейчас,[w:3] актер![w:6] Нападай!"
		Encounter.SetVar("FightGoes",2)
		wav={"nothing"}
		Encounter.SetVar("globalstage","4")
		Encounter.Call("WriteSavio")
		dodge=false
	elseif GetGlobal("progress") == 50 then
		nrus={"[func:thoughts]Кгха!", "[waitall:2][func:Cough1]*кашель*", "[func:SetMusic,star]Ты[waitall:4][w:3]...[waitall:1][w:3] Ты что,[w:3] \nранил меня[waitall:4][w:3]?..", "[func:head4]Я[waitall:4][w:3]...\n[waitall:1][w:3]Кха[waitall:4][w:3]...[waitall:1][w:3] \nНе может быть[waitall:4][w:3]...","[func:thoughts][func:MoveToCenter][next]"}
		neng={"[func:thoughts]Ahh!", "[waitall:2][func:Cough1]*öksürük*", "[func:SetMusic,star]Sen[waitall:4][w:3]...\n[waitall:1][w:3]Az önce beni \nyaraladın mı[waitall:4][w:3]?..", "[func:head4]Ama ben[waitall:4][w:3]...\n[waitall:1][w:3]Ah[waitall:4][w:3]...\n[waitall:1][w:3]Ama bu olamaz[waitall:4][w:3]...","[func:thoughts][func:MoveToCenter][next]"}
		engcom="Yaralandı!"
		ruscom="Она ранена!"
		Encounter.SetVar("phase",2)
		--G.,A.,M.,E .,H.,U.,N.,T.,E.,R.,S
		Encounter.SetVar("evadelevel",6)
	elseif GetGlobal("progress") == 51 then
		nrus={"Я[waitall:4][w:3]...[waitall:1][w:3] [func:head4]Я \nотвлеклась[waitall:4][w:3]?..", "[func:Final_7]И получила по \nзаслугам,[w:3] \nконечно[waitall:4][w:3]...", "[waitall:4][w:3]...", "[noskip][func:NoMercy1][func:SetMusic,none]Но даже если так[waitall:4][w:3]...[waitall:1][w:3]\n[func:head][func:Music2]Наш вопрос ещё не \nзакрыт."}
		neng={"Yine mi[waitall:4][w:3]...[waitall:1][w:3] [func:head4]\nYine mi daldım[waitall:4][w:3]?..", "[func:Final_7]Ve bunun için mi \ncezalandırıldım,[w:3] \nelbette[waitall:4][w:3]...", "[waitall:4][w:3]...", "[noskip][func:NoMercy1][func:SetMusic,none]Ama buna rağmen[waitall:4][w:3]...[waitall:1][w:3] \n[func:head][func:Music2]Hala cevaplanmamış \nsorularımız var."}
		engcom="Ne hakkında konuşuyor?[w:6]\nTüm cevaplara sahibim."
		ruscom="О чём она говорит?[w:6]\nМне всё предельно ясно."
		wav={"phase2/netkonzaidejam"}
		Encounter.SetVar("FightGoes",true)
	elseif GetGlobal("progress") == 52 then
		nrus={"[func:NoMercy1]Да,[w:3] ты,[w:3] наверное,[w:3] \nне понимаешь,[w:3] но[waitall:4][w:3]...", "[func:Think]Разве ты не хочешь \nопять уничтожить \nмир?", "[func:NoMercy1]Да,[w:3] ведь это твоя \nпервоначальная \nцель[waitall:4][w:3]...", "[func:head]Твоя [waitall:2][w:3]<миссия>[waitall:4][w:3]..."}
		neng={"[func:NoMercy1]Evet,[w:3] muhtemelen,[w:3] \nanlamadın,[w:3] ama[waitall:4][w:3]...", "[func:Think]Dünyayı bir daha yok \netmeyecek misin?", "[func:NoMercy1]Evet,[w:3] çünkü bu \nsenin amacın[waitall:4][w:3]...", "[func:head]Senin [waitall:2][w:3]<görevin>[waitall:4][w:3]..."}
		engcom="Ah evet[waitall:4][w:3]...[waitall:1][w:3] \nNeredeyse unutuyordum."
		ruscom="Ах да[waitall:4][w:3]...[waitall:1][w:3] Совсем запамятовал."
		wav={"phase2/k_4"} 
	elseif GetGlobal("progress") == 53 then
		nrus={"[func:Bad]Но не думай,[w:3] что \nя сдалась[waitall:4][w:3]...[waitall:1][w:3] \n[func:Final_7]Я истекаю кровью и,[w:3] \nвероятно,[w:3] долго не \nпроживу,[w:3] но[waitall:4][w:3]...", "[noskip][func:ToAngry][waitall:4][w:3]...[w:600][next] " , "[noskip][func:GetsAngry]У меня все ещё \nесть силы дать \nтебе отпор!", "[func:NoMercy1]Если я и не \nчеловек,[w:3] и не \nмонстр[waitall:4][w:3]...[waitall:1][w:3]","[func:angry]Тогда мне,[w:3] как \nДемону,[w:3] положено \nдраться до \nпоследней капли \nкрови!", "Я положу тебе \nконец,[waitall:2][w:3][func:GiveCurse]проклятая \nкровь!"}
		neng={"[func:Bad]Ama çoktan pes \nettiğimi düşünmüyor \nmusun[waitall:4][w:3]?..[waitall:1][w:3] \n[func:Final_7]Kanıyorum ve,[w:3] \nbelkide,[w:3] uzun süre \nyaşamayacağım,[w:3] ama[waitall:4][w:3]...", "[noskip][func:ToAngry][waitall:4][w:3]...[w:600][next] ", "[noskip][func:GetsAngry]Hala sana karşı \ndirenebileceğim \ngüçlerim var!", "[func:NoMercy1]Eğer bir insan yada \ncanavar değilsem[waitall:4][w:3]...[waitall:1][w:3] ","[func:angry]O zaman,[w:3] bir şeytan \nolarak,[w:3] kanımın \nson damlasına kadar \nsavaşmalıyım!", "Seni bitireceğim,[waitall:2][w:3]\n[func:GiveCurse]lanet olası şey!"}
		engcom="Lanet olsun![w:6] \nTesterem kırıldı![w:6]\nDikkatli ol,[w:3] güçlü bir lanet seziyorum[waitall:4][w:3]...[waitall:1][w:3]"
		ruscom="Чёрт![w:6] Бензопила замкнулась![w:6]\nОсторожнее,[w:3] я чувствую сильную порчу[waitall:4][w:3]...[waitall:1][w:3]"
		Encounter.SetVar("chainsaw",false)
		if lang=="rus" then
			commands = {"ПРОВЕРИТЬ", "МОЛИТВА" , "КОНЦЕНТРАЦИЯ"}
			else
			commands={"İNCELE","DUA ET","KONSANTRASYON"}
		end
		wav={"phase2/HARD"}
	elseif GetGlobal("progress") == 54 then
		nrus={"[func:NoMercy1]Вместе с моей \nкровью вытекает и \nискусственная \nРешимость[waitall:4][w:3]...", "[func:head4]Очевидно,[w:3] что я \nбольше не соперник \nтебе.[w:6] [func:BADsad]Я потеряла \nвозможность.", "[func:NoMercy1]Но если я смогу \nтебя убить[waitall:4][w:3]...[waitall:1][w:3] \n[func:angry]Я смогу оттолкнуть \nтебя назад.", "Задержать тебя."}
		neng={"[func:NoMercy1]Kanımla birlikte \nyapay azmi \nkaybediyorum[waitall:4][w:3]...", "[func:head4]Bu ortada,[w:3] artık \nseninle eşit değilim.[w:6] [func:BADsad]\nFırsatımı kaçırdım.", "[func:NoMercy1]Ama eğer seni \nöldürebilirsem[waitall:4][w:3]...[waitall:1][w:3] \n[func:angry]Seni geri \ngöndereceğim.", "Seni bekleteceğim."}
		engcom="Bu olmayacak,[w:3] seni aptal.[w:6]\nÇoktan kazandım."
		ruscom="Этому не бывать,[w:3] наивная дура.[w:6]\nЯ уже победил."
		wav={"phase2/knives4"}
	elseif GetGlobal("progress") == 55 then
		nrus={"[func:head4]Я просто[waitall:4][w:3]...[waitall:1][w:3] [func:BADsad]Просто \nхочу,[w:3] чтобы в мои \nпоследние минуты \nя ни о чем не \nсожалела.", "[func:head4]Ты понимаешь,[w:3] \n[func:BADthoughts]каково это?", "[func:head4]Когда твой мир \nускользает от тебя,[w:3] \nи ты остаешься \nодна[waitall:4][w:3]...[waitall:1][w:3] [func:deadly]в темноте[waitall:4][w:3]..."}
		neng={"[func:head4]Ben sadece[waitall:4][w:3]...[waitall:1][w:3] [func:BADsad]\nSadece hayatımın \nson anlarında hiçbir \npişmanlığımın olmasını \nistemiyorum.", "[func:head4][func:BADthoughts]Bu hisleri \nanlıyor musun?", "[func:head4]Tüm dünya yok \nolurken kendini \nkaranlığın ortasında \nbulmak[waitall:4][w:3]...[waitall:1][w:3] \n[func:deadly]Yalnız olarak[waitall:4][w:3]..."}
		engcom="Bu gevezeliği kes[waitall:4][w:3]...[waitall:1][w:3]\nÖlüm hiçbir zaman ikimiz içinde bir seçim olmadı."
		ruscom="Хватит драматизировать[waitall:4][w:3]...[waitall:1][w:3]\nСмерть [w:3]-[w:3] это роскошь для нас"
		wav={"phase2/StayLow"}
	elseif GetGlobal("progress") == 56 then
		nrus={"[func:Peachy]Хех[waitall:4][w:3]...[waitall:1][w:3] Хах[waitall:4][w:3]...", "[func:BADsmart]Извини,[w:3] я просто \nподумала,[w:3] как \nвойдет эта битва в \nисторию[waitall:4][w:3]...", "[func:Peachy]Дуэль,[w:3] которой не \nдолжно было быть[waitall:4][w:3]...", "Битва двух \nаномалий[waitall:4][w:3]...[waitall:1][w:3] [func:BADRemember]\nЭто так красиво \nзвучит[waitall:4][w:3]..."}
		neng={"[func:Peachy]Hehe[waitall:4][w:3]...[waitall:1][w:3] \nAhah[waitall:4][w:3]...", "[func:BADsmart]Üzgünüm,[w:3] bir anlığına,[w:3] \ntarihin bizi nasıl \nhatırlayacağını \ndüşündüm[waitall:4][w:3]...", "[func:Peachy]Bu savaş hiç \nyaşanmamalıydı[waitall:4][w:3]...", "İki anormalliğin \nsavaşı[waitall:4][w:3]...[waitall:1][w:3] [func:BADRemember]\nKulağa çok şiirsel \ngeliyor[waitall:4][w:3]..."}
		engcom="Kendini kaybediyor[waitall:4][w:3]...[waitall:1][w:3]\nHiç gücü yok.[w:3] \nBu saçmalığı bitir"
		ruscom="Она бредит[waitall:4][w:3]...[waitall:1][w:3]\nСилы покидают её.[w:3] Кончай этот балаган."
		wav={"phase2/BadKnifes"}
	elseif GetGlobal("progress") == 57 then
		neng={"[func:head4][waitall:4][w:3]...", "Artık hiçbir ses \nduymuyorum[waitall:4][w:3]...[waitall:1][w:3] [func:BADsad]\nOrtadan kayboldular.", "[func:head4]Sadece oksijenimden \narta kalanı çalan \nkalbmin atışını \nduyuyorum[waitall:4][w:3]...", "[waitall:2][func:Cough1]*kuru [w:8][func:Cough2]öksürük*[w:9] [func:head4]\nLanet olsun[waitall:4][w:3]...[waitall:1][w:3] \n[func:BADweak]Hiç zamanım kalmadı[waitall:4][w:3]..."}
		nrus={"[func:head4][waitall:4][w:3]...", "Я больше не слышу \nголоса[waitall:4][w:3]...[waitall:1][w:3] [func:BADsad]Они \nзатихли[waitall:4][w:3]...", "[func:head4]Лишь стук моего \nумирающего сердца \nпродолжает жадно \nотбирать мой \nкислород[w:4].[w:4].[w:4].[w:4]", "[waitall:2][func:Cough1]Кхах[w:4].[w:4].[w:4].[w:4] [func:Cough2][waitall:2]Кха-кха![w:9][waitall:1] [func:head4]\nЧерт[w:4].[w:4].[w:4].[w:4] \n[func:BADweak]У меня совсем не \nосталось времени[w:4].[w:4].[w:4].[w:4]"}
		engcom="Doğru."
		ruscom="Хорошо подмечено."
		wav={"phase2/AllAround"}
	elseif GetGlobal("progress") == 58 then
		nrus={"[func:head4]Знаешь[w:3].[w:3].[w:3].[w:3] После \nстольких смертей[w:3].[w:3].[w:3].[w:3] \n[func:BADsad]Я больше не боюсь \nвида крови[waitall:4][w:3]...", "В детстве я \nненавидела кровь[w:3].[w:3].[w:3].[w:3] \n[func:head4]Меня тошнило при \nвиде неё...", "А сейчас[w:3].[w:3].[w:3].[w:3] [func:Final_7]Всё \nравно,[w:3] что вода на \nладонях[w:3].[w:3].[w:3].[w:3] Только \nочень горячая[waitall:4][w:3]...", "[func:BADIrony]Почти как кипяток[w:3].[w:3].[w:3].[w:3] \n[func:Final_7]Но я не чувствую \nболи[waitall:4][w:3]..."}
		neng={"[func:head4]Biliyorsun[w:3].[w:3].[w:3].[w:3] \nO kadar ölümden \nsonra[w:3].[w:3].[w:3].[w:3] \n[func:BADsad]Artık kandan \nkorkmuyorum[waitall:4][w:3]...", "Çocukken kan \ngörmekten nefret \nederdim[w:3].[w:3].[w:3].[w:3] \n[func:head4]Beni hasta ederdi[waitall:4][w:3]...", "Ve şimdi[w:3].[w:3].[w:3].[w:3] [func:Final_7]\nSanki avcumdaki su \ngibi[w:3].[w:3].[w:3].[w:3] \nAma çok sıcak[waitall:4][w:3]...", "[func:BADIrony]Neredeyse kaynıyor[w:3].[w:3].[w:3].[w:3] \n[func:Final_7]Ama hiç acı \nhissetmiyorum[waitall:4][w:3]..."}
		engcom="Belkide,[w:3] en sonunda ölecektir?[w:6]\nBuna karşı olmazdım."
		ruscom="Может,[w:3] она наконец умирает?[w:6]\nЯ был бы не против."
		wav={"phase2/CopyCat"}
	elseif GetGlobal("progress") == 59 then
		nrus={"[func:head4]Ты[w:3].[w:3].[w:3].[w:3] [func:BADweak]все ещё \nживой[w:3]?[w:3].[w:3].[w:3] [func:head4]Живучий \nоднако[w:3].[w:3].[w:3].[w:3]", "Хотя не исключено,[w:3] \n[func:sad][func:NoCurse]что я уже ослабла \nдаже больше,[w:3] \nчем ты устал[w:3].[w:3].[w:3].[w:3]", "[func:head4]Тогда[w:3].[w:3].[w:3].[w:3] Мне не \nостается ничего,[w:3] \nкроме как[w:3].[w:3].[w:3].[w:3]", "[func:angry][func:GiveCurse]Показать свой \n[w:3][waitall:3]максимум."}
		neng={"[func:head4]Hala[w:3].[w:3].[w:3].[w:3] [func:BADweak]\nHala hayatta mısın[w:3]?[w:3].[w:3].[w:3] \n[func:head4]Her neyse[w:3].[w:3].[w:3].[w:3]", "Hala olabilir [func:sad][func:NoCurse]senden \ndaha fazla yorulmuş \nolsam bile[w:3].[w:3].[w:3].[w:3]", "[func:head4]Eğer öyleyse[w:3].[w:3].[w:3].[w:3] \nBaşka bir seçeneğim \nyok ama[w:3].[w:3].[w:3].[w:3]", "[func:angry][func:GiveCurse]Ama sana tam gücümü \ngöstermek için."}
		engcom="Ne?[w:6] \nYine mi bu <özel atak> muhabbeti?[w:6]\nAzıcık özgün olun."
		ruscom="Что?[w:6] Опять её <специальная атака>?[w:6] Никого больше это не пугает,[w:3] дорогуша."
		wav={"phase2/k_1"}
	elseif GetGlobal("progress") == 60 then
		nrus={"[func:Final_7]Я вижу по твоим \nглазам,[w:3] [func:BADBad]что ты \nнедооцениваешь \nменя[w:3].[w:3].[w:3].[w:3] [func:Final_7]Что же,[w:3] это \nк лучшему.", "Когда я умру,[w:3] моя \nдуша расколется[w:3].[w:3].[w:3].[w:3] \n[func:BADsmart]Но остатки \nискусственной \nрешимости не дадут \nей распасться.", "[func:Final_7]Резонанс энергии \nвзорвется и \nвысвободит мощный \nвсплеск магии.[w:6] \n[func:NoMercy1]И эта атака[w:3].[w:3].[w:3].[w:3]", "[func:angry][speed:0.75]Станет твоей \nпогибелью."}
		neng={"[func:Final_7]Onu gözlerinde \ngörebiliyorum [w:3] [func:BADBad]beni \nyanlış \ndeğerlendiriyorsun[w:3].[w:3].[w:3].[w:3] \n[func:Final_7]Peki,[w:3] bu daha iyisi \niçin.", "Öldüğüm zaman,[w:3] ruhum \nparçalanacak[w:3].[w:3].[w:3].[w:3] \n[func:BADsmart]Ama yapay azimden \narta kalanlar \nparçalanmayacak.", "[func:Final_7]Hapsolmuş enerji \ngüçlü bir büyülü atak \nile patlayacak.[w:6] [func:NoMercy1]\nVe bu[w:3].[w:3].[w:3].[w:3]", "[func:angry][speed:0.75]Benim son atağım \nolacak."}
		engcom="Bekle,[w:3] aktör,[w:3] ne dediğini anlamaya çalışıyorum[waitall:4][w:3]...[waitall:2][w:3]\nAh hayır."
		ruscom="Погоди,[w:3] актёр,[w:3] я пытаюсь понять,[w:3] что она пытается сказать[waitall:4][w:3]...[waitall:2][w:3]\nО нет."
		wav={"phase2/MovingKnifes"}
	elseif GetGlobal("progress") == 61 then
		neng={"[func:NoMercy1][func:BADsmart]O anı \nbekleyemiyorum[waitall:4][w:3]...[waitall:1][w:3]", "Öldüğün zaman, [func:NoMercy1]\nen başa döneceğiz[waitall:4][w:3]...[waitall:1][w:3]" , "[func:NoMercy1]Ve sen amacını \nyitirirken, \n[func:angry]Ben benimkine \nyaklaşacağım[waitall:4][w:3]...[waitall:1][w:3]", "[func:NoMercy1]Eğer bizi biraz olsun \nönemsiyorsan, seni \nöldürmeme izin \nverirsin[waitall:4][w:3]...[waitall:1][w:3]\n[func:head4]Ama şu an geriye bir \ndönüş yok.", "[func:Final_7]İşte burada[waitall:4][w:3]...[waitall:1][w:3]", "Son atağım.", "Söylemeliyimki[waitall:4][w:3]...[waitall:1][w:3] \nSen[waitall:4][w:3]...[waitall:1][w:3] \nİyi bir ortaktın[waitall:4][w:3]...[waitall:1][w:3] \nBir yerlerde[waitall:4][w:3]...[waitall:1][w:3]\nBelki başka bir \ngerçeklikte[waitall:4][w:3]...", "Bunun için üzgünüm[waitall:4][w:3]...[waitall:1][w:3]\n[func:NoCurse]Ben seni kaybettim[waitall:4][w:3]..."}
		nrus={"[func:NoMercy1]Я не могу \nдождаться, [func:BADsmart]когда \nнаступит этот миг[waitall:4][w:3]...[waitall:1][w:3]", "Если ты умрешь, [func:NoMercy1]то \nмы вернемся к \nначалу[waitall:4][w:3]...[waitall:1][w:3] И чем \nдальше ты от своей \nцели, [func:angry]тем ближе \nя к своей[waitall:4][w:3]...[waitall:1][w:3]", "[func:NoMercy1]Если бы тебя \nволновал мой мир, \nты бы просто дал \nсебя убить[waitall:4][w:3]...[waitall:1][w:3]\n[func:head4]Но теперь шанс \nупущен.", "[func:Final_7]Вот и настал он[waitall:4][w:3]...[waitall:1][w:3]", "Последний удар.", "Я должна сказать[waitall:4][w:3]...[waitall:1][w:3]\nЧто ты[waitall:4][w:3]...[waitall:1][w:3] был \nхорошим партнёром[waitall:4][w:3]...[waitall:1][w:3]\nкогда-то[waitall:4][w:3]...[waitall:1][w:3] в другой \nреальности[waitall:4][w:3]...[waitall:1][w:3]", "Мне так жаль,  \nчто я[waitall:4][w:3]...[waitall:1][w:3]\n[func:NoCurse][func:TireStand]я потеряла \nтебя[waitall:4][w:3]...[waitall:1][w:3]"}
		engcom="Onun sızlanmasını dinleme,[w:3] tatlım![w:6] \nTestere sahneye döndü,[w:3] ona saldır!"
		ruscom="Она давит на жалость![w:6] Не слушай её,[w:3] дорогуша![w:6]\nБензопила завелась,[w:3] [color:8040ff]нападай!"	
		Encounter.SetVar("deadlyhit",true)
		Encounter.SetVar("chainsaw",true)
		Encounter.SetVar("FightGoes",false)
		wav={"nothing"}
	elseif GetGlobal("progress") >= 999 then
		wav= {"laststand"}
		Encounter.SetVar("arenasize", {155, 130})
	end
	if weak==true then
		def=30
		weak=false
	end
	if lang=="rus" then
		currentdialogue=nrus
		Encounter.SetVar("comm",ruscom)
		else
		currentdialogue=neng
		Encounter.SetVar("comm",engcom)
	end
	if not currentdialogue then
		else
		if goneto<prog then
			goneto=prog
			Encounter.Call("WriteSavio")
			currentdialogue=EveryDial(currentdialogue,"[noskip][effect:none]","")
			Encounter.SetVar("SkipVoice",false)
			else
			currentdialogue=EveryDial(currentdialogue,"[effect:none]","")
			Encounter.SetVar("SkipVoice",true)
		end
	end
	local dub=Encounter.GetVar("dubbing")
	Encounter.SetVar("arenasize", {155, 130})
	Encounter.SetVar("nextwaves", wav)
	if hp<2 then
		OnDeath()
	end
end

function SetMusic(ingo)
	Encounter.Call("SetMusic",ingo)
end

function SAVEMUSIC()
	Encounter.Call("SetMusic","SAVE1")
	Encounter.SetVar("PlaysIntro",true)
end

function Betrayel()
end
function Curse()
	SetGlobal("cursed",1)
end

-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
    if command == "МОЛИТВА" or command=="DUA ET" then
	local pray=GetGlobal("pray")
	local lang=Encounter.GetVar("lang")
	SetGlobal("pray",pray+1)
	if Encounter.GetVar("diff")>2 then
		if pray==0 then
			Encounter.Call("GotAchivement",8)
			local dial={}
			if lang=="rus" then
				dial={"[color:8040ff]Так-так,[w:3] остановись-ка,[w:3] дорогуша.[w:6]\nС каких пор ты взываешь к Богу?","[color:8040ff]Я для тебя больше не авторитет,[w:3] хах[waitall:4][w:3]?..","В любом случае[waitall:4][w:3]... [waitall:1][w:3][color:8040ff]\nКто сказал,[w:3] что Бог услышит твои молитвы[waitall:4][w:3]?..","Тебе это не поможет.[w:6] [color:8040ff]Ты давно отбросил свою веру.\nНе трать наше время на глупости."}
				else
				dial={"[color:8040ff]Hop kardeşim,[w:3] orada dur bakalım,[w:3] tatlım.\nNe zamandır tanrıya inanıyorsun?","[color:8040ff]Artık senin için bir otorite değil miyim?,[w:3] ha[waitall:4][w:3]?..","Her neyse[waitall:4][w:3]...[waitall:1][w:3][color:8040ff]\nTanrının dualarını duyacağını kim söyledi[waitall:4][w:3]?..","Bu sana yardımcı olmaz.[w:6] [color:8040ff]İnancını uzun zaman önce kaybettin.[w:6]\nZamanımızı bu saçmalık ile harcama."}
			end
			local a=Encounter.GetVar("Achivements")
			for i=1,#dial do
				dial[i]="[noskip]"..dial[i]
			end
			if a[8]=="0" then
				dial[#dial]=dial[#dial].."[func:GotAchivement8][w:90]"
			end
			BattleDialog(dial)
			else
			if lang=="rus" then
				BattleDialog("[color:8040ff]Я сказал[waitall:4][w:3]...[waitall:2][w:3] Х в а т и т[w:4].")
				else
				BattleDialog("[color:8040ff]Söyledim[waitall:4][w:3]...[waitall:2][w:3] Y e t e r l i[w:4].")
			end
		end
		elseif hp<1490 then
		if lang=="rus" then
			BattleDialog("Ты молишься[waitall:4][w:3]...[w:6][color:8040ff]\n...[waitall:1][w:3]Но никто тебя не услышал.")
			else
			BattleDialog("Dua ettin[waitall:4][w:3]...[w:6][color:8040ff]\n...[waitall:1][w:3]Ama kimse duymadı.")
		end
		elseif pray==0 then
		if lang=="rus" then
			BattleDialog({"[color:8040ff]Что?[w:6] Уже чувствуешь себя неуютно?[w:6]\nНе робей.","Вы вспомнили начало молитвы.[w:6]\n[health:20]Вы восстановили 20 ОЗ."})
			else
			BattleDialog({"[color:8040ff]Ne?[w:6] Şimdiden gerildin mi?[w:6]\nSakinleş.","Bir duanın başını okudun.[w:6]\n[health:20]20 CP yenilendin."})
		end
		Encounter.SetVar("cursedwater",true)
		elseif pray==1 then
		if lang=="rus" then
			BattleDialog({"Чара хищно ухмыляется вам в ответ.","Вы читаете молитву[waitall:4][w:3]...[waitall:1][w:3]\n[health:20]Вы восстановили 20 ОЗ."})
			else
			BattleDialog({"Chara sana yırtıcı bir şekilde gülümsüyor.","Duayı okudun[waitall:4][w:3]...[waitall:1][w:3]\n[health:20]20 CP yenilendin."})
		end
		Encounter.SetVar("cursedwater",true)
		elseif pray==2 then
		if lang=="rus" then
			BattleDialog({"[color:8040ff]Ну хватит уже ныть[waitall:4][w:3]...[waitall:1][w:3]\nТы справишься.","Вы читаете молитву[waitall:4][w:3]...[waitall:1][w:3]\n[health:40]Вы восстановили 40 ОЗ."})
			else
			BattleDialog({"[color:8040ff]Hadi ama,[w:3] sızlanmayı bırak[waitall:4][w:3]...[waitall:1][w:3]\nBunu kaldırabilirsin.","Duayı okudun[waitall:4][w:3]...[waitall:1][w:3]\n[health:40]40 CP yenilendin."})
		end
		Encounter.SetVar("cursedwater",true)
		elseif pray==3 then
		if lang=="rus" then
			BattleDialog({"Кровь сочится из свежих ран[waitall:4][w:3]...[waitall:1][w:3]\nВы читаете молитву[waitall:4][w:3]...[waitall:1][w:3]\n[health:40]Вы восстановили 40 ОЗ."})
			else
			BattleDialog({"Yaralarından kan sızıyor[waitall:4][w:3]...[waitall:1][w:3]","Duayı okudun[waitall:4][w:3]...[waitall:1][w:3]\n[health:40]40 CP yenilendin."})
		end
		Encounter.SetVar("cursedwater",true)
		elseif pray==4 then
		if lang=="rus" then
			BattleDialog({"[color:8040ff]Неужели так трудно победить эту истеричку?","Вы читаете молитву[waitall:4][w:3]...[waitall:1][w:3]\n[health:60]Вы восстановили 60 ОЗ"})
			else
			BattleDialog({"[color:8040ff]Bu orospuyu yenmek cidden bu kadar zor mu?","Duayı okudun[waitall:4][w:3]...[waitall:1][w:3]\n[health:60]60 CP yenilendin."})
		end
		Encounter.SetVar("cursedwater",true)
		elseif pray==5 then
		if lang=="rus" then
			BattleDialog({"Ваше тело онемело от пронзающей его боли.","Вы читаете молитву[waitall:4][w:3]...[waitall:1][w:3]\n[health:60]Вы восстановили 60 ОЗ."})
			else
			BattleDialog({"Tüm bu acıdan sonra vücudun uyuşuyor.","Duayı okudun[waitall:4][w:3]...[waitall:1][w:3]\n[health:60]60 CP yenilendin."})
		end
		Encounter.SetVar("cursedwater",true)
		elseif pray==6 then
		if lang=="rus" then
			BattleDialog({"[color:8040ff]Ладно,[w:3] хватит уже.[w:6] Бог тебя не слышит,[w:3] хватит мучиться.","[color:8040ff]Только ты и можешь себе помочь.[w:6]\n[health:80]Ты восстановил 80 ОЗ."})
			else
			BattleDialog({"[color:8040ff]Tamamdır,[w:3] bırak.[w:6]\nTanrı seni duymayacak,[w:3] çırpınmayı bırak.","[color:8040ff]Kendine yardım edebilecek tek kişi sensin.[w:6]\n[health:80]80 CP kazandın."})
		end
		Encounter.SetVar("cursedwater",true)
		elseif pray==7 then
		if lang=="rus" then
			BattleDialog({"[color:8040ff]Её мир лишь сцена для меня.[w:6]\nПусть не зазнаётся.","[color:8040ff]А ты мой лучший актёр.[w:6]\nНе сдавайся.[w:6]\n[health:80]Ты восстановил 80 ОЗ."})
			else
			BattleDialog({"[color:8040ff]Onun dünyası sadece oynamam için bir sahne.[w:6]\nOnu ukalalaştırma.","[color:8040ff]Ama sen benim favori aktörümsün.[w:6]\nBeni hayal kırıklığına uğratma![w:6]\n[health:80]80 CP kazandın."})
		end
		Encounter.SetVar("cursedwater",true)
		elseif pray==8 then
		if lang=="rus" then
			BattleDialog({"[color:8040ff]Чара насмехается над твоими ошибками.","Но твои ошибки сделали тебя сильнее,[w:3] дорогуша.","[color:8040ff]Пусть смеётся.[w:6]\nКульминация совсем близко.","[color:8040ff]Время для эндшпиля! =)[w:12]\n[color:ffffff][health:99]Решимость переполняет вас, восстанавливая ОЗ."})
			else
			BattleDialog({"[color:8040ff]Chara hatalarına gülüyor.","[color:8040ff]Ama bu seni daha da güçlü yapıyor,[w:3] tatlım.","[color:8040ff]Ona izin ver.[w:6]\nZirveye yaklaşıyoruz.","[color:8040ff]Son oyunun zamanı,[w:3] şah-mat! =)[w:12]\n[health:99]AZMİN,[w:3] CP'ni yeniliyor."})
		end
		Encounter.SetVar("cursedwater",true)
		else
		if lang=="rus" then
			BattleDialog("Ты молишься[waitall:4][w:3]...[w:6][color:8040ff]\n...[waitall:1][w:3]Но никто тебя не услышал.")
			else
			BattleDialog("Dua ettin[waitall:4][w:3]...[w:6][color:8040ff]\n...[waitall:1][w:3]Ama kimse duymadı.")
		end
	end
    end
	
    if command == "ПРОВЕРИТЬ" or command=="İNCELE" then
	SetInspectChoise()
    end
	if command == "КОНЦЕНТРАЦИЯ" or command=="KONSANTRASYON" then
		local lang=Encounter.GetVar("lang")
		if weak then
			if lang=="rus" then
				BattleDialog({"Вы концентрируетесь на битве...\nНо это бесполезно.","[starcolor:8040ff][color:8040ff]Продолжай шоу , дорогой!"})
				else
				BattleDialog({"Savaşa konsantre oldun...\nAma bir işe yaramadı.","[starcolor:8040ff][color:8040ff]Şova devam et, tatlım!"})
			end
			else
			if lang=="rus" then
				BattleDialog({"Вы концентрируетесь на битве...\nУрон следующей атаки ПОВЫШЕН!"})
				else
				BattleDialog({"Savaşa konsantre oldun...\nSonraki atağının şiddeti YÜKSELDİ!"})
			end
			def=26
			weak=true
		end
	end
end

function Achivement()
	Encounter.Call("GotAchivement",4)
	Encounter.SetVar("globalstage","6")
	Encounter.Call("WriteSavio")
end

function OnDeath()
	local lang=Encounter.GetVar("lang")
	if Encounter.GetVar("wons")==0 then
		SetGlobal("charaisdead", 1)
		commands = {}
		local wav={}
		if Encounter.GetVar("quick")==true then
			--wav= {"nothing"})
			wav= {"laststrike","laststand"}
			else
			wav= {"laststrike","laststand"}
		end
		if Player.hp<10 then
			Encounter.Call("GotAchivement",12)
		end
		Encounter.SetVar("arenasize", {155, 130})
		Encounter.SetVar("nextwaves",wav)
		--Encounter.SetVar("wavetimer", 999)
		hp = 2
		local songs=Encounter.GetVar("songs")
		NewAudio.Pause(songs[3])
		Encounter.SetVar("FightGoes",false)
		SetGlobal("progress",999)
		currentdialogue={""}
		State("DEFENDING")
		State("NONE")
		else
		local dial={}
		SetMusic("finale")
		Encounter.SetVar("DoesPellets",false)
		if Encounter.GetVar("LostMercy")<6 then
			if lang=="rus" then
				dial={"[func:LostKidFace,base,+][waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,base_close,-]Ясно[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,base_left,+]Значит,[w:3] это \nбыло обычное \nлюбопытство[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,base_up,+]Знаешь,[w:3] я отчасти \nне разочарована.[w:6]","[func:LostKidFace,base_left,+]В конце концов[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,base_close,-]\nПочему я вообще \nдумала,[w:3] что в этот \nраз что-то будет \nиначе?.[w:6].[w:6]", "[func:LostKidFace,sobbing_close,-]Что ты выслушаешь \nменя[waitall:4][w:3]...[waitall:1][w:3][func:LostKidFace,sobbing,+] Попробуешь \nизмениться[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,crying,+]Стать \nлучше?", "[func:LostKidFace,base_close,-]Эх[waitall:4][w:3]...[waitall:1][w:3]", "[func:LostKidFace,base_up,+]Извини,[w:3] Азриэль[waitall:4][w:3]...[waitall:1][w:3] [color:808080][effect:shake][func:LostKidFace,base_close,-]\n[func:QuietMusic]Я скоро вернусь[waitall:4][w:3]...[waitall:1][w:3][func:dead][w:60][func:WON] "}
				else
				dial={"[func:LostKidFace,base,+][waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,base_close,-]Yani, işte buydu[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,base_left,+]\nSadece meraktan,[w:3] değil mi?","[func:LostKidFace,base_up,+]Biliyorsun,[w:3] pek hayal kırıklığına uğramadım.","[func:LostKidFace,base_left,+]Sonunda[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,base_close,-]Neden bir şeyin değişeceğini umdumki?","[func:LostKidFace,sobbing_close,-]Belki beni dinleyeceğini[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,sobbing,+][func:LostKidFace,crying,+]Doğru atrafa dönmeyi dene","[func:LostKidFace,base_close,-]*ah*[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,base_up,+]IÜzgünüm,[w:3] Asriel[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,base_close,-]\n[color:808080][effect:shake][func:QuietMusic]Yakında yanında olacağım[waitall:4][w:3]...[waitall:1][w:3][func:dead][w:60][func:WON] "}
			end
			elseif Encounter.GetVar("LostMercy")<22 then
			if lang=="rus" then
				dial={"[func:LostKidFace,crying_loud,-]Кх[waitall:4][w:3]...[waitall:1][w:3]", "[func:LostKidFace,crying,+]Это было грубо[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,sobbing,+] \nПрерывать меня \nпосреди пути[waitall:4][w:3]...[waitall:1][w:3]", "[func:LostKidFace,base,+]Я ведь[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,confused,+] Даже не \nатаковала тебя[waitall:4][w:3]...[waitall:1][w:3]", "[func:LostKidFace,base_left,+]Сам напросился на \nсказку,[w:6] [func:LostKidFace,base,+] а потом \nобрываешь?.[w:6].[w:6] [func:LostKidFace,sobbing,+]Я так и \nзнала,[w:6] что ты [func:LostKidFace,sobbing_smile,+] \nаморальный сукин \nсын,[w:6] кукловод[waitall:4][w:3]...[waitall:1][w:3]", "[func:LostKidFace,sobbing_upsmile,+]Хе[waitall:4][w:3]...[waitall:1][w:3] Хе[waitall:4][w:3]...[waitall:1][w:3]", "[func:LostKidFace,sobbing_thinking,+]Раз так[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,sobbing,+] То и \nчерт с тобой.[w:6]", "[func:LostKidFace,sobbing_close,-][func:QuietMusic]До следующей \nвстречи[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,sobbing_smile_close2,-] [color:808080][effect:shake]Кукловод.[w:6][func:dead][w:60][func:WON] "}
				else
				dial={"[func:LostKidFace,crying_loud,-]Ah[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,crying,+]Bu çok kabaydı[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,sobbing,+]Beni yarıda kesmen[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,base,+]Seni[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,confused,+]Seni incitmedim bile[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,base_left,+]Bunu sen istedin[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,base,+]ve şimdi benimle dalga mı geçiyorsun?.[w:6].[w:6]","[func:LostKidFace,sobbing,+][func:LostKidFace,sobbing_smile,+]Zalim bir piç olduğunu biliyordum,[w:3] \nkuklacı[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,sobbing_upsmile,+]Heh[waitall:4][w:3]...[waitall:1][w:3] Heh[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,sobbing_thinking,+]Eğer öyleyse[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,sobbing,+]Sana lanet olsun.[w:6]","[func:LostKidFace,sobbing_close,-][func:QuietMusic]Hele şükür[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,sobbing_smile_close2,-]\nKuklacı.[w:6][func:dead][w:60][func:WON] "}
			end
			else
			if lang=="rus" then
				dial={"[func:LostKidFace,sobbing,+][waitall:4][w:3]...[waitall:1][w:3]", "[func:LostKidFace,sobbing_up,+][waitall:4][w:3]...[waitall:1][w:3]Спасибо.[w:6]","[func:QuietMusic][func:LostKidFace,sobbing_upsmile,+][color:808080][effect:shake][waitall:4][w:3]...[waitall:1][w:3]партнёр[waitall:4][w:3]...[waitall:1][w:3][func:LostKidFace,sobbing_upsmile_close2,-][func:dead][w:60][func:WON] "}
				else
				dial={"[func:LostKidFace,sobbing,+][waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,sobbing_up,+][waitall:4][w:3]...[waitall:1][w:3]Teşekkür ederim.[w:6]","[func:QuietMusic][func:LostKidFace,sobbing_upsmile,+][color:808080][effect:shake][waitall:4][w:3]...[waitall:1][w:3]Ortak[waitall:4][w:3]...[waitall:1][w:3][func:LostKidFace,sobbing_upsmile_close2,-][func:dead][w:60][func:WON] "}
			end
		end
		for i=1,#dial do
			dial[i]="[noskip][effect:none]"..dial[i]
		end
		currentdialogue=dial
		SetGlobal("charaisdead",999)
		State("ENEMYDIALOGUE")
		--currentdialogue="[noskip][func:nohope4][func:dead][w:60][func:WON][next]"
	end
end

function Outro()
	currentdialogue = {outro1,outro2,outro3,outro4,outro5,outro6,outro7,outro8,outro9,outro10,outro11,outro12,outro13,outro14}
	State("ENEMYDIALOGUE")
end

function JUMP()
	Encounter.Call("SetMusic","none")
	Audio.PlaySound("jumpscare")
end

function Vietnam()
	Encounter.SetVar("FlashBack",1)
	State("NONE")
end

function MercyLostChild(ingo)
	local nrus={""}
	local neng={""}
	local rus=""
	local eng=""
	local wav={"nothing"}
	local lang=Encounter.GetVar("lang")
	if ingo==1 then
		nrus={"[func:LostKidFace,base_close,-]Пусть ты и убил \nменя однажды[waitall:4][w:3]...", "[func:LostKidFace,base_left,+]Сейчас ты \nпредпочитаешь \nменя игнорировать?",  "[func:LostKidFace,base,+]Неужели я наконец \nтебе наскучила?[w:9] [func:LostKidFace,confused,+] \nИли же наоборот?",  "[func:LostKidFace,base_up,+]Наконец-то в моей \nжизни появился для \nтебя смысл?","[func:LostKidFace,base,+][next]"}
		rus="Точно подмечено."
		neng={"[func:LostKidFace,base_close,-]Beni bir kere \nöldürmene rağmen[waitall:4][w:3]...", "[func:LostKidFace,base_left,+]Şimdi bana zarar \nvermiyor musun?", "[func:LostKidFace,base,+]Bundan sıkılmaya mı \nbaşladın? [func:LostKidFace,confused,+]\nYada başka bir şey mi?", "[func:LostKidFace,base_up,+]Hayatım sonunda \nsenin için bir \ndeğer mi kazandı?","[func:LostKidFace,base,+][next]"}
		eng="Çok zekisin."
		wav={"phase child/k_3"}
		elseif ingo==2 then
		neng={"[func:LostKidFace,base_left,+][waitall:4][w:3]...[waitall:1][w:3]Seninle \nkonuşmuyorum,[w:3] ortak.[w:6]", "[func:LostKidFace,base,+]Buraya yazıları \ndöken kişi ile \nkonuşuyorum.[w:6]", "[func:LostKidFace,angry,+]Bizi izliyorsun,[w:3] \ndeğil mi? \nBarışçıl yaşamımıza \nkarışıyorsun.[w:6]","[func:LostKidFace,base,+][next]"}
		eng="Tahmin etmeliydim[waitall:4][w:3]...[waitall:1][w:3] \nElbette,[w:3] kontrolün sadece sende olmadığını biliyor."
		wav={"phase child/BeFast"}
		nrus={"[func:LostKidFace,base_left,+][waitall:4][w:3]...[waitall:1][w:3]Я не к тебе \nобращаюсь,[w:6] партнёр.[w:9]", "[func:LostKidFace,base,+]Я говорю с тем,[w:6] кто \nдергает за ниточки.[w:9]", "[func:LostKidFace,angry,+]Ты ведь следишь за \nнами.[w:9] \nМешаешь нам жить \nспокойно.[w:9]", "[func:LostKidFace,base,+][next]"}
		rus="Должен был догадаться[waitall:4][w:3]...[waitall:1][w:3] \nКонечно,[w:3] она в курсе,[w:3] что не ты здесь главный."
		elseif ingo==3 then
		neng={"[func:LostKidFace,base_close,-]Her neyse[waitall:4][w:3]...", "[func:LostKidFace,confused,+]Şu an her şey \nanlamsız.[w:6]", "[func:LostKidFace,base_close,-][func:LostKidFace,base,+]Önderliğimdeki tüm \nemeklerim[waitall:4][w:3]...[w:6]", "[func:LostKidFace,base_left,+]Görüyorsun,[w:3] güçlerim \nuyanırken biraz zaman \nkazandırdın.[w:6]", "[func:LostKidFace,base_close,-]Yani, ne zaman \ndöndün[waitall:4][w:3]...", "[func:LostKidFace,base,+]Ölümümü dahi \nhatırlıyorum.[w:6]"} --Ga+-me-+Hu-232*nt<>ers   Ç-+evi+2323+2323-ri99-ek-2323*ibi
		eng="Yani güçleri bu şekilde mi çalışıyor[waitall:4][w:3]...[waitall:1][w:3]\nMerak uyandırıcı."
		wav={"phase child/rain"}
		nrus={"[func:LostKidFace,base_close,-]Как бы то ни было[waitall:4][w:3]...",  "[func:LostKidFace,confused,+]Ничего больше не \nимеет смысл.",  "[func:LostKidFace,base_close,-]Все мои старания[waitall:4][w:3]...[waitall:1][w:3][func:LostKidFace,base,+] \nКончатся моей \nсмертью.", "[func:LostKidFace,base_left,+]Видишь ли,[w:6] твое \nсохранение \nприходится именно \nна момент \nпробуждения моих \nсил.", "[func:LostKidFace,base_close,-]Поэтому сейчас,[w:6] \nкогда ты вернулся[waitall:4][w:3]...", "[func:LostKidFace,base,+]Я вспомнила,[w:6] как \nты меня убил."}
		rus="Вот так,[w:3] значит,[w:3] работают её силы[waitall:4][w:3]...[waitall:1][w:3]\nЛюбопытно."
		elseif ingo==4 then
		neng={"[func:LostKidFace,base_left,+]Ölümümü düşünmek için \npek fazla zamanım \nyok.[w:6]", "[func:LostKidFace,confused,+]Tamamen dürüst \nolmam gerekirse,[w:3] \no ben bile değildim.[w:6]", "[func:LostKidFace,base_left,+]O başka bir Chara'ydı.[w:6] [func:LostKidFace,base,+]\nÇoktan yok ettiğin \nönceki bir dünyadan.[w:6]", "[func:LostKidFace,base_close,-]Ve her bir Chara \nöldüğünde,[w:3] sonraki \ndünyaya geçiyorsun.[w:6]", "[func:LostKidFace,base_left,+]Sonuçta[waitall:4][w:3]...[waitall:1][w:3] \nOnlar ile aynı kaderi \nbir kere paylaşacağım."}
		eng="Hımm,[w:3] kulağa güzel geliyor.[w:6] \nBu senaryo için bir isim bulmalıyım[waitall:4][w:3]..."
		wav={"phase child/stoplights"}
		rus="Хм,[w:3] звучит.[w:6] \nНадо подумать над названием для такой пьесы[waitall:4][w:3]...[waitall:1][w:3]"
		nrus={"[func:LostKidFace,base_left,+]У меня не было \nмного времени,[w:6] \nчтобы обдумать \nмою смерть.",  "[func:LostKidFace,confused,+]Если уж совсем \nчестно,[w:6] это даже \nбыла не я.",  "[func:LostKidFace,base_left,+]Это была другая \nЧара.[w:9] [func:LostKidFace,base,+]Из прошлого \nмира, который ты \nокончательно сломал.", "[func:LostKidFace,base_close,-]И каждый раз как \nЧара умирает, ты \nпереходишь в новый \nмир.",  "[func:LostKidFace,base_left,+]Формально[waitall:4][w:3]...[waitall:1][w:3] Та же \nучасть [func:LostKidFace,base,+] ждёт и меня."}
		elseif ingo==5 then
		neng={"[func:LostKidFace,base_close,-]Bunu daha önce hiç \ndüşünmemiştim[waitall:4][w:3]...", "[func:LostKidFace,base,+]Yakında yaşamım son \nbulacak,[w:3] bu daha iyi \nolacak.[w:6]", "[func:LostKidFace,confused,+]Seni durdurabilecek \nChara ben değilim.[w:6]", "[func:LostKidFace,base_close,-]Ve öldüğüm zaman,[w:3] \nyok olacağım.[w:6]", "Göğsümdeki bu acıyı \ndaha fazla \nhissetmeyeceğim[waitall:4][w:3]..."}
		eng="[color:8040ff]Bunu dene."
		wav={"phase child/brave"}
		rus="[color:8040ff]Попробуем это."
		nrus={"[func:LostKidFace,base_close,-]Раньше об этом я \nне думала[waitall:4][w:3]...",  "[func:LostKidFace,base,+]Но чем раньше я \nпрекращу свое \nсуществование,[w:6] \nтем лучше.",  "[func:LostKidFace,confused,+]Я ведь не та Чара,[w:6] \nчто способна тебя \nодолеть.",  "[func:LostKidFace,base_close,-]А когда я умру,[w:6] \nя перестану \nсуществовать.",  "[func:LostKidFace,crying,+]Перестану \nиспытывать эту \nболь в груди[waitall:4][w:3]..."}
		elseif ingo==6 then
		neng={"[func:LostKidFace,sobbing_close,-]Eğer merak \nediyorsan[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,base,+]\nSana verebileceğim \nhiçbir şeyim kalmadı.[w:6]", "[func:LostKidFace,base_left,+]Şu an her şey \nortada.[w:6]", "Güçlerim.[w:6] \nSaldırılarım.[w:6] [func:LostKidFace,base_close,-]\nDuygularım.[w:6]", "[func:LostKidFace,base,+]Sadece öldür beni.[w:6] \nVe tüm bunları atla.[w:6]"}
		eng="Çok yakında?[w:6] \nBiraz kırıldım."
		Encounter.SetVar("FightGoes",false)
		rus="Так быстро?[w:12] \nЯ даже разочарован отчасти[waitall:4][w:3]...[waitall:1][w:3]"
		nrus={ "[func:LostKidFace,sobbing_close,-]Если тебе \nинтересно[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,base,+]\nМне больше нечего \nтебе предложить",  "[func:LostKidFace,base_left,+]Все карты перед \nтобой.[w:9] \nМои силы.[w:9] \nМои атаки.[w:9] [func:LostKidFace,base_close,-] \nМои чувства.",  "[func:LostKidFace,base,+]Просто убей меня.[w:9] \nИ покончим с \nформальностями."}
		elseif ingo==7 then
		neng={"[func:LostKidFace,base_left,+][waitall:4][w:3]...", "[func:LostKidFace,base,+][waitall:4][w:3]...[waitall:1][w:3]Eğer benimle biraz \ndaha vakit geçirmek \nistiyorsan[waitall:4][w:3]...", "[func:LostKidFace,confused,+]Sana bir hikaye \nanlatabilirim.[w:6] \nBir masal,[w:3] tabi öyle demek istersen.[w:6]", "[func:LostKidFace,base_close,-]Adını ben koydum[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,base,+]\n<Kayıp Çocuk>.[w:6]"}
		eng="Kimse bana uyumadan önce bir masal anlatmamıştı,[w:3] kuzenim bile[waitall:4][w:3]...[waitall:1][w:3] \nYine ilgimi çekti."
		nrus={ "[func:LostKidFace,base_left,+][waitall:4][w:3]...",  "[func:LostKidFace,base,+][waitall:4][w:3]...[waitall:1][w:3]Если тебе хочется \nещё провести со \nмной время[waitall:4][w:3]...", "[func:LostKidFace,confused,+]Я могу рассказать \nтебе историю.[w:9] \nСказку,[w:6] если можно \nтак сказать.",  "[func:LostKidFace,base_close,-]Я называю её[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,base,+] \n[speed:0.5]<Потерянное дитя>."}
		rus="Сказки на ночь мне ещё никто не читал,[w:3] даже кузен[waitall:4][w:3]...[waitall:1][w:3] \nЯ снова заинтригован."
		elseif ingo==8 then
		neng={"[func:LostKidFace,base_close,-]Bu hikaye uzun zaman \nönce başladı[waitall:4][w:3]...", "[func:LostKidFace,base_left,+]Dünyanın saf ve adil \nolduğu zamanlardı.[w:6]", "[func:LostKidFace,base,+]Dünya barış ve sevgi \nile doluydu[waitall:4][w:3]..."}
		eng="Bir pembe dizinin başlangıcı gibi duruyor[waitall:4][w:3]...[waitall:1][w:3]\nPembe dizileri severim."
		nrus={ "[func:LostKidFace,base_close,-]Эта история \nначалась \nдавным-давно[waitall:4][w:3]...",  "[func:LostKidFace,base_left,+]Это было во \nвремена,[w:6] когда \nмир казался чище и \nсправедливее.",  "[func:LostKidFace,base,+]В мире царила \nлюбовь и гармония[waitall:4][w:3]..."}
		rus="Звучит,[w:3] как начало сопливой драмы[waitall:4][w:3]...[waitall:1][w:3] \nЯ люблю такое."
		elseif ingo==9 then
		neng={"[func:LostKidFace,base_left,+]Bir köyde küçük bir \nkız vardı.[w:6]", "Doğayı çizmeyi ve [func:LostKidFace,base,+]\nçikolatayı severdi.[w:6]", "Birçok arkadaşı vardı.[w:6] [func:LostKidFace,sobbing,+]\nArkadaşça bir ailesi.[w:6]", "Kız mutluydu.[w:6]", "[func:LostKidFace,sobbing_close,-]Ama dünya kimsenin \ngerçek mutluluğu hak \netmemesi ile işliyor.[w:6]", "[func:LostKidFace,base,+]Ve bir gün kızın \nhayatı, [w:6]çok fazla \ndeğişti[waitall:4][w:3]...[waitall:1][w:3] \nSonsuza kadar[waitall:4][w:3]..."}
		eng="Asırlar önce benimde bir ailem vardı.[w:6]\nAma herkesi hatırlamıyorum."
		nrus={ "[func:LostKidFace,base_left,+]В одной деревне \nжила маленькая \nдевочка.", "Она любила \nрисовать,[w:6] природу и [func:LostKidFace,base,+]\nшоколад.", "У девочки было \nмного друзей.[w:9] \nУ неё была [func:LostKidFace,sobbing,+] \nдружная семья.", "Девочка была \nсчастлива.",  "[func:LostKidFace,sobbing_close,-]Но мир устроен так,[w:6] \nчто не все мы \nзаслуживаем счастья.",  "[func:LostKidFace,base,+]В один день жизнь \nдевочки сильно \nизменилась[waitall:4][w:3]...[waitall:2][w:3] \nНавсегда[waitall:4][w:3]..."}
		rus="Когда я ещё был жив,[w:3] у меня тоже была семья.[w:6] \nНо я её совсем не помню."
		elseif ingo==10 then
		neng={"[func:LostKidFace,sobbing,+]Bir gün, kızın babası \nöldü.[w:6]", "Sessizce vefat etti.[w:6] \nMütevazi olarak.[w:6] [func:LostKidFace,sobbing_close,-]\nAilesi yanındayken.[w:6]", "Çok uzun süredir \nhastaydı.[w:6] \nDurumu her gün git gide kötüleşiyordu.[w:6]", "[func:LostKidFace,sobbing,+]Kızın hayatı işte o \nsırada değişti.[w:6]", "[func:LostKidFace,sobbing_thinking,+]Annesi üzüntüden \nneredeyse çılgına \ndönecekti.[w:6]", "[func:LostKidFace,base_close,-]Kızını kaybetmekten \nde korkuyordu.[w:6]", "[func:LostKidFace,sobbing,+]Kızı bağladı,[w:3] \nkilitli bir ahırda \nuyumaya zorladı.[w:6]", "[func:LostKidFace,sobbing_thinking,+]Sadece belirli \nzamanlarda yiyecek \nyiyebildi ve dünyayı kapalı bir pencereden gördü.[w:6]", "Adım adım[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,base,+]\nDuyguları solup gitti.[w:6] \nRuhunun kılıcı kırıldı.[w:6]"}
		eng="[waitall:4][w:3]...[waitall:1][w:3]Buna benzer bir kitap okumuştum.[w:6] \nKarakterine biraz acıyorum." 
		rus="[waitall:4][w:3]...[waitall:1][w:3]Я помню,[w:3] как читал книгу с таким сюжетом.[w:6]\nБыло очень жалко героиню."
		nrus={ "[func:LostKidFace,sobbing,+]Однажды отец \nдевочки умер.", "Он ушел из жизни \nтихо.[w:9] \nСкромно.[w:9] [func:LostKidFace,sobbing_close,-] \nВ кругу семьи.", "Он долго болел. \nУвядал день ото дня.",  "[func:LostKidFace,sobbing,+]Тогда жизнь девочки \nи изменилась.", "[func:LostKidFace,sobbing_thinking,+]Её мать будто бы \nобезумела от горя.",  "[func:LostKidFace,base_close,-]Она боялась,[w:6] что \nпотеряет и \nединственного \nребенка.",  "[func:LostKidFace,sobbing,+]Она связывала \nдевочку,[w:6] заставляла \nеё ночевать в \nподвале под замком.",  "[func:LostKidFace,sobbing_thinking,+]Она питалась только \nпо расписанию и \nвидела мир лишь \nиз окна.",  "[func:LostKidFace,sobbing_close,-]Постепенно[waitall:4][w:3]...[waitall:1][w:3][func:LostKidFace,base,+] Её \nчувства огрубели.[w:9] \nЛезвие её души \nзатупилось."}
		elseif ingo==11 then
		neng={"[func:LostKidFace,base_up,+]Bir gün,[w:3] pencereden \nbakarken,[w:3] düşündü.[w:6]", "<Ebott[w:6] Dağı[waitall:4][w:3]...[waitall:1][w:3] \nÇok büyük.[w:6]>", "<[func:LostKidFace,base_left,+]Ya efsanelerdeki \ncanavarlar gerçekten \naltında yaşıyorlarsa?>", "[func:LostKidFace,base,+]Bunu epey merak \netti.[w:6]", "[func:LostKidFace,base_close,-]Ama annesi dağa \ngitmesine asla izin \nvermezdi.[w:6] \nSokağa dahi.[w:6]", "[func:LostKidFace,base_left,+]Yalnızlık kızı çok \nboğuyordu.[w:6] [func:LostKidFace,base_close,-]\nO dört duvarın \nardında bırakıldığını \ndüşündü.[w:6]", "[func:LostKidFace,base,+]Kaçmak istedi.[w:6] \nGidebildiği kadar \nuzağa.[w:6]", "[func:LostKidFace,sobbing_close,-]Özgür olmak için.[w:6]","[func:LostKidFace,sobbing,+][next]"}
		eng="Açıkçası?[w:6]\nNeredeyse etkilendim."
		rus="Честно?[w:12] \nЯ почти растрогался."
		nrus={ "[func:LostKidFace,base_up,+]Однажды, глядя в \nокно, девочка \nзадумалась.", "<Гора Эботт... Она \nтакая большая.>",  "[func:LostKidFace,base_left,+]<А вдруг в её \nнедрах живут \nстрашные монстры \nиз легенд?>",  "[func:LostKidFace,base,+]Девочке было \nлюбопытно, есть ли \nчто-нибудь под \nгорой.",  "[func:LostKidFace,base_close,-]Но мама никогда бы \nне отпустила её к \nгоре. Даже на улицу \nвыпускала редко.",  "[func:LostKidFace,base_left,+]Одиночество \nугнетало девочку. [func:LostKidFace,base_close,-] \nОна чувствовала \nсебя брошенной в \nчетырех стенах.",  "[func:LostKidFace,base,+]Она захотела \nубежать. \nКак можно дальше.",  "[func:LostKidFace,sobbing_close,-]Чтобы стать \nсвободной.","[func:LostKidFace,sobbing,+][next]"}
		elseif ingo==12 then
		neng={"Ama kız bu kararının \nsonuçlarını bilmiyordu.[w:6]", "[func:LostKidFace,sobbing_close,-]Dikkatsizliğinin ve \nnaifliğinin ne sonuçlar \ndoğuracağını bilmiyordu[waitall:4][w:3]...", "[func:LostKidFace,sobbing,+]Ahırı yakarak \nannesinin dikkatini \ndağıttı.[w:6]", "[func:LostKidFace,sobbing_close,-]Annesi bilmeden \nkorkarak kızı için \nateşe atladı[waitall:4][w:3]...", "[func:LostKidFace,sobbing_thinking,+][waitall:4][w:3]...[waitall:1][w:3]Ama kız çoktan \nuzaklaşmıştı.[w:6]", "[func:LostKidFace,sobbing,+]Ve sonunda annesi[waitall:4][w:3]...", "[func:LostKidFace,crying,+][waitall:4][w:3]..."}
		eng="[waitall:4][w:3]...[waitall:1][w:3]Kızının başlattığı yangında öldü.[w:6] \nNe kadarda trajedik bir son."
		rus="[waitall:4][w:3]...[waitall:1][w:3]Она сгорела в огне,[w:3] который разожгла её дочь.[w:12] \nТрагичный финал."
		nrus={"Но девочка не \nзнала,[w:6] что этот \nплан не стоил \nтого.",  "[func:LostKidFace,sobbing_close,-]Она не знала,[w:6] что \nповлечет за собой \nеё опрометчивость и \nнаивность[waitall:4][w:3]...",  "[func:LostKidFace,sobbing,+]Девочка отвлекла \nмаму,[w:6] подпалив \nскатерть в хлеву.",  "[func:LostKidFace,sobbing_close,-]Мама девочки \nиспугалась за жизнь \nдочери и помчалась \nза ней,[w:6] даже \nне представляя[waitall:4][w:3]...",  "[func:LostKidFace,sobbing_thinking,+][waitall:4][w:3]...[waitall:1][w:3]что девочка уже \nдавно сбежала из \nдома.",  "[func:LostKidFace,sobbing,+]И мама девочки в \nитоге[waitall:4][w:3]...",  "[func:LostKidFace,crying,+][waitall:4][w:3]..."}
		elseif ingo==13 then
		neng={"[func:LostKidFace,sobbing_close,-]Ama kız bunu \nbilmiyordu.[w:6]", "O sırada gecenin \nmeltemini soluyarak \normana koşuyordu.[w:6]", "[func:LostKidFace,sobbing_upsmile,+]Sesine gülüyordu ve \nmutluluktan ağlıyordu.[w:6]", "[func:LostKidFace,sobbing,+]Çıplak ayaklarının \nçimene değme \nhissinden dolayı ağlıyordu.[w:6] [func:LostKidFace,sobbing_close,-]\nÇalıların hışırtısından.[w:6]", "[func:LostKidFace,sobbing_smile,+]Özgürlükten.[w:6]"}
		eng="Özgürlük çok göreceli bir kavram.[w:6]\nO bile bunu anlamalı."
		rus="Свобода - вещь относительная.[w:6] \nДаже она должна это понимать."
		nrus={ "[func:LostKidFace,sobbing_close,-]Но девочка ничего \nне знала.", "Она бежала по \nночному лесу,[w:6] дыша \nполной грудью \nсвежей вечерней \nпрохладой.",  "[func:LostKidFace,sobbing_upsmile,+]Она смеялась во \nвесь голос и \nплакала от \nрадости.",  "[func:LostKidFace,sobbing,+]Плакала от того,[w:6] \nчто босые ноги \nщекочет трава.[w:9] [func:LostKidFace,sobbing_close,-] \nОт того,[w:6] что слышит \nшорох кустов.", "[func:LostKidFace,sobbing_smile,+]От того,[w:6] что она \nбыла свободна."}
		elseif ingo==14 then
		neng={"[func:LostKidFace,base_close,-]Dağdaki yolundaydı[waitall:4][w:3]...", "[func:LostKidFace,base_up,+]Taşlara tırmanırken,[w:3] \nyıldızlar ile şarkı \nsöylüyordu.[w:6]", "[func:LostKidFace,base_close,-]Kıdemli canavarları \nnasıl bulacağını \ndüşledi,[w:3] \nonlar ile arkadaş \nolmayı ve [func:LostKidFace,base_left,+]korkunç \nolmadıklarını herkese göstermeyi.[w:6]", "[func:LostKidFace,base_up,+]Bu dünyanın daha \nönce hiç görmediği \nbir şeyi göstermeyi düşlüyordu.[w:6]", "[func:LostKidFace,base_close,-]Ruhu umutlar ve \nhayaller ile doldu.[w:6] \nIşıldayan azmi ile \nyanıyordu[waitall:4][w:3]..."}
		eng="Hayır hayır hayır,[w:3] bunun nereye varacağını çözdüm.[w:6]\nKulağa hiç iyi gelmiyor."
		rus="О нет,[w:3] я понял,[w:3] к чему она ведёт.[w:6] \nЗвучит не весело."
		nrus={ "[func:LostKidFace,base_close,-]Её путь лежал к \nгоре[waitall:4][w:3]...",  "[func:LostKidFace,base_up,+]Она заворожено \nсмотрела на звезды,[w:6] \nвзбираясь по камням.",  "[func:LostKidFace,base_close,-]Она замечталась о \nтом,[w:6] как найдет \nдревних монстров, \nподружится с ними \nи [func:LostKidFace,base_left,+] покажет всем,[w:6] что \nони не страшные.",  "[func:LostKidFace,base_up,+]Она мечтала о том,[w:6] \nчто покажет всему \nмиру то,[w:9] чего они \nещё не видели.",  "[func:LostKidFace,base_close,-]Её Душа была полна \nмечтаний и надежд.[w:9] \nОна горела яркой \nРешимостью[waitall:4][w:3]..."}
		elseif ingo==15 then
		neng={"[func:LostKidFace,base,+][waitall:4][w:3]...[waitall:1][w:3]Elbette,[w:3] bu eski \nmağara dışında hiçbir \nşey bulamadı.", "[func:LostKidFace,base_left,+]Ama üzgün değildi.", "[func:LostKidFace,base_close,-]O anda kendini \ndünyanın en özgür \ninsanı gibi hissetti.", "[func:LostKidFace,base_up,+]Orada,[w:3] dağın \nzirvesinde,[w:3] \neterin kokusunu \nsolurken[waitall:4][w:3]...", "[func:LostKidFace,sobbing,+]Ama sonra burnuna \nsağlam ve sert bir \nkoku dokundu[waitall:4][w:3]..."}
		eng="[waitall:4][w:3]...[waitall:1][w:3]Küllerinin kokusu.[w:6] \nAteşin."
		rus="[waitall:4][w:3]...[waitall:1][w:3]Запах гари.[w:6] \nПожар."
		nrus={ "[func:LostKidFace,base,+][waitall:4][w:3]...[waitall:1][w:3]Естественно,[w:6] \nничего,[w:6] кроме \nстарой пещеры, \nдевочка не нашла.",  "[func:LostKidFace,base_left,+]Но её это не \nволновало.",  "[func:LostKidFace,base_close,-]В тот миг она \nчувствовала себя \nсамой свободной \nна свете.",  "[func:LostKidFace,base_up,+]Там,[w:6] на вершине \nгоры,[w:6] под звездами,[w:6] \nвдыхая запах небес[waitall:4][w:3]...",  "[func:LostKidFace,sobbing,+]Но затем её носа \nкоснулся жесткий и \nрезкий аромат[waitall:4][w:3]..."}
		elseif ingo==16 then
		neng={"[func:LostKidFace,base_close,-]Bu kokuya neyin \nsebep olduğunu \nöğrenmek için etrafa baktı.", "[func:LostKidFace,base,+]Ve tek gördüğü, \nköyünün kıpkırmızı \nateşler ile yandığıydı.", "[func:LostKidFace,base_left,+]Korkuyla donakaldı,[w:3] \nhiçbir şey \nyapamıyordu[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,confused,+]\nDizlerine çöktü ve tüm vücudu titremeye başladı[waitall:4][w:3]...", "[func:LostKidFace,sobbing,+]O an azmi parçalara \nbölündü.", "[func:LostKidFace,sobbing_close,-]Kafası annesinin,[w:3] \nköyünün,[w:3] \narkadaşlarının \nve her bir köylünün kaderi hakkında korku ile doldu.", "[func:LostKidFace,sobbing_up,+]Ve o an fakına \nvardı[waitall:4][w:3]..."}
		eng="Bu onun suçuydu."
		rus="Это только её вина."
		nrus={ "[func:LostKidFace,base_close,-]Девочка заозиралась \nв поисках источника \nзапаха.",  "[func:LostKidFace,base,+]И лишь тогда \nзаметила,[w:6] как её \nдеревня сверкала \nалыми языками \nпламени", "[func:LostKidFace,base_left,+]Девочка от страха \nне могла \nпошевелиться[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,confused,+] Она \nрухнула на колени \nи затряслась всем \nтелом[waitall:4][w:3]...[waitall:1][w:3]",  "[func:LostKidFace,sobbing,+]Её Решимость в миг \nразбилась об землю.",  "[func:LostKidFace,sobbing_close,-]Её голову \nзахлестнул страх о \nматери,[w:6] о деревне,[w:6] \nо друзьях,[w:6] о всех,[w:6] \nкто остался в \nдеревне.", "[func:LostKidFace,sobbing_up,+]И в этот момент \nона поняла[waitall:4][w:3]...[waitall:1][w:3]"}
		elseif ingo==17 then
		neng={"[func:LostKidFace,sobbing_close,-]Bütün geceyi \ndizlerinin üzerinde \ngeçirdi.", "[func:LostKidFace,sobbing,+]Korku onu hareketsiz \nkıldı.[w:6] \nGözlerinden sürekli \ngöz yaşı akıyordu.", "[func:LostKidFace,sobbing_up,+]Hiçbir şey \nyapamıyordu.[w:6] \nKimseyi kurtaramazdı.", "[func:LostKidFace,sobbing_close,-]Ve tüm köyünün bir \nyığın küle dönmesi \nonun hatasıydı.", "[func:LostKidFace,sobbing,+]Ateş sabaha karşı o \nkadar hızlı yayıldı ki, \nsanki tüm dünyayı \niçine çekiyordu.", "[func:LostKidFace,sobbing_close,-]Ve bu yanan \ndünyada[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,sobbing_smile,+]\nO, yapayalnız kaldı."}
		eng="Anlayamadım[waitall:4][w:3]...[waitall:1][w:3] \nMerhamet hissetmemem gerekiyor,[w:3] ama[waitall:4][w:3]..."
		rus="Я не понимаю[waitall:4][w:3]...[waitall:1][w:3] \nЯ не должен испытывать сострадания,[w:3] но[waitall:4][w:3]...[waitall:1][w:3]"
		nrus={ "[func:LostKidFace,sobbing_close,-]Девочка стояла на \nколенях всю ночь.",  "[func:LostKidFace,sobbing,+]Страх парализовал \nеё.[w:9] Слёзы градом \nлились из её глаз.", "Она ничего не могла \nподелать.[w:9][func:LostKidFace,sobbing_up,+] Она не \nмогла никого спасти.",  "[func:LostKidFace,sobbing_close,-]И только она \nвиновата в том,[w:6] что \nвся деревня \nобратилась кучей \nпраха.", "[func:LostKidFace,sobbing,+]К утру пожар \nперебросился на \nлес,[w:6] будто поглощая \nсобой весь мир.",  "[func:LostKidFace,sobbing_close,-]И в этом мире[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,sobbing_smile,+] \nДевочка осталась \nсовсем одна."}
		elseif ingo==18 then
		neng={"[func:LostKidFace,sobbing_up,+]Ateşe bakarken,[w:3] \nböyle olması \ngerektiğini hissetmeye başladı.[w:6]", "[func:LostKidFace,sobbing_close,-]O an dünyanın ondan \nnefret ettiğinin \nfarkına vardı.[w:6]", "[func:LostKidFace,sobbing_thinking,+]Başka türlü nasıl \nolabilirdi ki?[w:6] \nHayat ondan her \nşeyini almıştı.[w:6]", "[func:LostKidFace,sobbing,+]Ailesini,[w:3] arkadaşlarını,[w:3] \nköyünü[waitall:4][w:3]...", "[func:LostKidFace,sobbing_close,-]Ve tüm bunlar onun \nsuçuydu.[w:6]", "[func:LostKidFace,sobbing,+]Ve o sırada[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,sobbing_thinking,+]\nNasıl yürüyeceğini \ndahi unuttu.[w:6]", "Hayatın o sonsuz \nkoridorlarında \nkayboldu.[w:6]"}
		eng="Ona karşı sempati duymamalıyım[waitall:4][w:3]...[waitall:1][w:3]\nYapamam![w:6]\nOnu sustur,[w:3] aktör!"
		rus="Я не могу сострадать ей[waitall:4][w:3]...[waitall:1][w:3] \nНе могу! \nЗаткни её,[w:3] актёр!"
		nrus={"[func:LostKidFace,sobbing_up,+]Когда она смотрела \nна этот огонь,[w:6] \nвнутри неё росло \nчувство,[w:6] что так и \nдолжно быть.",  "[func:LostKidFace,sobbing_close,-]В тот миг она \nсмирилась с тем,[w:6] \nбудто весь мир был \nнастроен против \nнеё.",  "[func:LostKidFace,sobbing_thinking,+]А как иначе? Жизнь \nотобрала у неё всё,[w:6] \nчто она имела.",  "[func:LostKidFace,sobbing,+]Семью,[w:6] друзей,[w:6] \nдеревню[waitall:4][w:3]...[waitall:1][w:3]",  "[func:LostKidFace,sobbing_close,-]И всё это была \nтолько её вина.",  "[func:LostKidFace,sobbing,+]В тот миг девочка \nпоняла[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,sobbing_thinking,+]Что совсем \nне знает,[w:6] как быть \nдальше.", "Она потерялась в \nэтих бесконечных \nперипетиях жизни."}
		elseif ingo==19 then
		neng={"[func:LostKidFace,base,+]Özgür olmayı düşledi.", "[func:LostKidFace,angry,+]Babasının \nüzüntüsünden \nkurtulmayı.[w:6] \nAnnesinin \nhalatlarını \nunutmayı.", "Kaderine kendi karar \nvermek ve onda \nmutluluğu bulmak istedi.", "[func:LostKidFace,base,+]Ve bunun hayatı[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,base_close,-]\nSon bulduğunda \nolacağını fark etti,[w:3] özgürde olacaktı.", "[func:LostKidFace,base,+]Hiçbir şeye karar \nvermesi \ngerekmeyecekti[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,base_left,+]\nCevapları bulmak \niçin[waitall:4][w:3]...", "[func:LostKidFace,base,+]Eğer o gün gerçekten \nölseydi,[w:3] [func:LostKidFace,base_up,+]o zaman \nözgür olurdu."}
		eng="[func:state,NONE][color:8040ff][noskip]Sana yalvarıyorum,[w:6][waitall:2][func:Shake] BU KADARI YETER![w:30][func:ENOUGH]"
		rus="[func:state,NONE][color:8040ff][noskip]Прошу,[w:6] [waitall:2][func:Shake]ХВАТИТ![w:30][func:ENOUGH]"
		nrus={ "[func:LostKidFace,base,+]Она мечтала быть \nсвободной.",  "[func:LostKidFace,angry,+]От скорби по отцу.[w:9]\nОт веревок матери.", "Она хотела сама \nрешать свою судьбу \nи найти в ней своё \nсчастье.",  "[func:LostKidFace,base,+]И тогда она поняла,[w:6] \nчто если её жизнь[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,base_close,-] \nоборвется,[w:6] то она \nснова будет \nсвободна.", "[func:LostKidFace,base,+]Не надо будет \nничего решать[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,base_left,+]\nНе надо будет \nискать ответы[waitall:4][w:3]...[waitall:1][w:3]", "[func:LostKidFace,base,+]Если бы она умерла \nв тот день,[w:6] [func:LostKidFace,base_up,+] девочка \nстала бы свободной."}
		elseif ingo==20 then
		neng={"[func:LostKidFace,base,+]Mağaraya döndü.[w:6] \nVe içinde bir çukur \nbuldu.", "[func:LostKidFace,base_close,-]Oldukça derin bir \nçukur.[w:6] \nO kadar derindi ki \ndibini bile \ngöremiyordu.", "[func:LostKidFace,base,+]Ve özgürlüğe bir adım \nattı.", "[func:LostKidFace,base_close,-]Özgür olmak isteyen \nbu çocuğun \ndünyasından kayboldu."}
		eng="[waitall:4][w:3]..."
		rus="[waitall:4][w:3]..."
		nrus={ "[func:LostKidFace,base,+]Девочка вернулась \nв пещеру.[w:9] \nОна нашла яму.",  "[func:LostKidFace,base_close,-]Очень глубокую яму.[w:9] \nТакую глубокую,[w:6] что \nне было видно ей \nконца.",  "[func:LostKidFace,base,+]И сделала шаг \nнавстречу свободе.",  "[func:LostKidFace,base_close,-]Потерянное в мире \nдитя хотело \nобрести покой."}
		elseif ingo==21 then
		neng={"[func:LostKidFace,base,+]Ve bu hikayenin \nsonunda[waitall:4][w:3]...", "[func:LostKidFace,base_left,+]Zaten biliyorsun,[w:3] \ndeğil mi?", "[func:LostKidFace,base,+]Aşağıda canavarlar \nkızı buldu.[w:6] [func:LostKidFace,base_close,-]\nOnu kurtardılar.", "[func:LostKidFace,base,+]Yaralarını \niyileştirdiler.[w:6] \nAilelerine kattılar.", "[func:LostKidFace,sobbing_close,-]Çok uzun sürmedi[waitall:4][w:3]...[waitall:1][w:3] \nKız özgürlüğü \nbulduğunu sandı.", "[func:LostKidFace,sobbing,+]Olmak istediği bir yer \nbuldu.", "[func:LostKidFace,sobbing_smile,+]Yeni bir[waitall:4][w:3]...[waitall:1][w:3] \nEv buldu.[w:6] \nBir aile."}
		eng="[waitall:4][w:3]...[waitall:1][w:3]Aktör[waitall:4][w:3]...[waitall:1][w:3] \nBana[waitall:4][w:3]...[waitall:1][w:3] \nKarşı mı çıkacaksın?"
		rus="[waitall:4][w:3]...[waitall:1][w:3]Актёр.[w:6] Ты что[waitall:4][w:3]...[waitall:1][w:3] Задумал предать меня?"
		nrus={ "[func:LostKidFace,base,+]А продолжение этой \nсказки[waitall:4][w:3]...[waitall:1][w:3]",  "[func:LostKidFace,base_left,+]Тебе известно,[w:6] \nне так ли?",  "[func:LostKidFace,base,+]Девочку нашли \nобитавшие здесь \nмонстры.[w:9] [func:LostKidFace,base_close,-] \nОни спасли её.",  "[func:LostKidFace,base,+]Они залечили её \nраны.[w:9] \nОни приняли её в \nсемью.",  "[func:LostKidFace,sobbing_close,-]Ненадолго[waitall:4][w:3]...[waitall:1][w:3] девочка \nповерила,[w:6] будто \nсмогла найти \nсвободу.",  "[func:LostKidFace,sobbing,+]Место,[w:6] где она \nхотела бы быть.",  "[func:LostKidFace,sobbing_smile,+]Она нашла[waitall:4][w:3]...[waitall:1][w:3] новый \nдом.[w:9] \nНовую семью."}
		elseif ingo==22 then
		neng={"[func:LostKidFace,sobbing_close,-]Ve evini buldu.", "[func:LostKidFace,base,+]Hayatının sonuna \nkadar korumak \nistediği hedefini buldu.", "[func:LostKidFace,angry,+][waitall:4][w:3]...", "Ve sen bunların \nhepsini benden aldın.", "Bende hiçbir şey \nbırakmayarak beni \nyine yalnız bıraktın.", "[func:LostKidFace,base,+]Bir şeye değdi mi \nbari?", "[func:LostKidFace,base_left,+]Ah[w:3] bir bilsem[waitall:4][w:3]...", "[func:LostKidFace,base,+]Ama bu benim \nhikayemin sonuydu.", "[func:LostKidFace,base_close,-]Benim hikayemin.", "[func:LostKidFace,base,+]Yeterince konuştum.[w:6] \nÖlümümü kabullenmeye \nhazırım.", "[func:LostKidFace,base_close,-]Hadi,[w:3] ortak.[w:6] \nYalnızca bir adım[waitall:4][w:3]...[waitall:1][w:3] \nVe bunu bitireceğiz.[w:6]"}
		eng="Sana son bir şans veriyorum,[w:3] aktör.[w:6]\nAteşle oynama."
		rus="Я даю тебе последний шанс,[w:3] актёр.[w:6] \nНе играй с огнём."
		nrus={ "[func:LostKidFace,sobbing_close,-]И так потерянное \nдитя нашла \nсвой дом.",  "[func:LostKidFace,base,+]Нашла цель в жизни \nи то,[w:6] что она будет \nзащищать до \nпоследнего вздоха.",  "[func:LostKidFace,angry,+][waitall:4][w:3]...[waitall:1][w:3]", "А ты всё это забрал \nу меня.", "Ты вновь лишил меня \nвсего.",  "[func:LostKidFace,base,+]Стоило ли это того?",  "[func:LostKidFace,base_left,+]Черт,[w:6] если бы я \nзнала[waitall:4][w:3]...[waitall:1][w:3]",  "[func:LostKidFace,base,+]Но таков конец моей \nсказки.",  "[func:LostKidFace,base_close,-]Моей истории.",  "[func:LostKidFace,base,+]Я выговорилась.[w:9] \nЯ готова принять \nсвою смерть.",  "[func:LostKidFace,base_close,-]Давай,[w:6] партнёр.[w:9] \nВсего один шаг[waitall:4][w:3]...[waitall:1][w:3] \nИ мы покончим с \nэтим."}
		elseif ingo==23 then
		neng={"[func:LostKidFace,sobbing_close,-][waitall:4][w:3]...[waitall:1][w:3]Neden çekiniyorsun?", "[func:LostKidFace,sobbing,+]Hadi ama.[w:6] \nBana sahte umutlar \nvermeyi kes.", "[func:LostKidFace,crying,+]Kaderimi zaten \nkabullendim[waitall:4][w:3]...[waitall:1][w:3] \nBen[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,crying_loud,-]\nTüm bu dünyanın \nkaderini bıraktım!", "[func:LostKidFace,crying,+]Lütfen[waitall:4][w:3]...[waitall:1][w:3] \nÖlmeme izin ver[waitall:4][w:3]...", "[func:LostKidFace,sobbing_thinking,+]Kayıp olduğum bir \ndünyada yaşayamam[waitall:4][w:3]...", "[func:LostKidFace,sobbing,+]Ailemin olmadığı bir \ndünyada[waitall:4][w:3]...", "[func:LostKidFace,sobbing_up,+]Evimin olmadığı[waitall:4][w:3]...", "[func:LostKidFace,sobbing_upsmile,+]Ve senin olduğun[waitall:4][w:3]...","[func:LostKidFace,sobbing,+][func:AngerMetta][next]"}
		eng="[noskip]Anladım,[w:6] onu bana tercih ediyorsun.[w:6] [func:LowerMusic]Yanisi[waitall:4][w:3]...[waitall:1][w:3] \nEmeklilik vaktin gelmiş demektir.[w:45][func:METTANAME][w:9000]"
		rus="[noskip]Я тебя понял.[w:6] Ты предпочёл меня ей.[w:6] [func:LowerMusic]Раз так[waitall:4][w:3]...[waitall:1][w:3]\nНастала пора тебя уволить.[w:45][func:METTANAME][w:9000]"
		nrus={ "[func:LostKidFace,sobbing_close,-][waitall:4][w:3]...[waitall:1][w:3]Почему ты \nколеблешься?",  "[func:LostKidFace,sobbing,+]Ну же.[w:9] \nХватит давать мне \nложную надежду.", "[func:LostKidFace,crying,+]Я смирилась со \nсвоей смертью.[w:9] Я[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,crying_loud,-] \nЯ отпустила судьбу \nвсего мира!",  "[func:LostKidFace,crying,+]Пожалуйста[waitall:4][w:3]...[waitall:1][w:3] Дай \nмне умереть[waitall:4][w:3]...[waitall:1][w:3]",  "[func:LostKidFace,sobbing_thinking,+]Я не могу жить в \nмире,[w:6] в котором \nпотерялась[waitall:4][w:3]...[waitall:1][w:3]",  "[func:LostKidFace,sobbing,+]В мире,[w:6] где у меня \nнет ни семьи[waitall:4][w:3]...[waitall:1][w:3]",  "[func:LostKidFace,sobbing_up,+]Ни дома[waitall:4][w:3]...[waitall:1][w:3]",  "[func:LostKidFace,sobbing_upsmile,+][speed:0.5][w:6]Ни тебя[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,sobbing,+][func:AngerMetta][next]"}
	end
	if ingo>5 then
		wav={"nothing"}
	end
	if not wav then
		else
		Encounter.SetVar("nextwaves",wav)
	end
	local dial={}
	if lang=="rus" then
		Encounter.SetVar("comm",rus)
		dial=nrus
		else
		Encounter.SetVar("comm",eng)
		dial=neng
	end
	for i=1,#dial do
		dial[i]="[effect:none]"..dial[i]
	end
	currentdialogue=dial
end

function AngerMetta()
	BattleDialogue(Encounter.GetVar("comm"))
end

function SetInspectChoise()
	local lang=Encounter.GetVar("lang")
	local wons=Encounter.GetVar("wons")
	local songs=Encounter.GetVar("songs")
	local prog=Encounter.GetVar("prog")
	local text={}
	if wons==0 then
		if prog==26 then
			if lang=="rus" then
				text={"Чара Дриимурр 1 УР[w:6]?[w:6]\nПоверь,[w:3] актёр,[w:3] её пощада не стоит ни гроша.","Давай не отвлекаться на сентиментальности и просто закончим начатое?"}
				else
				text={"Chara Dreemurr 1 SV[w:6]?[w:6]\nGüven bana,[w:3] aktör,[w:3] merhameti hiçbir şeye değmez.","Hadi önemsiz duygular ile dikkatimiz dağılmasın ve başladığımız işi bitirelim."}
			end
			elseif prog<43 then
			if lang=="rus" then
				text={"Чара Дриимурр 1 УР[w:6]?[w:6]\nПервый павший человек.[w:6] Последняя\rвыжившая из рода Дриимурров.[w:6]\nЧеловек в шкуре монстра.","Эта назойливая сучка не будет\rдля нас помехой,[w:3] если не давать\rей поблажек.","Я достаточно понятно объяснил?[color:8040ff][w:6]\nНе смей её жалеть,[w:3] дорогуша."}
				else
				text={"Chara Dreemurr 1 SV[w:6]?[w:6]\nDüşen ilk insan.[w:6] \nDreemur'lardan kalan son kişi.[w:6]\nCanavarlardaki insan.","Bu pis orospu bizi rahatsız edemez,[w:3] tabi ona hoşgörü ile yaklaşmazsak.","Yeterince açık mıydım?[w:6][color:8040ff]\nOna merhamet göstermeyi dahi deneme, tatlım."}
			end
			elseif prog<49 then
			if lang=="rus" then
				text={"Чара Дриимурр 19 УР[w:6]\nНе самое логичное решение\rпотратить ход в таких условиях\rна проверку[waitall:4][w:3]...","Но если тебе интересно мое мнение,[w:3] дорогуша[waitall:4][w:3]...[waitall:1][w:3]\nОна свихнулась.","Следи за движениями.[w:6] Она бьет\rбез разбору,[w:3] пытаясь нанести\rмаксимальный урон.","Не теряй Решительности.[w:6][color:8040ff]\nСрази Голиафа."}
				elseif lang=="eng" then
				text={"Chara Dreemurr 19 SV[w:6]\nTurunu onu incelemek ile geçirmen pek akıllıca değildi[waitall:4][w:3]...","Ama benim görüşümü merak ediyorsan[waitall:4][w:3]...[waitall:1][w:3]\nEpey kızmış.","Hareketlerinden sonra bak.[w:6] \nSağdan ve soldan saldırarak en yüksek hasarı vermeye çalışıyor.","Azmini kaybetme.[w:6][color:8040ff]\nBu Câlût'ü yere ser."}
			end
			elseif prog==49 then
			if lang=="rus" then
				text={"Чара Дриимурр 19 УР[w:6]\nОна выдохлась[waitall:4][w:3]...[waitall:1][w:3]\nТеперь точно.","Не мешкай,[w:3] это может быть наш единственный шанс задеть её."}
				else
				text={"Chara Dreemurr 19 SV[w:6]\nYoruldu[waitall:4][w:3]...[waitall:1][w:3]\nElbette.","Sakın durma, bu ona vurmak için tek şansımız olabilir."}
			end
			else
			if lang=="rus" then
				text={"Чара Дриимурр 19 УР[w:6]\nМы наконец смогли её ранить,[w:3] но\rлюди не так просты, как\rмонстры[waitall:4][w:3]...","Не опускай руки,[w:3] дорогуша.[w:6]\rНастал час для эндшпиля.[w:6][color:8040ff]\nПоставим ей шах и мат!"}
				elseif lang=="eng" then
				text={"Chara Dreemurr 19 SV[w:6]\nSonunda onu yaralayabildik,[w:3] ama insanlar canavarlardan daha sert[waitall:4][w:3]...","Pes etme,[w:3] tatlım.[w:6]\nOyunu bitirme zamanı.[w:6]\n[color:8040ff]Şah-mat!"}
			end
		end
		elseif wons==1 then
		local p=Encounter.GetVar("LostMercy")
		if p<7 then
			if lang=="rus" then
				text={"Чара Дриимурр 1 УР[w:6]\nБольше не представляет угрозы","Тебе решать,[w:3] что с ней делать,[w:3] актёр."}
				else
				text={"Chara Dreemurr 1 SV[w:6]\nArtık bizim için bir tehdit değil.","Onunla ne yapmak istiyorsan yap."}	
			end
			elseif p<19 then
			if lang=="rus" then
				text={"Чара Дриимурр 1 УР[w:6]\nВ чем-то сомневаешься?[w:6] Но ладно,[w:3] напомню.","Первый Падший.[w:6] Последний выживший из рода Дриимурров.[w:6]\nБольше не представляет угрозы.","[color:8040ff]Пока от неё есть толк,[w:3] пусть живет[waitall:4][w:3]..."}
				else
				text={"Chara Dreemurr 1 SV[w:6]\nBirşey mi unuttun?[w:6] \nTamam,[w:3] işte küçük bir hatırlatma.","İlk düşen. \nDreemur'lardan kalan son kişi.[w:6]\nArtık bizim için bir tehdit değil.","[color:8040ff]Kullanışlıyken,[w:3] onu bırak[waitall:4][w:3]..."}
			end
			else
			if lang=="rus" then
				text={"Чара Дриимурр 1 УР[w:6]\nЭта мнительная сучка опять портит все мои планы[waitall:4][w:3]...","[color:8040ff]Это должно было быть моё шоу![w:6] Мой сценарий![w:6] А не её импровизированная драма!","Она вечно всё портит[waitall:4][w:3]...[waitall:1][w:3]\nТерпеть её не могу!","Покончи с ней по-быстрее,[w:3] дорогуша.[w:6][color:8040ff]\nНет сил слушать её нытье."}
				elseif lang=="eng" then
				text={"Chara Dreemurr 19 SV[w:6]\nBu dalak orospu yine planlarıma karıştı[waitall:4][w:3]...","[color:8040ff]Bunun benim şovum olması gerekiyordu![w:6] \nBenim senaryom![w:6] \nOnun drama doğaçlaması değil!","Habire her şeyin tadını kaçırıyor[waitall:4][w:3]...[waitall:1][w:3]\nBuna tahammül edemem!","İşini çabuk bitir.[waitall:4][w:3]...[waitall:1][w:3][color:8040ff]\nArtık onun sızlanmasını dinleyemiyorum."}
			end
		end
	end
	BattleDialogue(text)
end
