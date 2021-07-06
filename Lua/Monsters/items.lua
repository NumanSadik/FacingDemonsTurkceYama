save1={"ДОМ ЛАЗ","ПАУ ПОН","ПАУ ПОН","ЧЕРЕП ЧАЙ"}
save2={"ЧЕРЕП ЧАЙ","КУС СНЕГ","СВЯТ ВОД","СВЯТ ВОД"}
save3={"СВЯТ ВОД","СВЯТ ВОД","СВЯТ ВОД","СВЯТ ВОД"}
names={"ДОМ ЛАЗ","ПАУ ПОН","ПАУ ПОН","ЧЕРЕП ЧАЙ","ЧЕРЕП ЧАЙ","КУС СНЕГ","СВЯТ ВОД","СВЯТ ВОД","СВЯТ ВОД","СВЯТ ВОД","СВЯТ ВОД","СВЯТ ВОД"}
rus={"ДОМ ЛАЗ","ПАУ ПОН","ПАУ ПОН","ЧЕРЕП ЧАЙ","ЧЕРЕП ЧАЙ","КУС СНЕГ","СВЯТ ВОД","СВЯТ ВОД","СВЯТ ВОД","СВЯТ ВОД","СВЯТ ВОД","СВЯТ ВОД"}
eng={"YAP LAZ","ÖRÜ DON","ÖRÜ DON","KAP ÇAY","KAP ÇAY","KAR PARÇ","KUTS SU","KUTS SU","KUTS SU","KUTS SU","KUTS SU","KUTS SU"}

commands = save1
page=1
used=false
NewAudio.CreateChannel("dubber")
sprite = "empty" --Always PNG. Extension is added automatically.
name = "Вещи"
hp = 1
atk = 1
def = 99
check = "Она использует силу\rПОДЗЕМЕЛЬЯ"
dialogbubble = "rightwide"
canspare = false
cancheck = false
number={true,true,true,true,true,true,true,true,true,true,true,true}
-- This handles the commands; all-caps versions of the commands list you have above.


function ChangeLanguage(ingo)
	if ingo=="rus" then
		save1={rus[1],rus[2],rus[3],rus[4]}
		save2={rus[5],rus[6],rus[7],rus[8]}
		save3={rus[9],rus[10],rus[11],rus[12]}
		for i=1,12 do
			names[i]=rus[i]
		end
		else
		save1={eng[1],eng[2],eng[3],eng[4]}
		save2={eng[5],eng[6],eng[7],eng[8]}
		save3={eng[9],eng[10],eng[11],eng[12]}
		for i=1,12 do
			names[i]=eng[i]
		end
	end
end
function Reasign()
	target=1
	save1={}
	save2={}
	save3={}
	for i=1,12 do
		if number[i]==true then
			if target<5 then
				save1[target]=names[i]
				elseif target<9 then
				save2[target-4]=names[i]
				else save3[target-8]=names[i]
			end
			target=target+1
		end
	end
	if target==1 then
		used=true
		else used=false
	end
end
function Recharge()
	for i=1,12 do
		number[i]=true
	end
	for i=7,12 do
		if Encounter.GetVar("lang")=="rus" then
			names[i]="СВЯТ ВОД"
			else
			names[i]="KUTS SU"
		end
	end
	Reasign()
end
function Firstpage()
	page=1
	commands=save1
end
function Pager(name)
	if name==1 then
		commands=save1
		page=1
		elseif name==2 then
		commands=save2
		page=2
		else
		commands=save3
		page=3
	end
	Encounter.SetVar("page",page)
	State("ACTMENU")
end
function HandleCustomCommand(command)
	local bet=0
	if Encounter.GetVar("lives")<4 then
		bet=true
		else bet=false
	end
	if Encounter.GetVar("wons")==1 then
		if Encounter.GetVar("lang")=="rus" then
			BattleDialog("Прекрати,[w:3] актёр.[w:6]\nПредметы не казённые.[w:6] Она не стоит их использования.")
			else
			BattleDialog("Burada dur,[w:3] aktör.[w:6]\nİnsan adındaki çöplük için bu eşyalar çok değerli.")
		end
		elseif Encounter.GetVar("eated")==false then
		Encounter.SetVar("itemamount",Encounter.GetVar("itemamount")-1)
		if command=="ДОМ ЛАЗ" then
			local l=Encounter.GetVar("lastface")
			SetGlobal("facial_expression",65)
			BattleDialog({"Ты съел Домашнюю лазанью[waitall:4][w:3]...[waitall:1][w:3]\nЧара смотрит на тебя с презрением.","Энергия переполняет тебя!","[func:RestoreFace][next]"})
			Encounter.SetVar("quiche",true)
			Encounter.SetVar("quichehp",Player.hp)
			Encounter.SetVar("eated",true)
			number[1]=false
			elseif command=="ПАУ ПОН" then
			BattleDialog({"Ты съел Паучий пончик[waitall:4][w:3]...[waitall:1][w:3]\nНа вкус,[w:3] как пауки[waitall:4][w:3]...[waitall:1][w:3] Впрочем,[w:3] на вид тоже.","Неуязвимость была повышена!"})
			Encounter.SetVar("ghostresistance",true)
			Encounter.SetVar("eated",true)
			if number[2]==true then
				number[2]=false
				else number[3]=false
			end
			elseif command=="ЧЕРЕП ЧАЙ" then
			BattleDialog({"Ты выпил Черепаший чай[waitall:4][w:3]...[waitall:1][w:3]\nКажется,[w:3] мой мозг начал работать на все 100%?","Чувствую себя быстрее."})
			Encounter.SetVar("eated",true)
			Encounter.SetVar("movefast",true)
			if number[4]==true then
				number[4]=false
				else number[5]=false
			end
			elseif command=="КУС СНЕГ" then
			BattleDialog({"Ты съел Кусок снеговика[waitall:4][w:3]...[waitall:1][w:3]\nПрискорбно,[w:3] его приключение окончилось,[w:3] чтобы завершилось наше.","Ожоги теперь нам не страшны."})
			Encounter.SetVar("burnresistance",true)
			number[6]=false
			Encounter.SetVar("eated",true)
			elseif command=="СВЯТ ВОД" then
			local curse="Зачем она вообще?"
			if Encounter.GetVar("prog")>52 then
				curse="Проклятие было замедленно"
			end
			BattleDialog({"Ты выпил Святую воду[waitall:4][w:3]...[waitall:1][w:3]\nКажется,[w:3] призракам такое не очень полезно.",curse})
			if Player.hp>10 then
				Player.Hurt(10,0)
				else Player.Hurt(Player.hp-1)
			end
			Encounter.SetVar("curseresistance",true)
			Encounter.SetVar("eated",true)
			local n=false
			for i=0,5 do
				if number[12-i]==true then
					number[12-i]=n
					n=true
				end
			end
			elseif command=="ПРОК ВОД" then
			BattleDialog({"Ты выпил Проклятую воду[waitall:4][w:3]...[waitall:1][w:3]\nИнтересно,[w:3] кто её проклял?","Восстановлено 10 ОЗ."})
			Player.Heal(10)
			local n=false
			Encounter.SetVar("eated",true)
			for i=7,12 do
				if number[i]==true then
					number[i]=n
					n=true
				end
			end
			elseif command=="YAP LAZ" then
			SetGlobal("facial_expression",65)
			BattleDialog({"Ev Yapımı Lazanyayı yedin[waitall:4][w:3]...[waitall:1][w:3]\nChara sana küçümseyerek bakıyor.","Enerji seni bunaltıyor!","[func:RestoreFace][next]"})
			Encounter.SetVar("quiche",true)
			Encounter.SetVar("quichehp",Player.hp)
			Encounter.SetVar("eated",true)
			number[1]=false
			elseif command=="ÖRÜ DON" then
			BattleDialog({"Örümcek Donatını yedin[waitall:4][w:3]...[waitall:1][w:3]\nTadı örümcek gibi[waitall:4][w:3]...[waitall:1][w:3] Çok benziyor ama.","Sağlamlığın arttı!"})
			Encounter.SetVar("ghostresistance",true)
			Encounter.SetVar("eated",true)
			if number[2]==true then
				number[2]=false
				else number[3]=false
			end
			elseif command=="KAP ÇAY" then
			BattleDialog({"Kaplumbağa Çayını içtin[waitall:4][w:3]...[waitall:1][w:3]\nBeynim %100 çalışmaya başlıyor gibimi görünüyor?","Daha hızlı hissediyorum."})
			Encounter.SetVar("eated",true)
			Encounter.SetVar("movefast",true)
			if number[4]==true then
				number[4]=false
				else number[5]=false
			end
			elseif command=="KAR PARÇ" then
			BattleDialog({"Kardan Adam Parçasını yedin[waitall:4][w:3]...[waitall:1][w:3]\nNe yazık ki,[w:3] bizimkinin devam etmesi için onun macerası sona erdi.","Artık yanıklardan korkmuyoruz."})
			Encounter.SetVar("burnresistance",true)
			number[6]=false
			Encounter.SetVar("eated",true)
			elseif command=="KUTS SU" then
			local curse="Neden herşey gerekli?"
			if Encounter.GetVar("prog")>52 then
				curse="Lanet yavaşladı."
			end
			BattleDialog({"Kutsal Suyu içtin[waitall:4][w:3]...[waitall:1][w:3]\nHayaletler için pek kullanışlı değil gibi[waitall:4][w:3]...[waitall:1][w:3]",curse})
			if Player.hp>10 then
				Player.Hurt(10,0)
				else Player.Hurt(Player.hp-1)
			end
			Encounter.SetVar("curseresistance",true)
			Encounter.SetVar("eated",true)
			local n=false
			for i=0,5 do
				if number[12-i]==true then
					number[12-i]=n
					n=true
				end
			end
			elseif command=="LANE SU" then
			BattleDialog({"Lanetli Suyu içtin[waitall:4][w:3]...[waitall:1][w:3]\nKimin lanetlediğini merak ediyorum","10 CAN yenilendi."})	
			Player.Heal(10)
			local n=false
			Encounter.SetVar("eated",true)
			for i=7,12 do
				if number[i]==true then
					number[i]=n
					n=true
				end
			end
		end
		local n=true
		for i=1,12 do
			if number[i]==true then
				n=false
			end
		end
		if n==true and Encounter.GetVar("phase")==1 then
			Encounter.Call("GotAchivement",7)
		end
		else
		if Encounter.GetVar("lang")=="rus" then
			BattleDialog({"Вы не можете использовать \nдва предмета за ход."})
			else
			BattleDialog({"Bir turda iki eşya\nkullanamazsın."})
		end
	end
	Reasign()
	Encounter.SetVar("itemed",true)
end
	

function RestoreFace()
	SetGlobal("facial_expression",Encounter.GetVar("lastface"))
end

function CursedWater()
	if number[7]==true and names[7]=="СВЯТ ВОД" then
		names[7]="ПРОК ВОД"
		elseif number[8]==true and names[8]=="СВЯТ ВОД" then
		names[8]="ПРОК ВОД"
		elseif number[9]==true and names[9]=="СВЯТ ВОД" then
		names[9]="ПРОК ВОД"
		elseif number[10]==true and names[10]=="СВЯТ ВОД" then
		names[10]="ПРОК ВОД"
		elseif number[11]==true and names[11]=="СВЯТ ВОД" then
		names[11]="ПРОК ВОД"
		elseif number[12]==true and names[12]=="СВЯТ ВОД" then
		names[12]="ПРОК ВОД"
	end
	if number[7]==true and names[7]=="KUTS SU" then
		names[7]="LANE SU"
		elseif number[8]==true and names[8]=="KUTS SU"" then
		names[8]="LANE SU"
		elseif number[9]==true and names[9]=="KUTS SU"" then
		names[9]="LANE SU"
		elseif number[10]==true and names[10]=="KUTS SU"" then
		names[10]="LANE SU"
		elseif number[11]==true and names[11]=="KUTS SU"" then
		names[11]="LANE SU"
		elseif number[12]==true and names[12]=="KUTS SU"" then
		names[12]="LANE SU"
	end
	Reasign()
end
