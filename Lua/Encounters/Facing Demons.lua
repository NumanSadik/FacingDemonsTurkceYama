--A Wild Chara Appears!
require "Monsters/chara"
music = "empty"
autolinebreak = true
encountertext = false
nextwaves ={"phase1/nicetomeetya"}
--nextwaves ={"betrayer/first"}
--nextwaves ={"betrayer/forth"}

flee=false
unescape=true
NameLetters={}
local col=require "Libraries/rotational_collision"
wavetimer =0
glitchedmercy=0
arenasize = {155, 130}
sadist = 0
MettaName=false
MettaNameTime=0
SlowingDown=false
SlowingDownTime=0
movement=false
quick=false
TextObjects={}
TrueKnifes={}
LightTime=0
DidChange=false
SkipVoice=false
NewAudio.CreateChannel("blip")
ShowDeathCounter=true
SetGlobal("Playerisdead",false)
ChocolateHand=false

for i=1,7 do
	TextObjects[i]=CreateSprite("empty","BelowPlayer",0,0)
	TextObjects[i].SetVar("inside",false)
	TextObjects[i].SetVar("used",false)
end


PlayerHurtedHimself=0
CharaIsRaging=false
checking=false
MenuBullets=false
quickwave={"phase1/nicetomeetya"}
--quickwave={"k_4"}
unescape=false
Inventory.AddCustomItems({"Ketchup", "Spaghetti", "Chocolate", "Raw pie", "Sushi", "Ramen","Ketchdown"}, {0, 0, 0, 0, 0, 0, 0, 0, 0})
ingoprog=0
goneto=0
savex=0
savey=0
enemies = {
"chara",
"chara",
"spare",
"items",
"nobody",
"AngryMetta",
"FadingChara"
}
ammo=1
enemypositions={
{-30,0},
{-90,0},
{0,0},
{0,0},
{-374,-50},
{-250,-280},
{-374,-50}
}

ToHappyTitres=0
----------------- Последние слова --------------------

outro1="[func:DUB,death1/1][func:head4][func:Music,finale][w:3][waitall:2]Ч-черт."
outro2="[func:DUB,death1/2][func:head4][w:1][waitall:3]*кашель*"
outro3="[func:DUB,death1/3][func:Final_4][w:3][waitall:1]Ну [w:3]ко[w:1]не[w:1]чн[w:1]о... [w:8][waitall:1][func:Final_2]\nУ меня не было \n[waitall:2]ни шанса..."
outro4="[func:head4]..."
outro5="[func:DUB,death1/4][func:Final_4][w:16]Я об[w:1]ещ[w:1]ал[w:1]а [waitall:2]Аззи, \n[waitall:1]что буду с ним \nдо [waitall:2]конца..."
outro6="[func:DUB,death1/5]И,[w:15] [waitall:2]знаешь[waitall:4]...[waitall:1] [func:Final_6]Я \nвыполнила своё \n[waitall:2]обещание.[w:10] \n[waitall:1]Я была хо[w:1]ро[w:1]ше[w:1]й \n[w:1]се[w:1]ст[w:1]рой[waitall:4]..."
outro7="[func:DUB,death1/6][func:Final_4][w:3]С са[w:1]мо[w:1]го мо[w:1]ег[w:1]о \nпадения,[w:4] я хотела \n[waitall:2]умереть.[w:16] Я [waitall:1]хотела \nзабыть [w:2]всю [w:2]ту [w:1]боль,[w:12] \nчто пытала меня \n[w:1]де[w:1]нь[w:1] от[w:1]о дн[w:1]я..."
outro8="[func:DUB,death1/7][func:Final_4][w:1]А те[w:1]пе[w:1]рь,[w:12] перед \nлицом [waitall:2]смерти[w:5]...[waitall:1][w:2] [func:head4]\nЯ [w:1][waitall:2]жалею."
outro9="[func:DUB,death1/8][w:4][waitall:2]Жалею,[w:5][waitall:1] что[w:2] столько \nне[w:1] [waitall:2]сделала.[w:14] \nНе[w:2][waitall:1] смогла защитить \n[waitall:2]близких.[w:15] \nТех,[w:7][waitall:1] кто[waitall:2] спас меня[w:1]."
outro10="[func:DUB,death1/9][func:deadly][w:9]По[w:1]ла[w:1]га[w:1]ю[waitall:4]...[waitall:1] [func:smile]\nВ этом плане ты \nпо[w:1]бе[w:1]ди[w:1]л"
outro11="[func:DUB,death1/10][func:Final_3][w:15]Кровь[waitall:5]...[waitall:1] \nбольше не \nпу[w:1]ль[w:1]си[w:1]ру[w:1]ет[waitall:5]..."
outro12="[func:DUB,death1/11][func:Final_4][w:15]Так[w:4].[w:4].[w:4].[w:4] [waitall:2]Спокойно[waitall:5]..."
outro13="..."
outro14="[func:DUB,death1/12][w:15]Я[w:2] бы[w:1]ла пра[w:3]ва.[w:20] Ты \n[w:1]не [w:1]наш[w:1] спа[w:2]си[w:1]те[w:1]ль."
outro15="[func:DUB,death1/13]Ты просто[waitall:5]...[waitall:2][w:12] [func:Final_creepy]\n[color:ff0000]ЖАЛКИЙ \nБРАТО[w:1]У[w:1]БИ[w:2]Й[w:1]ЦА[color:ffffff]."
outro16="[func:DUB,death1/14][func:head4][waitall:3][func:Cough2]*тяжелый кашель*[w:15] "
outro17="[func:DUB,death1/15][func:head4][w:15]Аз[w:3]зи[waitall:5]...[waitall:1][w:13] Ма[w:3]ма[waitall:5]...[waitall:1][w:13] Па[w:3]па[waitall:5]...[waitall:1][w:9] \nПро[w:1]сти[w:1]те[w:1] ме[w:1]ня[waitall:5]...[waitall:1]"
outro18="[func:DUB,death1/16][func:QuietMusic][func:Final_7][w:1]Я[w:4].[w:4].[w:4]. [w:15]Мы [w:1]ско[w:1]ро[w:4].[w:4].[w:4].[w:15] \nВс[w:1]тре[w:1]ти[w:1]мся[w:4].[w:4].[w:4].[func:dead][w:60][func:WON][next] "

rusout={outro1,outro2,outro3,outro4,outro5,outro6,outro7,outro8,outro9,outro10,outro11,outro12,outro13,outro14,outro15,outro16,outro17,outro18}

outro1="[func:head4][func:Music,finale][w:3][waitall:2]Ч-черт."
outro2="[func:head4][w:1][waitall:3]*кашель*"
outro3="[func:Final_4][w:3][waitall:1]Ну [w:3]ко[w:1]не[w:1]чн[w:1]о... [w:8][waitall:1][func:Final_2]\nУ меня не было \n[waitall:2]ни шанса..."
outro4="[func:head4]..."
outro5="[func:Final_4][w:16]Я об[w:1]ещ[w:1]ал[w:1]а [waitall:2]Аззи, \n[waitall:1]что буду с ним \nдо [waitall:2]конца..."
outro6="И,[w:15] [waitall:2]знаешь[waitall:4]...[waitall:1] [func:Final_6]Я \nвыполнила своё \n[waitall:2]обещание.[w:10] \n[waitall:1]Я была хо[w:1]ро[w:1]ше[w:1]й \n[w:1]се[w:1]ст[w:1]рой[waitall:4]..."
outro7="[func:Final_4][w:3]С са[w:1]мо[w:1]го мо[w:1]ег[w:1]о \nпадения,[w:4] я хотела \n[waitall:2]умереть.[w:16] Я [waitall:1]хотела \nзабыть [w:2]всю [w:2]ту [w:1]боль,[w:12] \nчто пытала меня \n[w:1]де[w:1]нь[w:1] от[w:1]о дн[w:1]я..."
outro8="[func:Final_4][w:1]А те[w:1]пе[w:1]рь,[w:12] перед \nлицом [waitall:2]смерти[w:5]...[waitall:1][w:2] [func:head4]\nЯ [w:1][waitall:2]жалею."
outro9="[w:4][waitall:2]Жалею,[w:5][waitall:1] что[w:2] столько \nне[w:1] [waitall:2]сделала.[w:14] \nНе[w:2][waitall:1] смогла защитить \n[waitall:2]близких.[w:15] \nТех,[w:7][waitall:1] кто[waitall:2] спас меня[w:1]."
outro10="[func:deadly][w:9]По[w:1]ла[w:1]га[w:1]ю[waitall:4]...[waitall:1] [func:smile]\nВ этом плане ты \nпо[w:1]бе[w:1]ди[w:1]л"
outro11="[func:Final_3][w:15]Кровь[waitall:5]...[waitall:1] \nбольше не \nпу[w:1]ль[w:1]си[w:1]ру[w:1]ет[waitall:5]..."
outro12="[func:Final_4][w:15]Так[w:4].[w:4].[w:4].[w:4] [waitall:2]Спокойно[waitall:5]..."
outro13="..."
outro14="[w:15]Я[w:2] бы[w:1]ла пра[w:3]ва.[w:20] Ты \n[w:1]не [w:1]наш[w:1] спа[w:2]си[w:1]те[w:1]ль."
outro15="Ты просто[waitall:5]...[waitall:2][w:12] [func:Final_creepy]\n[color:ff0000]ЖАЛКИЙ \nБРАТО[w:1]У[w:1]БИ[w:2]Й[w:1]ЦА[color:ffffff]."
outro16="[func:head4][waitall:3][func:Cough2]*тяжелый кашель*[w:15] "
outro17="[novoice][voice:weakchara][func:head4][w:15]Аз[w:3]зи[waitall:5]...[waitall:1][w:13] Ма[w:3]ма[waitall:5]...[waitall:1][w:13] Па[w:3]па[waitall:5]...[waitall:1][w:9] \nПро[w:1]сти[w:1]те[w:1] ме[w:1]ня[waitall:5]...[waitall:1]"
outro18="[novoice][voice:weakchara][func:QuietMusic][func:Final_7][w:1]Я[w:4].[w:4].[w:4]. [w:15]Мы [w:1]ско[w:1]ро[w:4].[w:4].[w:4].[w:15] \nВс[w:1]тре[w:1]ти[w:1]мся[w:4].[w:4].[w:4].[func:dead][w:60][func:WON][next] "

rusoutn={outro1,outro2,outro3,outro4,outro5,outro6,outro7,outro8,outro9,outro10,outro11,outro12,outro13,outro14,outro15,outro16,outro17,outro18}
--rusoutn={outro18}

outro1 = "[func:DUB,death1/1][noskip][func:head4][func:Music,finale][w:6]L[w:6]-[speed:0.75]lanet olsun[waitall:5]..."
outro2 = "[func:DUB,death1/2][noskip][w:6][waitall:3]*Öhöm*"
outro3 = "[func:DUB,death1/3][noskip][func:Final_4][w:6][speed:0.5]Heh,[w:9][speed:0.75] tabiki[waitall:4]...[speed:1][w:2] \n[func:Final_2]tabiki[w:10] sana karsi \nkazanamazdım."
outro4 = "[noskip][func:head4][waitall:5]..."
outro5 = "[func:DUB,death1/4][noskip][func:Final_4][w:6][speed:0.75]Rei'ye söz verdim,[w:6][speed:1.2] \nsonuna kadar onunla[w:12] \n[speed:0.75]olacağıma dair[waitall:5]..."
outro6 = "[func:DUB,death1/5][noskip][w:9][speed:0.75]And,[w:9] ya`know[waitall:3]...[speed:0.75][w:1] \n[func:Final_6]Sözümü tuttum.[w:23] \nİyi bir ablaydım."
outro7 = "[func:DUB,death1/6][noskip][func:Final_4][w:5][speed:0.75]Düşüşümden beri,[w:8] \nÖlmeyi diledim.[w:14][speed:1] \nBu günleri unutmayı[w:2][speed:1] \ndiledim[w:1]..."
outro8 = "[func:DUB,death1/7][noskip][w:7]Ve şimdi,[w:13] sonumu \ngörüyorum[waitall:5]...[w:10][waitall:2] [func:head4] [speed:0.33] \nbunu reddediyorum."
outro9 = "[func:DUB,death1/8][noskip][w:11][speed:1]Onları korumak için \n[speed:0.75]hiç bir şey[waitall:1][w:17] \nYapmadım."
outro10 = "[func:DUB,death1/9][noskip][func:deadly][w:12][speed:0.75]Sanırım[waitall:3]...[waitall:1][w:1][func:smile][speed:0.75] bir şekilde [w:22] \nsen kazandın."
outro11 = "[func:DUB,death1/10][noskip][func:Final_3][w:8][speed:0.75]Kan[waitall:5]... [speed:0.75][w:1]artık \nhissetmiyorum[waitall:5]..."
outro12 = "[func:DUB,death1/11][noskip][w:14][waitall:3][func:Final_4]Çok[waitall:5]...[waitall:2][w:9] \nSakin[waitall:5]..."
outro13 = "[noskip][waitall:5]..."
outro14 = "[func:DUB,death1/12][noskip][w:10]Haklıydım.[w:23] \nKurtarıcımız[w:7][speed:0.75] \ndeğilsin."
outro15 = "[func:DUB,death1/13][noskip][w:9][speed:0.75]Sen[waitall:5]...[waitall:2][w:4]\n[func:Final_creepy][color:ff0000]DIRTY[w:2] \nPİSLİĞİN TEKİSİN."
outro16 = "[func:DUB,death1/14][noskip][waitall:3][func:head4][func:Cough2]*öhöm*"
outro17 = "[func:DUB,death1/15][noskip][waitall:2][w:3]Rei[waitall:5]...[waitall:2][w:5] Anne[waitall:5]...[waitall:2][w:5] Baba[waitall:5]...[waitall:2][w:5] \nLütfen,[w:15] beni affedin[waitall:5]..."
outro18 = "[func:DUB,death1/16][func:QuietMusic][noskip][waitall:2][func:Final_7][w:9]Ben[waitall:5]...[waitall:2][w:6] yakında[waitall:5]...[waitall:4] \ngörüşeceğiz[waitall:5]...[func:dead][w:60][func:WON][next] "


engout={outro1,outro2,outro3,outro4,outro5,outro6,outro7,outro8,outro9,outro10,outro11,outro12,outro13,outro14,outro15,outro16,outro17,outro18}

outro1 = "[func:DUB,death1/1][noskip][func:head4][func:Music,finale][w:6]L[w:6]-[speed:0.75]lanet olsun[waitall:5]..."
outro2 = "[func:DUB,death1/2][noskip][w:6][waitall:3]*Öhöm*"
outro3 = "[func:DUB,death1/3][noskip][func:Final_4][w:6][speed:0.5]Heh,[w:9][speed:0.75] tabiki[waitall:4]...[speed:1][w:2] \n[func:Final_2]tabiki[w:10] sana karsi \nkazanamazdım."
outro4 = "[noskip][func:head4][waitall:5]..."
outro5 = "[func:DUB,death1/4][noskip][func:Final_4][w:6][speed:0.75]Rei'ye söz verdim,[w:6][speed:1.2] \nsonuna kadar onunla[w:12] \n[speed:0.75]olacağıma dair[waitall:5]..."
outro6 = "[func:DUB,death1/5][noskip][w:9][speed:0.75]And,[w:9] ya`know[waitall:3]...[speed:0.75][w:1] \n[func:Final_6]Sözümü tuttum.[w:23] \nİyi bir ablaydım."
outro7 = "[func:DUB,death1/6][noskip][func:Final_4][w:5][speed:0.75]Düşüşümden beri,[w:8] \nÖlmeyi diledim.[w:14][speed:1] \nBu günleri unutmayı[w:2][speed:1] \ndiledim[w:1]..."
outro8 = "[func:DUB,death1/7][noskip][w:7]Ve şimdi,[w:13] sonumu \ngörüyorum[waitall:5]...[w:10][waitall:2] [func:head4] [speed:0.33] \nbunu reddediyorum."
outro9 = "[func:DUB,death1/8][noskip][w:11][speed:1]Onları korumak için \n[speed:0.75]hiç bir şey[waitall:1][w:17] \nYapmadım."
outro10 = "[func:DUB,death1/9][noskip][func:deadly][w:12][speed:0.75]Sanırım[waitall:3]...[waitall:1][w:1][func:smile][speed:0.75] bir şekilde [w:22] \nsen kazandın."
outro11 = "[func:DUB,death1/10][noskip][func:Final_3][w:8][speed:0.75]Kan[waitall:5]... [speed:0.75][w:1]artık \nhissetmiyorum[waitall:5]..."
outro12 = "[func:DUB,death1/11][noskip][w:14][waitall:3][func:Final_4]Çok[waitall:5]...[waitall:2][w:9] \nSakin[waitall:5]..."
outro13 = "[noskip][waitall:5]..."
outro14 = "[func:DUB,death1/12][noskip][w:10]Haklıydım.[w:23] \nKurtarıcımız[w:7][speed:0.75] \ndeğilsin."
outro15 = "[func:DUB,death1/13][noskip][w:9][speed:0.75]Sen[waitall:5]...[waitall:2][w:4]\n[func:Final_creepy][color:ff0000]DIRTY[w:2] \nPİSLİĞİN TEKİSİN."
outro16 = "[func:DUB,death1/14][noskip][waitall:3][func:head4][func:Cough2]*öhöm*"
outro17 = "[func:DUB,death1/15][noskip][waitall:2][w:3]Rei[waitall:5]...[waitall:2][w:5] Anne[waitall:5]...[waitall:2][w:5] Baba[waitall:5]...[waitall:2][w:5] \nLütfen,[w:15] beni affedin[waitall:5]..."
outro18 = "[func:DUB,death1/16][func:QuietMusic][noskip][waitall:2][func:Final_7][w:9]Ben[waitall:5]...[waitall:2][w:6] yakında[waitall:5]...[waitall:4] \ngörüşeceğiz[waitall:5]...[func:dead][w:60][func:WON][next] "

engoutn={outro1,outro2,outro3,outro4,outro5,outro6,outro7,outro8,outro9,outro10,outro11,outro12,outro13,outro14,outro15,outro16,outro17,outro18}
-----------------------------------------------------------------
--ruscomm = {"Последний актёр на сцене", "Чара выглядит недовольной", "Осталось только ДРАТЬСЯ", "Ты наполнен ПРЕДАТЕЛЬСТВОМ.", "Пахнет трусом.", "Сотри их в пыль.", "Очередной дурак.", "ДЕРИСЬ или УМРИ.", "Тебе ничего не остаётся.", "Ещё не поздно умереть.", "Чара хихикнула.", "Прячься или дерись.", "Точка невозврата.", "Тебе стоит попытаться сильнее.", "Объясни себе свои действия.", "Присоединяйся к битве.", "Никакой ПОЩАДЫ.", "Тебе придётся уМЕРГеть.", "Чара дрожит.", "Ничего особенного.", "Вступи в шоу и закончи его!", "Новое начало.", "Необычная временная линия.", "Суд.", "Навсегда один.", "Пыль на твоих руках кажется \rнормой.", "Просто ДЕРИСЬ.", "Не останавливайся отныне!"}
--In any way, who really  cares about this?
--engcomm ={"Sahnedeki son aktör.", "Chara üzgün görünüyor.", "Sadece SAVAŞABİLİRSİN.", "İHANET ile doldun.", "Ahmak kokuyor.", "Onu yok et.", "Başka bir aptal.", "SAVAŞ ya da ÖL.", "Sana bir şey kalmadı.", "Ölmek için geç değil.", "Chara sinirli görünüyor.", "KARARLILIĞIN Artıyor!", "Saklan yada savaş.", "Geri dönemezsin.", "Daha iyisini yapmalısın", "Kendince hallet.", "Savaşa katıl.", "MERHAMET yok.", "Ugh...", "Chara.", "Özel bir şey yok.", "Kestik!", "Yeni başlangıç.", "...", "Yargı.", "Sonsuza kadar yalnız.", "Elindeki toz\rnroaml görünüyor.", "Savaş!.", "Durma!"}
engcom={""}
ruscom={""}
herecomments=engcom
-- A custom list with attacks to choose from. Actual selection happens in EnemyDialogueEnding(). Put here in case you want to use it.
possible_attacks = {"k_6", "k_5", "k_4", "field", "k_1", "k_3", "bullettest_bouncy", "bullettest_chaserorb", "bullettest_touhou", "knives2", "knives4", "red1", "red2", "red3", "red4", "gb", "bullettest_blackhole", "2lasers", "k_random", "k_storm", "firespears", "seedfield", "asrielaser", "electro_rain", "spiderdance", "listopad", "green9000"}
--possible_attacks = {"fake", "asrielaser"}
songs={"night","insane","devil"}
phase=1
soulpos={6,10}
Dings={}
level20=false
Titr1={}
Titr1.timer=0
Titr1.phase=0
Titr1.step=0

Titr2={}
Titr2.timer=0
Titr2.phase=0
Titr2.step=0
SaveCharaHP=1500

PlayerFlirtCount=0
ToHappyEnd=0
PlaysIntro=false
Achiventor={}
CreateLayer("Over","Top",false)
CreateLayer("Ach","Over",false)
Achiventor.Time=0
Achiventor.outgos={}
Achiventor.spr=CreateSprite("system/achievementrus","Ach")
Achiventor.spr.MoveToAbs(470,6000)

Achiventor.ico=CreateSprite("empty","Ach")
Achiventor.ico.MoveTo(548,530)
Achiventor.txt=CreateText("[novoice]  ",{290,540},480,"Ach",-1)
Achiventor.txt.HideBubble()
Achiventor.txt.progressmode="none"
GlobalSaveTimer=0
SoulIs=1
AllDark=0
dramatimer=0
drama=false
deathsnew=0
FadedChara=0
CHARA=false
shadowtarget=0
SuddenStrike=false
voicetime=0
PossessedTime=0
PlayerHasSpared=0
PlayerHasBeaten=0
playerskipdocommand=true
BoneFriend=false
firsttime=true
lang="eng"
deathtimer=false
Reminder=false
EpicKnife=false
forcedfight=false
cursetime=0
FlashBack=0
MAXFADE=120
cursefade=MAXFADE
cursealpha=0
phone=false
IsCursed=false
deadlyhit=false
phase15slowmusic=false
lowmusicvolume=1
KnifedButton=false
PlayerGotsKilled=0
AllMusics={"night","wound","stri","last","prolog","blood","theme","finale","menu","chainsaw","insane","spare","Not Forget","fires","devil","lost","SAVE1","SAVE2","insa","CaP","star","reunion"}
cursetext={"Я не врач, но я констатирую смерть.","Well, you were cursed to death. Horrific indeed."}
canflee=false
spawn=false
IsTalk=false
systemfight=false
mercypoint=0
MettaLost=false
SetGlobal("progress",0)
prog=0
diff=2
NoGameTime=false
NoGameStep=0
OverMenuTime=false
dubbing=false
clmd =""
Pellets=false
DoesPellets=false
PELLETS={}
FightGoes=true
colored=false
ButtonsTime=-1
QuietMusic=false
QuietMusicTime=0
pointers={}
hpknife=false
knifereload=0
knifestage=0
cursedinteger=1
nonestate=false
nameliv=false
lastenemy=0
numbers=0
fiststime=0
healthtime=0
chainsaw=true
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
GotToSpareChara={"0","0","0"}
slicetime=0
globalstage="0"
PlayerBloodDrop={}
Player_ATK=38
nosleep=false
Replacement=false
SetGlobal("curse",0)
SetGlobal("cursed",0)
SetGlobal("pray",0)
SetGlobal("knifeinhand", false)-- сначала нож спрятан
SetGlobal("facial_expression", 0)
SetGlobal("evasion", 0)
SetGlobal("hurtanim", 0)--анимация ранения
alltimer = 0--внедрение общего счётчика кадров позволит реализовать всякие вспомогательные штуки-дрюки.
fightstage = 0
HaveKilledChara=false
lastbutton = 1
timing1={}
pieces={}
deaths=0
alldeaths=0
cursedtime=0
normalend="false"
lowmusic=false
ready_to_evade = true
SetGlobal("sansisdead",0)
fighttimer=0
fighting=false
OverButtons={}
curmusic="menu"
slashtime=0
misstime=0
PlayerHasPlayedThisGame=false
PlayerHadHurted=false
PlayerWasHurted=0
PlayerHasFlirted=0
PlayerHasItems=5
SparedFirstTime=0
ButtonUsed=0
Evrywhere=0
damages={}
playerblood={}
MettaHead=CreateSprite("MettaHead","Top")
MettaHead.x=320
MettaHead.y=240
MettaHead.alpha=0
MettaHead.SetVar("time",-10)
for i=1,100 do
	local bl=CreateSprite("empty","BelowPlayer")
	bl.SetVar("working",false)
	bl.x=0
	bl.y=0
	table.insert(playerblood,bl)
end
ghostsnow={}
ghostsappeared={}

LostMercy=0
playerbloodnumber=1
truedamage=false
canattack=true
fists={}
firsthp=1500
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
ChoosingSong={}
ChoosingSong.now="menu"
ChoosingSong.old="menu"
ChoosingSong.time=60
ChoosingSong.go=false
colortime={0,0,0}
speedcolor={2,2,2}
wons=0
buttons={}
answer_yes=0
answer_no=0
olimp=20
dodgetime=0
fighttim=false
itemed=false
blooding=false
cursedwater=false
ghostresistance=false
movefast=false
curseresistance=false
burnresistance=false
movefast=false
eated=false
dummy=0
animation=0
MaxHP=92
GotHits=1
lives=4
lastpoint=1
blooddrop={}
Achivements={}
for i=1,12 do
	Achivements[i]="0"
end
NewAudio.CreateChannel("Hits")
NewAudio.PlaySound("Hits","hurtsound",false,1)
NewAudio.Stop("Hits")
NewAudio.CreateChannel("glitch")
NewAudio.PlaySound("glitch","glitch",false,1)
NewAudio.Stop("glitch")
NewAudio.CreateChannel("levelup")
NewAudio.PlaySound("levelup","levelup",false,1)
NewAudio.Stop("levelup")
buttonsname={}
systemfighter=false
SetGlobal("Betrayel",false)
NewAudio.CreateChannel("dubber")
SavioWrite=Misc.OpenFile("Forever.IGNI","w")
FallingKnife={}
FallingKnife.Knife=CreateSprite("KnifeFallen0","BelowPlayer")
FallingKnife.Knife.MoveTo(0,0)
FallingKnife.Knife.alpha=0
FallingKnife.timer=0
FallingKnife.phase=0
function ChangeLanguage(ingo)
	if ingo=="rus" then
		herecomments=engcom
		enemies[1].Call("Lang","rus")
		enemies[3].Call("Lang","rus")
		enemies[4].Call("ChangeLanguage","rus")
		else
		herecomments=ruscom
		enemies[3].Call("Lang","eng")
		enemies[1].Call("Lang","eng")
		enemies[4].Call("ChangeLanguage","eng")
	end
	RedoBut()
end
function GetSavio()
	local ans=SavioRead.ReadLines()
	if ans[1]=="0" then
		lang="eng"
		herecomments=engcom
		elseif ans[1]=="1" then
		lang="rus"
		herecomments=ruscom
	end
	if ans[2]=="0" then
		currentspr="1.2"
		elseif ans[2]=="1" then
		currentspr="1.1.7"
		elseif ans[2]=="2" then
		currentspr="1.1.6"
	end
	if ans[3]=="0" then
		clmd=""
		colored=false
		elseif ans[3]=="1" then
		clmd="_color"
		colored=true
	end
	if ans[4]=="0" then
		normalend="false"
		elseif ans[4]=="1" then
		normalend="true"
	end
	if ans[5]=="0" then
		songs[1]="night"
		elseif ans[5]=="1" then
		songs[1]="insa"
	end
	if ans[6]=="0" then
		songs[2]="insane"
		elseif ans[6]=="1" then
		songs[2]="blood"
	end
	if ans[7]=="0" then
		songs[3]="devil"
		elseif ans[7]=="1" then
		songs[3]="fires"
	end
	if ans[8]=="0" then
		dubbing=true
		elseif ans[8]=="1" then
		dubbing=false
	end
	if ans[9]=="0" then
		diff=1
		elseif ans[9]=="1" then
		diff=2
		elseif ans[9]=="2" then
		diff=3
		elseif ans[9]=="3" then
		diff=4
	end
	for i=1,12 do
		Achivements[i]=ans[9+i]
	end
	globalstage=ans[22]
	if ans[23]=="0" then
		ShowDeathCounter=true
		else
		ShowDeathCounter=false
	end
	GotToSpareChara[1]=ans[24]
	GotToSpareChara[2]=ans[25]
	GotToSpareChara[3]=ans[26]
	enemies[1].SetVar("goneto",tonumber(ans[27]))
	if ans[28]=="0" then
		PlayerHasPlayedThisGame=false
		else
		PlayerHasPlayedThisGame=true
	end
	deaths=tonumber(ans[29])
	if ans[30]=="0" then
		HaveKilledChara=false
		else
		HaveKilledChara=true
	end
	alldeaths=tonumber(ans[31])
	if alldeaths<deaths then
		alldeaths=deaths
	end
	if ans[32]=="0" then
		blooding=false
		else
		blooding=true
	end
end

function MakeDing(ingospr,point,color)
	local ding=CreateProjectileAbs (ingospr,point[1],point[2],"Top")
	ding.SetVar("time",0)
	if not point[3] then
		ding.SetVar("size",3)
		else
		ding.SetVar("size",point[3])
	end
	if not color then
		else ding.sprite.color=color
	end
	table.insert(Dings,ding)
end


function WriteSavio()
	if lang=="eng" then
		WriteLine(1,"0")
		elseif lang=="rus" then
		WriteLine(1,"1")
	end
	if currentspr=="1.2" then
		WriteLine(2,"0")
		elseif currentspr=="1.1.7" then
		WriteLine(2,1)
		elseif currentspr=="1.1.6" then
		WriteLine(2,2)
	end
	if colored==false then
		WriteLine(3,0)
		elseif colored==true then
		WriteLine(3,1)
	end
	if normalend=="false" then
		WriteLine(4,0)
		elseif normalend=="true" then
		WriteLine(4,1)
	end
	if songs[1]=="night" then
		WriteLine(5,0)
		elseif songs[1]=="insa" then
		WriteLine(5,1)
	end
	if songs[2]=="insane" then
		WriteLine(6,0)
		elseif songs[2]=="blood" then
		WriteLine(6,1)
	end
	if songs[3]=="devil" then
		WriteLine(7,0)
		elseif songs[3]=="fires" then
		WriteLine(7,1)
	end
	if dubbing==true then
		WriteLine(8,0)
		elseif dubbing==false then
		WriteLine(8,1)
	end
	WriteLine(9,diff-1)
	for i=1,12 do
		WriteLine(9+i,Achivements[i])
	end
	WriteLine(22,globalstage)
	if ShowDeathCounter then
		WriteLine(23,0)
		else
		WriteLine(23,1)
	end
	WriteLine(24,GotToSpareChara[1])
	WriteLine(25,GotToSpareChara[2])
	WriteLine(26,GotToSpareChara[3])
	WriteLine(27,enemies[1].GetVar("goneto"))
	if PlayerHasPlayedThisGame==false then
		WriteLine(28,0)
		elseif PlayerHasPlayedThisGame==true then
		WriteLine(28,1)
	end
	WriteLine(29,deaths)
	if HaveKilledChara==false then
		WriteLine(30,0)
		else
		WriteLine(30,1)
	end
	WriteLine(31,alldeaths)
	if blooding==false then
		WriteLine(32,0)
		else
		WriteLine(32,1)
	end
end

function WriteLine(num,ingo)
	local outgo="0"
	if not ingo then
		else
		outgo=ingo
	end
	SavioWrite.ReplaceLine(num,ingo)
end
function GetFiles()
	if Misc.FileExists("Forever.IGNI")==true then
		SavioRead=Misc.OpenFile("Forever.IGNI","r")
		GetSavio()
		currentspr="1.2"
		clmd=""
		else
		for i=1,50 do	
			SavioWrite.Write("0\n",true)
		end
		WriteSavio()
	end
end

function Dub(ingo)
	if dubbing==true then
		NewAudio.PlaySound("dubber",lang.."/"..ingo,false,1)
		IsSpeak=true
	end
end


function OnHit()
end


function NewStart()
	BeginTheFight()
	wons=0
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
	Player_ATK=38
	SetGlobal("intro", true)
	SetGlobal("knifeinhand", false)
	prog=0
	SetGlobal("evade",0)
	SetGlobal("charaisdead", 0)
	SetGlobal("lie",0)
	evadelevel=1
	firsthp=1500
	Player.MoveTo(0,0,true)
	enemies[1].Call("SetActive",false)
	enemies[2].Call("SetActive",false)
	enemies[3].Call("SetActive",false)
	enemies[4].Call("SetActive",false)
	enemies[5].Call("SetActive",true)
	enemies[6].Call("SetActive",false)
	enemies[7].Call("SetActive",false)
	WriteSavio()
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
		elseif ingo=="insane" then
		outgo="blood"
		elseif ingo=="blood" then
		outgo="insane"
	end
	return outgo
end



function BeginTheFight()
	if diff==4 then
		MaxHP=1
		else
		MaxHP=92
		Player.hp=92
	end
	system.Set("system/normal")
	enemies[2].Call("SetActive",false)
	enemies[1].Call("SetActive",true)
	if quick==false then
		nextwaves={"phase1/nicetomeetya"}
		else
		nextwaves=quickwave
	end
	Wounded(1501,1501,1501)
	wavetimer =1000
	enemies[1].SetVar("dodge",true)
	enemies[4].Call("Recharge")
	enemies[1].SetVar("weak",false)
	enemies[1].SetVar("def",30)
	SetGlobal("charaisdead",0)
	SetGlobal("cursed",0)
	Player_ATK=38
	charasoul.alpha=0
	charasoul.Set(currentspr.."/chara/chara_soul1")
	SetGlobal("curse",0)
	SetGlobal("burn",0)
	State("NONE")
	SetGlobal("evasion",0)
	SetGlobal("timing",false)
	enemies[1].SetVar("hp",1500)
	if phase==1 then
		SetGlobal("pray",0)
		elseif phase==1.5 then
		SetGlobal("pray",4)
		else
		SetGlobal("pray",8)
	end
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
	ChangeLanguage(lang)
end




function OpenMenu()
	State("NONE")
	NAME=CreateProjectileAbs("empty",320,420,"BelowBullet")
	NAME.sprite.Set("overworld/devillogo")
	NAME.sprite.Scale(2,2)
	MyState="NONE"
	InState=1
	NormBut()
	local dib=""
	if dubbing==true then
		dib="on"
		else dib="off"
	end
	musicsprs={}
	phasesprs={}
	
end

function ReDoLanguage()
	if lang=="rus" then
		herecomments=ruscom
		elseif lang=="eng" then
		herecomments=engcom
	end
	NormBut()
	MenuOptions(1)
end

function ReDoSprites(ingo)
	BackSprites(ingo)
end

function RestoreFace()
	SetGlobal("facial_expression",lastface)
end

function BackSprites(ingo)
	standtime=0
	shadow.Set(currentspr.."/shadow")
	hpbar.Set("system/"..color.."/hpbar")
	system.Set("system/"..color.."/normal")
	curse.Set("system/"..color.."/curse")
	TrueBag.Set(ingo.."/bg")
	head_sp=ingo.."/chara/Chara_normal"
	torso_sp=ingo.."/chara/Chara_body0"
	legs_sp=ingo.."/chara/Chara_legs"
	facing=0
	if ingo=="1.2" then
		charahead.Scale(2,2)
		charatorso.Scale(2,2)
		charalegs.Scale(2,2)
		blood.Scale(2,2)
		shadow.Scale(2,1)
		woundx=-20
		woundy=4
		firstbloodx=14
		firstbloody=-20
		woundrandx=28
		woundrandy=28
		lgsx=320
		lgsy=276
		trsx=8
		bodymax=40
		hdx=-6
		soulpos={6,10}
		maxright=315
		maxleft=215
		headmax=64
		centerlegs=0
	end
	--charahead.Set(currentspr.."/chara/Chara_normal")
	--charatorso.Set(currentspr.."/chara/Chara_body")
	--charalegs.Set(currentspr.."/chara/Chara_legs")
	shadow.MoveTo(0,-(charalegs.height/2*charalegs.yscale)+1)
end



function MenuOptions(amm)
	for i=1,6 do
		if i==amm then
			Changer.Texts[i].color={1,0.1,0.2}
			else
			Changer.Texts[i].color={0.25,0,0.25}
		end
	end
	if amm==0 then
		fPlayer.MoveTo(Changer.Exit.x+12,Changer.Exit.y)
		Changer.Scroller.sprite.Set("system/settings_h")
		else
		fPlayer.MoveToAbs(Changer.Texts[amm].x-30,Changer.Texts[amm].y+10)
		Changer.Scroller.sprite.Set("system/settings_w")
	end
	if amm==4 then
		Changer.Texts[7].SetText("[font:overworld][instant][novoice]"..ShowDiffer(diff))
		elseif amm==5 then
		if lang=="rus" then
			Changer.Texts[7].SetText("[font:overworld][instant][novoice]Рекомендовано для мощных ПК")
			else
			Changer.Texts[7].SetText("[font:overworld][instant][novoice]Güçlü PClere Önerilir")
		end
		else
		Changer.Texts[7].SetText("[font:overworld][instant][novoice]  ")
	end
	Changer.Scroller.MoveTo(fPlayer.x,fPlayer.y)
end
function MyAchi(ingo)
	local n=ingo
	if n==0 then
		n=1
	end
	for i=1,3 do
		local num=i+n-1
		if Achivements[num]=="1" then
			Changer.Bilds[i].sprite.Set("system/Achivements/"..num)
			Changer.Discs[i].SetText("[font:overworld][instant][novoice]"..DiscAchivement(num))
			else
			Changer.Bilds[i].sprite.Set("system/Achivements/0")
			if lang=="rus" then
				Changer.Discs[i].SetText("[font:overworld][instant][novoice][color:888888]Закрыто")
				else
				Changer.Discs[i].SetText("[font:overworld][instant][novoice][color:888888]Kilitli")
			end
		end
		Changer.Names[i].SetText("[font:overworld][instant][novoice]"..NameAchivement(num))
	end
	if ingo==0 then
		fPlayer.MoveTo(Changer.Exit.x+12,Changer.Exit.y)
		Changer.Scroller.sprite.Set("system/settings_h")
		else
		fPlayer.MoveToAbs(130,Changer.Settings.absy+143-(ingo-1)/9*286)
		Changer.Scroller.sprite.Set("system/settings_w")
	end
	Changer.Scroller.MoveTo(fPlayer.x,fPlayer.y)
end

function MenuExtras(amm)
	for i=1,5 do
		if i==amm then
			Changer.Texts[i].color={1,0.1,0.2}
			else
			Changer.Texts[i].color={0.25,0,0.25}
		end
	end
	if amm>0 and amm<5 then
		Changer.Texts[1].color={1,0.1,0.2}
		Changer.Texts[2].color={1,0.1,0.2}
		Changer.Texts[3].color={1,0.1,0.2}
		Changer.Texts[4].color={1,0.1,0.2}
		else
		Changer.Texts[1].color={0.25,0,0.25}
		Changer.Texts[2].color={0.25,0,0.25}
		Changer.Texts[3].color={0.25,0,0.25}
		Changer.Texts[4].color={0.25,0,0.25}
	end
	if amm==0 then
		fPlayer.MoveTo(Changer.Exit.x+12,Changer.Exit.y)
		Changer.Scroller.sprite.Set("system/settings_h")
		else
		fPlayer.MoveToAbs(Changer.Texts[amm].x-30,Changer.Texts[amm].y+10)
		Changer.Scroller.sprite.Set("system/settings_w")
	end
	if amm>1 and amm<5 then
		ChoosingSong.now=songs[amm-1]
		else
		ChoosingSong.now="menu"
	end
	Changer.Scroller.MoveTo(fPlayer.x,fPlayer.y)
end
function MyChoice(ingo)
	local x=Changer.Texts[ingo].x-20
	fPlayer.MoveToAbs(x,130)
	for i=8,9 do
		Changer.Texts[i].color={0.25,0,0.25}
	end
	Changer.Texts[ingo].color={1,0.1,0.2}
end


function MenuWords(amm)
	for i=1,4 do
		if amm==i then
			OverText[i].color={1,0.1,0.2}
			else
			OverText[i].color={0.25,0,0.25}
		end
	end
	fPlayer.MoveToAbs(290,OverButtons[amm].absy)
end



function MenuMusic(amm, omm)
	for i=1,3 do
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

function MenuDiff(ingo)
	ArrowLeft.sprite.color={1,1,1}
	lan.sprite.color={1,1,1}
	if ingo==1 then
		FPlayer.MoveTo(lan.x-lan.sprite.width/2-16,dub.y)
		elseif ingo==2 then
		FPlayer.MoveTo(ArrowLeft.x+16,lan.y)
		ArrowLeft.sprite.color={1,0,1}
	end
end
		

function FullIntro()
	overworldfonebattle=CreateProjectileAbs("overworld/beforebattle",320,240,"Top")
	overworldfonetop=CreateProjectileAbs("overworld/fonetop",320,240,"BelowArena")
	overworldfone1=CreateProjectileAbs("overworld/fone1",320,240,"BelowBullet")
	overworldfone2=CreateProjectileAbs("overworld/fone2",320,240,"BelowBullet")
	overworldfone3=CreateProjectileAbs("overworld/fone3",320,240,"Top")
	overworldfrisk=CreateProjectileAbs("overworld/frisk",81,85.5,"BelowBullet")
	overworldfrisk.sprite.Scale(2.5,2.5)
	overworldchara=CreateProjectileAbs("overworld/chara",521,83,"BelowBullet")
	overworldchara.sprite.Scale(2.5,2.5)
	overworldface=CreateProjectileAbs(currentspr.."/chara/Chara_head05",106,386)
	overworldface.sprite.Set(currentspr.."/chara/Chara_head05")
	if currentspr=="1.1.6" then
		overworldface.sprite.Scale(2.5,2.5)
		else
		overworldface.sprite.Scale(2,2)
	end
	overworldface.SendToTop()
	overworldface.sprite.alpha=0
	overworldfrisk.sprite.SendToTop()
	overworldchara.sprite.SendToTop()
	overworldface.sprite.SendToTop()
	overworldfonebattle.sprite.SendToTop()
	overworldfonebattle.sprite.alpha=1
	local dial=""
	if globalstage=="5" then
		if lang=="rus" then
			if dubbing==true then
				dial={"[noskip][func:face,yes][next] ","[effect:twitch,1][font:overworld][color:ffffff][func:Peachy][func:DUB,prolog/1][w:3]*Вот мы и здесь.", "[func:normal][func:DUB,prolog/2][w:8]*С возвращением, \nпартнёр.","[func:Peachy]*[waitall:5]...", "[func:DUB,prolog/3][w:7][waitall:1.5]*Ты почти завершил \nпредначертанное,[w:3] [func:normal]не [func:JUMP]так [func:face,no][func:Vietnam][w:60]"}
				else
				dial={"[noskip][func:face,yes][next] ","[effect:twitch,1][font:overworld][color:ffffff][func:Peachy][func:DUB,prolog/1]*Вот мы и здесь.", "[func:normal][func:DUB,prolog/2]*С возвращением,[w:3] \nпартнёр.","[func:Peachy]*[waitall:4][w:3]...", "[func:DUB,prolog/3]*Ты почти завершил \nпредначертанное,[w:3] [func:normal]не [func:JUMP]так [func:face,no][func:Vietnam][w:60]"}
			end
			elseif lang=="eng" then
			dial={"[noskip][func:face,yes][next] ","[func:DUB,prolog/1][effect:twitch,1][font:overworld][color:ffffff][func:Peachy]*[waitall:2][w:10]Yani, [waitall:1][w:10]sonunda [w:1]buradayız[w:3].", "[func:DUB,prolog/2][func:normal]*Tekrar hoşgeldin, \npartner.","[func:Peachy]*[waitall:5]...", "[func:DUB,prolog/3][w:3][speed:1.5]*Neredeyse gö[w:1]re[w:1]vini \n[speed:1]tamamladın,[w:12]"}
		end
		else
		if lang=="rus" then
			if dubbing==true then
				dial={"[noskip][func:face,yes][next] ","[effect:twitch,1][font:overworld][color:ffffff][func:Peachy][func:checkquick][func:DUB,prolog/1][w:3]*Вот мы и здесь.", "[func:normal][func:DUB,prolog/2][w:8]*С возвращением, \nпартнёр.","[func:Peachy]*[waitall:5]...", "[func:DUB,prolog/3][w:7][waitall:1.5]*Ты почти завершил \nпредначертанное,[w:3] [func:normal]не так ли?", "[func:Interruption][w:1][func:DUB,prolog/4][func:normal1][w:5]*Просто[waitall:2]...[w:3][waitall:1] хотела убедиться.", "[func:Peachy]*[waitall:6]...", "[func:DUB,prolog/5][w:4]*Позволь задать тебе один \nвопрос.", "[func:normal][func:DUB,prolog/6][w:4][speed:1.2]*Ты уверен,[w:3] что [speed:1.3]ты \nвыше последствий?","[func:Peachy][func:DUB,prolog/7][w:4]*Что любые твои [w:2][waitall:2]деяния[waitall:5]...","[func:normal][noskip][func:DUB,prolog/8][w:2]*Останутся [w:2]безнаказанными?[w:30][func:ph1][func:face,no][next] "}
				else
				dial={"[noskip][func:face,yes][next] ","[effect:twitch,1][font:overworld][color:ffffff][func:Peachy][func:checkquick][func:DUB,prolog/1]*Вот мы и здесь.", "[func:normal][func:DUB,prolog/2]*С возвращением,[w:3] \nпартнёр.","[func:Peachy]*[waitall:4][w:3]...", "[func:DUB,prolog/3]*Ты почти завершил \nпредначертанное,[w:3] [func:normal]не так ли?", "[func:Interruption][w:1][func:DUB,prolog/4][func:normal1]*Просто[waitall:4][w:3]...[waitall:1][w:3] хотела убедиться.", "[func:Peachy]*[waitall:4][w:3]...", "[func:DUB,prolog/5]*Позволь задать тебе один \nвопрос.", "[func:normal][func:DUB,prolog/6]*Ты уверен,[w:3] что ты \nвыше последствий?","[func:Peachy][func:DUB,prolog/7]*Что любые твои деяния[waitall:4][w:3]..","[func:normal][noskip][func:DUB,prolog/8]*Останутся безнаказанными?[w:30][func:ph1][func:face,no][next] "}
			end
			elseif lang=="eng" then
			dial={"[noskip][func:face,yes][next] ","[func:DUB,prolog/1][effect:twitch,1][font:overworld][color:ffffff][func:Peachy][func:checkquick]*[waitall:2][w:10]Yani, [waitall:1][w:10]sonunda [w:1]buradayız[w:3].", "[func:DUB,prolog/2][func:normal]*Tekrar hoşgeldin, \npartner.","[func:Peachy]*[waitall:5]...", "[func:DUB,prolog/3][w:3][speed:1.5]*Neredeyse [w:1]görevini \n[speed:1]tamamladın.[w:12] [func:normal]", "[func:Interruption][w:1][func:DUB,prolog/4][func:normal1]*[w:2]Sadece [w:15]emin [w:1]olmak[w:1] istedim[w:1].", "[func:Peachy]*[waitall:6]...", "[func:DUB,prolog/5]*Bir şey[w:10] sormama [w:3]izin ver[w:5].", "[func:DUB,prolog/6][func:normal]*[w:2]Yaptğının[w:2],[w:5] kaderinden [speed:1.5]\nüstün [w:2][speed:1]olduğunu [w:1]mu \n[w:1]düşünüyorsun[w:4]?","[func:DUB,prolog/7][func:Peachy]*[w:3]Yaptıkların [w:1]tepkisiz [waitall:2]\nkalamaz[waitall:3]...[w:30][func:ph1][func:face,no][next] "}
		end
	end
	dial=EveryDial(dial,"[effect:twitch,1][font:overworld][noskip][color:ffffff]","[novoice]")
	NewAudio.SetVolume("dubber",10)
	enemies[5].SetVar('currentdialogue', dial)
	introinprogress = true
	fPlayer.Remove()
	fPlayer=CreateProjectile("ut-heart",0,0,"Top")
	fPlayer.sprite.SendToBottom()
	fPlayer.sprite.alpha=0
	fPlayer.sprite.color={1,0,1}
end

function EveryDial(ingo, part, dubi)
	local outgo=ingo
	if dubbing==false then
		for i=1,#ingo do
			outgo[i]=part..ingo[i]
		end
		else
		for i=1,#ingo do
			outgo[i]=part..dubi..ingo[i]
		end
	end
	return outgo
end

function EncounterStarting()
	GetFiles()
	SaveDiff=diff
	TrueBag=CreateSprite("empty","BelowUI")
	TrueBag.SendToBottom()
	TrueBag.x=320
	TrueBag.y=240
	--Player.MoveTo(0,6000,true)
	Player.MoveTo(0,0,true)
	enemies[1].Call("SetActive",false)
	enemies[2].Call("SetActive",false)
	enemies[3].Call("SetActive",false)
	enemies[4].Call("SetActive",false)
	enemies[5].Call("SetActive",true)
	Player.name = "Shifty"
	State("NONE")
	if currentspr=="1.2" then
		color="black"
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
	hppoint.y=70.5
	hpbar=CreateSprite("system/"..color.."/hpbar")
	hpbar.x=330.5
	hpbar.y=70.5
        system=CreateSprite("system/normal")
        system.x=446.5
        system.y=70
        system.SendToTop()
        system.alpha=1.0
        num1=CreateSprite("system/"..color.."/number/"..math.floor(Player.hp/10))
        num1.x=406.5
        num1.y=70.5
        num1.SendToTop()
        num1.alpha=1.0
        num2=CreateSprite("system/"..color.."/number/"..Player.hp%10)
        num2.x=421.5
        num2.y=70.5
        num2.SendToTop()
        num2.alpha=1.0
        num3=CreateSprite("system/"..color.."/number/"..math.floor(MaxHP/10))
        num3.x=479.5
        num3.y=70.5
        num3.SendToTop()
        num3.alpha=1.0
        num4=CreateSprite("system/"..color.."/number/"..MaxHP%10)
        num4.x=494.5
        num4.y=70.5
        num4.SendToTop()
        num4.alpha=1.0
	br=CreateSprite("burn/0")
	br.x=0
	br.y=0
	overworldigb=CreateProjectileAbs("overworld/igb",320,240,"Over")
	overworldigb.sprite.SendToTop()
	overworldigb.sprite.Scale(0.5,0.5)
	overworldigb.sprite.alpha=0
	curse=CreateSprite("system/"..color.."/curse","Top")
	curse.alpha=0
        curse.x=535
        curse.y=70
	cr=CreateSprite("curse/1")
	cr.color32={136,0,27}
	cr.y=70
	enemynohp=CreateSprite("system/enemynohp")
	enemyhp=CreateSprite("system/enemyhp")
	enemynohp.alpha=0
	enemyhp.alpha=0
	enemyhp.y=280
	enemynohp.y=280
	enemyhp.SetParent(enemynohp)
	enemynohp.SendToTop()
	enemyhp.SendToTop()
	for i=1,4 do
		local button=CreateSprite("empty")
		button.y=25
		if i==2 then
			button.x=238
			elseif i==3 then
			button.x=398
			elseif i==1 then
			button.x=84
			elseif i==4 then
			button.x=554
		end
		button.alpha=1
		table.insert(buttons,button)
	end
	--PlaceMercy(2)
	cr.x=385
        curse.SendToTop()
	if PlayerHasPlayedThisGame==false then
		NoGameTime=0
		else
		OverMenuTime=0
	end
end
function EnemyDialogueStarting()
end

function PlaceText(object,point)
	local x=42.5-92.5+185*point[1]
	local y=95-16.25+32.5*point[2]
	local w=8
	local h=8
	if object==Player then
		else
		w=object.width/2
		h=object.height/2
	end
	if x+w>597.5 then
		x=597.5-w
		elseif x-w<42.5 then
		x=42.5+w
	end
	if y+h>225 then
		y=225-h
		elseif y-h<95 then
		xy=95+h
	end
	if object==Player then
		object.MoveToAbs(x,y,true)
		else
		object.MoveTo(x,y)
	end
end
function DoPosition(old)
	local right=true
	local now=0
	while right==true do
		right=false
		now={math.random(3),math.random(4)}
		for i=1,#old do
			if now[1]==old[i][1] and now[2]==old[i][2] then
				right=true
			end
		end
	end
	return now
end
function MenuHell(ingo)
	for i=1,#TextObjects do
		TextObjects[i].alpha=1
		TextObjects[i].color={1,1,1}
		TextObjects[i].SetVar("ised",false)
	end
	TextObjects[7].Set("system/dialog")
	TextObjects[7].MoveTo(320,160)
	TextObjects[7].SendToBottom()
	if ingo==1 then
		local places={}
		for i=1,3 do
			places[i]=DoPosition(places)
		end
		TextObjects[1].Set(lang.."/Battle/Name")
		TextObjects[1].SetVar("used",true)
		TextObjects[1].color={1,1,1}
		PlaceText(TextObjects[1],places[1])
		TextObjects[2].Set(lang.."/Battle/Back")
		TextObjects[2].SetVar("used",true)
		TextObjects[2].color={1,1,1}
		PlaceText(TextObjects[2],places[2])
		PlaceText(Player,places[3])
		elseif ingo==2 then
		local places={}
		for i=1,6 do
			places[i]=DoPosition(places)
		end
		TextObjects[1].Set(lang.."/Battle/Name")
		TextObjects[1].SetVar("used",true)
		TextObjects[1].color={1,1,1}
		PlaceText(TextObjects[1],places[1])
		TextObjects[2].Set(lang.."/Battle/Back")
		TextObjects[2].SetVar("used",true)
		TextObjects[2].color={1,1,1}
		PlaceText(TextObjects[2],places[2])
		PlaceText(Player,places[3])
		TextObjects[3].Set(lang.."/Battle/Check")
		TextObjects[3].alpha=0
		TextObjects[4].Set(lang.."/Battle/Pray")
		TextObjects[4].alpha=0
		TextObjects[5].Set(lang.."/Battle/Back")
		TextObjects[5].alpha=0
		PlaceText(TextObjects[3],places[4])
		PlaceText(TextObjects[4],places[5])
		PlaceText(TextObjects[5],places[6])

		elseif ingo==3 then
		if itemamount==0 then
			State("ACTIONSELECT")
			MenuBullets=false
			else
			MenuPage=1
			local places={}
			for i=1,7 do
				places[i]=DoPosition(places)
			end
			for i=1,4 do
				local save1=enemies[4].GetVar("save1")
				if itemamount<i then
					TextObjects[i].Set("empty")
					else
					TextObjects[i].Set(lang.."/Battle/"..save1[i])
					TextObjects[i].SetVar("used",true)
					TextObjects[i].SetVar("item",save1[i])
				end
				if itemamount>4 then
					TextObjects[5].Set(lang.."/Battle/1")
					TextObjects[5].SetVar("used",true)
				end
				TextObjects[6].Set(lang.."/Battle/Back")
				TextObjects[6].SetVar("used",true)	
				for i=1,6 do
					PlaceText(TextObjects[i],places[i])
				end
				PlaceText(Player,places[7])
			end
		end
		elseif ingo==4 then

		local places={}
		for i=1,3 do
			places[i]=DoPosition(places)
		end
		TextObjects[1].Set(lang.."/Battle/Spare")
		TextObjects[2].Set(lang.."/Battle/Back")
		TextObjects[1].SetVar("used",true)
		TextObjects[2].SetVar("used",true)
		for i=1,2 do
			PlaceText(TextObjects[i],places[i])
		end
		PlaceText(Player,places[3])
	end
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
			buttons[i].Set(lang.."/Buttons/"..currentspr.."/"..buttonsname[i].."1")
			buttons[i].alpha=1
			else
			buttons[i].Set(lang.."/Buttons/"..currentspr.."/"..buttonsname[i].."0")
			buttons[i].alpha=0.5
		end
	end
	lastbutton=point
end

function EnteringState(newstate, oldstate)
	statement=newstate
	if newstate=="ENEMYDIALOGUE" then
		RedoBut(0)
		arenasize = {155, 130}
		else
		IsTalk=false
	end
	if oldstate=="ACTIONSELECT" and CharaIsRaging==true then
		if MenuBullets==true then
			MenuBullets=false
			else
			State("NONE")
			MenuBullets=true
			MenuHell(lastbutton)
			Player.MoveTo(0,0,true)
		end
	end
	if newstate=="ACTIONSELECT" and CharaIsRaging==true and ButtonsTime==-1 then
		ButtonsTime=30
	end
	if newstate=="ENEMYDIALOGUE" and itemed==true then
		State("ACTIONSELECT")
		itemed=false
	end
	if newstate=="ENEMYDIALOGUE" and killed==true then
		State("NONE")
	end
	if newstate=="ATTACKING" then
		State("NONE")
		fighting=true
		if curmusic=="spare" then
			charatorso.Set(currentspr.."/chara/Chara_body")
			trs_sp=currentspr.."/chara/Chara_body"
			SetGlobal("facial_expression",45)
			standnew=2
		end
	end
	if newstate=="ENEMYDIALOGUE" then
		enemies[1].Call("Bubble")
	end
	if useitem==true and newstate=="ENEMYDIALOGUE" then
		enemies[4].Call("SetActive",false)
		enemies[1].Call("SetActive",true)
		useitem=false
	end
	if newstate =="MERCYMENU" and GetGlobal("charaisdead")==0 and systemfight==false and phase!=1.5 then
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
	if newstate=="ACTIONSELECT" and oldstate=="DEFENDING" and FightGoes==true and systemfight==false then
		nextwaves={"heal/"..phase.."/"..math.random(2)}
	end
	if not GetGlobal("curse") then
		elseif newstate=="ACTIONSELECT" and oldstate=="DEFENDING" and GetGlobal("charaisdead")==0 and GetGlobal("Playerisdead")==false and GetGlobal("curse")<Player.hp and diff==1 then
		Player.Heal(10)
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
				else sleep=-1
				nosleep=true
				Audio.PlaySound("reflect")
			end
			elseif GetGlobal("button")==2 then
			State("ACTIONSELECT")
		end
	end

	if newstate=="ACTIONSELECT" and (systemfight==true or GetGlobal("curse",true)) then
		SetGlobal("judge",true)
		if systemfight then
			State("NONE")
		end
	end
	if GetGlobal("charaisdead") == 8 and wons==0 then
		encountertext=""
		ready=false
		SetGlobal("charaisdead",9)
		nextwaves = {"nothing"}
		if lang=="rus" then
			enemies[1].SetVar("currentdialogue", {"[func:NoMercy1]Да,[w:3] именно так[w:3].[w:4].[w:4].[w:4]","[func:head]У меня был запасной \nплан.[w:6]","[func:NoMercy1]Я знала,[w:3] что есть \nшанс,[w:3] [func:Think]что ты \nсможешь выжить.[w:6]","[func:NoMercy1]Ведь ты и более \nстрашные атаки \nпережил,[w:3] [func:head]не так ли?","Поэтому[w:3].[w:4].[w:4].[w:4] [func:NoMercy1]Вот он.[w:6] \nМой запасной план.[w:6]","Я не[w:3].[w:4].[w:4].[w:4] Дам тебе \nатаковать меня.[w:6]","И тогда[w:3].[w:4].[w:4].[w:4] Мы умрем \nвдвоем.[w:6]","И этот чертов цикл \nсхлопнется[w:3].[w:4].[w:4].[w:4] [func:Final_7]\nЕсли я не могу ни \nспасти,[w:3] ни прервать \nего,[w:3] то пусть он \nсгорит в Аду.[w:6]","А теперь[w:3].[w:4].[w:4].[w:4] [func:head]прощай[w:3].[w:4].[w:4].[w:4]","[func:sleepy][next] "})
			else
			enemies[1].SetVar("currentdialogue", {"[func:NoMercy1]Evet,[w:3] aynen[w:3].[w:4].[w:4].[w:4]","[func:head]Bir B planım vardı.[w:6]","[func:NoMercy1]Bundan hayatta \nkalmak için küçük [func:Think]bir şansın \nvardı.[w:6]","[func:NoMercy1]Daha kötü şeylerde \nhayatta kaldın,[w:3] [func:head]\ndeğil mi?","Ve[w:3].[w:4].[w:4].[w:4] [func:NoMercy1]işte \nbu.[w:6] B planım.[w:6]","I[w:3].[w:4].[w:4].[w:4] Bana saldırmana \nizin vermeyeceğim.[w:6]","Ve[w:3].[w:4].[w:4].[w:4] ikimiz de \nöleceğiz.[w:6]","[func:Final_7]Ve bu kısır \ndöngü bitecek.[w:6] \nEğer burayı sona edecek yada \nkurtaramayacaksam,[w:3] Bunu cehennemde \nyanmaya tercih ederim.[w:6]","Ve şimdi[w:3].[w:4].[w:4].[w:4] [func:head]Görüşürüz.[w:6] \nKendine iyi bak[w:3].[w:4].[w:4].[w:4]","[func:sleepy][next] "})
		end
		State("ENEMYDIALOGUE")
	end
	if cursedwater==true then
		enemies[4].Call("CursedWater")
		cursedwater=false
	end
	if newstate=="DEFENDING" and phone!=false then
		phone.Remove()
		phone=false
	end
	if newstate=="DEFENDING" and quiche==true then
		quichehp=Player.hp
	end
end


function RandomText()
	local i=math.random(#herecomments)
	local output=herecomments[i]
	output="[noskip]"..herecomments[i]..""
	return output
end

function SetItems(ingo)
	for t=1,4 do
		if #ingo<t then
			TextObjects[t].alpha=0
			TextObjects[t].SetVar("used",false)
			else
			TextObjects[t].Set(lang.."/Battle/"..ingo[t])
			TextObjects[t].SetVar("item",ingo[t])
			TextObjects[t].alpha=1
			TextObjects[t].SetVar("used",true)
			TextObjects[t].color={1,1,1}
		end
	end
end

function DefenseEnding() --This built-in function fires after the defense round ends.
	encountertext=comm
	if LostMercy==5 and Pellets==false then
		TryThis()
	end
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
		elseif GetGlobal("charaisdead")>0 and wons==0 then
		encountertext="[starcolor:000000][novoice]"
		elseif GetGlobal("curse")==Player.hp and systemfight==false then
		if lang=="rus" then
			encountertext="[color:8040ff]"..cursetext[1]
			else
			encountertext="[color:8040ff]"..cursetext[2]
		end
		elseif GetGlobal("nocomment")==true then
		encountertext="[novoice]"
		SetGlobal("nocomment",false)
		elseif quiche==true  and GetGlobal("charaisdead")==0 then
		Player.Heal(math.floor((quichehp-Player.hp)/2))
		quiche=false
	end
	if Possessed==true then
		Player.sprite.color={0.5,0.25,1}
		else
		Player.sprite.color={1,0,1}
	end
	Player.sprite.alpha=1
	Player.sprite.rotation=0
	eated=false
	ghostresistance=false
	movefast=false
	curseresistance=false
	burnresistance=false
	movefast=false
	damages={}
	--encountertext="[color:8040ff][noskip]Прошу,[w:6] [waitall:2][func:Shake]ХВАТИТ!"
end

function SIX(number)
	if number<0 then
		number=0
		elseif number>255 then
		number=255
	end	
	local part1=""
	local part2=""
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
		if NewAudio.Exists(AllMusics[i]) then
			NewAudio.Stop(AllMusics[i])
		end
	end
	lowmusic=false
	if ingo=="none" then
		else
		NewAudio.Play(ingo)
		NewAudio.SetPitch(ingo,1)
		NewAudio.SetVolume(ingo,1)
		NewAudio.SetPlayTime(ingo,0)
		if dubbing==true then
			NewAudio.SetVolume(ingo,0.25)
		end
		if ingo=="menu" then
			NewAudio.SetVolume(ingo,1)
		end
		NewAudio.SetVolume(ingo,1)
		curmusic=ingo
	end
	QuietMusic=false
	QuietMusicTime=0
	SlowingDown=false
	SlowingDownTime=0
end

function DoMenuKnifes(ingo,ingo2,ingo3)
	if ingo==1 then
		local knife=CreateProjectile("KnifeDown",-340,33)
		knife.SetVar("x",3)
		knife.SetVar("y",0)
		knife.SetVar("type",1)
		table.insert(TrueKnifes,knife)
		knife=CreateProjectile("KnifeUp",340,-33)
		knife.SetVar("x",-3)
		knife.SetVar("type",1)
		knife.SetVar("y",0)
		table.insert(TrueKnifes,knife)
		elseif ingo==2 then
		if ingo2==0 then
			local knife=CreateProjectile("KnifeLeft",340,0)
			knife.SetVar("x",-2)
			knife.SetVar("y",0)
			knife.SetVar("type",1)
			table.insert(TrueKnifes,knife)
			local knife=CreateProjectile("KnifeLeft",-340,0)
			knife.SetVar("x",2)
			knife.SetVar("y",0)
			knife.sprite.rotation=180
			knife.SetVar("type",1)
			table.insert(TrueKnifes,knife)
			else
			local knife=CreateProjectile("KnifeRight",-340*ingo2,33*ingo2)
			knife.SetVar("x",2*ingo2)
			knife.sprite.rotation=math.random(360)
			knife.SetVar("rotate",2)
			knife.SetVar("type",2)
			table.insert(TrueKnifes,knife)
		end
		elseif ingo==3 then
		local x=345
		if not ingo3 then
			else x=ingo3
		end
		local knife=CreateProjectile("KnifeUp",-x,33*ingo2)
		knife.SetVar("x",1)
		knife.SetVar("y",0)
		knife.SetVar("type",1)
		knife.sprite.rotation=-90-90*ingo2
		table.insert(TrueKnifes,knife)
		knife=CreateProjectile("KnifeUp",x,33*ingo2)
		knife.sprite.Scale(-1,1)
		knife.SetVar("x",-1)
		knife.SetVar("type",1)
		knife.SetVar("y",0)
		knife.sprite.rotation=-90-90*ingo2
		table.insert(TrueKnifes,knife)
		elseif ingo==4 then
		local x=345
		if not ingo3 then
			else x=ingo3
		end
		local knife=CreateProjectile("KnifeUp Warning",-x,33*ingo2)
		knife.sprite.color={1,0,0}
		table.insert(Warnings,knife)
		knife=CreateProjectile("KnifeUp Warning",x,33*ingo2)
		knife.sprite.color={1,0,0}
		table.insert(Warnings,knife)
		elseif ingo==5 then
		for i=1,4 do
			local angle=i*90+ingo2*45
			local x=180*math.cos(angle*math.pi/180)
			local y=180*math.sin(angle*math.pi/180)
			local knife=CreateProjectile("KnifeLeft",Player.x+x,Player.y+y)
			local speedx=-x/30
			local speedy=-y/30
			knife.sprite.alpha=0
			knife.SetVar("time",0)
			knife.SetVar("x",speedx)
			knife.SetVar("y",speedy)
			knife.SetVar("type",3)
			knife.sprite.rotation=angle+180
			table.insert(TrueKnifes,knife)
		end
	end
end
BulletsTime=0
ButtonKnifes={}

function DoButtonKnifes(ingo)--87 240 400 555
	local x=0
	if ingo==1 then
		x=87
		elseif ingo==2 then
		x=240
		elseif ingo==3 then
		x=400
		elseif ingo==4 then
		x=555
	end
	knife1=CreateProjectileAbs("KnifeUp",x-63,-32)
	knife2=CreateProjectileAbs("KnifeUp",x+63,-32)
	knife2.sprite.Scale(-1,1)
	knife1.SetVar("time",0)
	knife1.SetVar("px",x)
	knife1.SetVar("side",-1)
	knife1.sprite.alpha=0
	knife2.SetVar("time",0)
	knife2.SetVar("px",x)
	knife2.SetVar("side",1)
	knife2.sprite.alpha=0
	table.insert(ButtonKnifes,knife1)
	table.insert(ButtonKnifes,knife2)
end

function CurseTime(ingo)
	local outgo=13*math.sin((cursetime-30)*math.pi/60)
	if outgo<0 then
		cursetime=cursetime+0.5*math.sqrt(1-math.cos(-outgo/13*math.pi))
		outgo=outgo*0.75
	end
	cursetime=cursetime+ingo
	return outgo
end
function Update()
if ToHappyTitres>0 then
	ToHappyTitres=ToHappyTitres+1
	local t=ToHappyTitres
	if t<60 then
		elseif t<150 then
		COVER.sprite.alpha=math.sin((t-60)*math.pi/180)
		elseif t==210 then 
		ToHappyTitres=0
		if wons==1 then
			COVER.Remove()
		end
		State("NONE")
		Titr2.timer=1
		Titr2.phase=1
		SetMusic("CaP")
	end
end
		
if phase15slowmusic==false or phase15slowmusic==true then
	elseif phase15slowmusic<300 then
	phase15slowmusic=phase15slowmusic+1
	local t=phase15slowmusic
	NewAudio.SetPitch(curmusic,0.6+0.4*math.cos(t*math.pi/300))
	NewAudio.SetVolume(curmusic,0.5+0.5*math.cos(t*math.pi/300))
	if t==300 then
		phase15slowmusic=false
		SetMusic("none")
	end
end
if Pellets==true then
	for i=1,#PELLETS do
		local p=PELLETS[i]
		if p.GetVar("firsttime")>0 then
			p.SetVar("firsttime",p.GetVar("firsttime")-1)
			else
			local t=p.GetVar("time")+1
			p.SetVar("time",t)
			local s=p.GetVar("side")
			if t<3200 then
				local rt=p.GetVar("rt")
				local sin=math.sin((t+rt)*math.pi/180)*0.75
				local cos=math.cos((t+rt)*math.pi/180)*0.75
				local x=sin
				local y=-cos*cos
				local point={320+320*s,480}
				local dx=point[1]-p.x
				local dy=point[2]-p.y
				local dist=math.sqrt(dx*dx/0.75/0.75+dy*dy)
				local extra=0
				if dist<240 then
					extra=0
					elseif dist<320 then
					extra=math.sin((dist-240)*math.pi/160)
					else
					extra=1
				end
				if p.GetVar("Bang")==true then
					p.SetVar("rt",rt+1)
					local r=4+4*math.cos(rt*math.pi/180)
					if rt>90 then
						r=4
					end
					p.Move(r*s,-r/5)
					p.rotation=30
					else
					p.rotation=10+20*sin*s
					p.Move(x+extra*s*0.5,y)
				end
				elseif DoesPellets==true then
				if i==1 then
					Audio.PlaySound("ping")
				end
				p.SetVar("time",0)
				p.SetVar("rt",math.random(180))
				local x=30+math.random(241)
				local y=500
				p.MoveTo(x*s+320,y)
				elseif t==6600 and i==#PELLETS then
				for n=1,#PELLETS do
					PELLETS[n].Remove()
				end
				PELLETS={}
				Pellets=false
			end
		end
	end
end
if ToHappyEnd>0 then
	local t=ToHappyEnd
	if t>91 and t<401 then
		NewAudio.SetVolume("reunion",math.sin((t-90)*math.pi/620))
	end
	if t==1 then
		COVER=CreateProjectileAbs("system/sneaky",320,240,"Top")
		COVER.sprite.alpha=0
		elseif t<91 then
		COVER.sprite.alpha=math.sin(t*math.pi/180)
		Player.sprite.alpha=1-COVER.sprite.alpha
		elseif t==91 then
		SetMusic("reunion")
		NewAudio.SetVolume("reunion",0)
		elseif t==150 then
		fPlayer=CreateProjectile("ut-heart",Player.x,Player.y,"Top")
		fPlayer.sprite.color={1,0,0}
		Player.sprite.alpha=0
		fChara=CreateProjectileAbs("1.2/chara/chara_soul1",charasoul.absx,charasoul.absy,"Top")
		Audio.PlaySound("ding")
		MakeDing("ut-heart",{Player.absx,Player.absy},{1,0,0})
		MakeDing("1.2/chara/chara_soul1",{fChara.absx,fChara.absy},{1,0,0})
		elseif t>240 and t<401 then
		local New=0.5-0.5*math.cos((t-240)*math.pi/160)
		local Old=1-New
		fPlayer.MoveToAbs(Player.absx*Old+280*New,Player.absy*Old+320*New)
		fChara.MoveToAbs(charasoul.absx*Old+360*New,charasoul.absy*Old+320*New)
		elseif t==520 then
		local dial={}
		globalstage="0"
		deaths=0
		WriteSavio()
		if lang=="rus" then
			dial={"Чара взяла вас за руку,[w:3] и вы пошли по коридору.","Даже за такой короткий промежуток она успела много вам рассказать.","И о её страхах,[w:3] переживанияx из-за боя,[w:3] ощущений от Искусственной Решимости.","И о страхе вас потерять.","Вы не знали,[w:3] что сказать в ответ.","На деле,[w:3] вы были ужасно смущены таким излишним вниманием к себе.","В отличие от Метты вы были замкнутыми.[w:6] И не очень уверенными в себе.","Лишнее внимание вечно вас беспокоило.","Может быть[w:3].[w:4].[w:4].[w:4] Метта был прав,[w:3] что у вас с Буги много общего[waitall:4][w:3]?..","[waitall:4][w:3]...","[func:HappyCharaMeal11][color:000000]"}
			else
			dial={"Chara elini tuttu ve ikiniz de koridordan çıktınız","Bu kısa zamanda bile sana bir çok şey anlattı","Korkuları,[w:3] yaşantısı,[w:3] Kararlılığın verdiği his.[w:6]","Ve seni kaybetme korkusu.[w:6]","Buna bir cevap veremezdin.[w:6]","Aynı zamanda,[w:3] bu ilgiye pek alışkın değildin.[w:6]","Metta hariç.[w:6] Hehe.[w:6]","İlgi her zaman seni düşündürdü.[w:6]","Belki de[waitall:4][w:3]...[waitall:1][w:3] Metta haklıydı[waitall:4][w:3]...[waitall:1][w:3]","[waitall:4][w:3]...[waitall:1][w:3]","[func:HappyCharaMeal11][color:000000]"}
		end
		for i=1,#dial do
			dial[i]="[noskip][novoice][voice:uidial]"..dial[i]
		end
		BattleDialog(dial)
		elseif t>400 then
		fPlayer.MoveToAbs(fPlayer.absx,290+30*math.cos((t-400)*math.pi/300))
		fChara.MoveToAbs(fChara.absx,fPlayer.absy)
	end
	ToHappyEnd=ToHappyEnd+1
end
if ChocolateHand!=false then
	ChocolateHand.MoveToAbs(charatorso.absx,charatorso.absy)
end
if FlashBack>0 then
	local t=FlashBack
	if t==1 then
		SCREAM=CreateProjectileAbs("system/screens/1",320,240,"Top")
		SetGlobal("facial_expression",60)
		LostHead="/lost child/lost_base"
		elseif t==3 then
		SCREAM.sprite.Set("system/screens/2")
		elseif t==5 then
		SCREAM.sprite.Set("system/screens/3")
		elseif t==6 then
		SCREAM.sprite.Set("system/screens/4")
		elseif t==8 then
		SCREAM.sprite.Set("bomb")
		SCREAM.sprite.Scale(1000,1000)
		elseif t>90 and t<180 then
		SCREAM.sprite.alpha=math.cos((t-90)*math.pi/180)
		elseif t==270 then
		if globalstage=="5" then
			if lang=="rus" then
				dial={"[func:face,yes][func:SetFaceLost,base_close][waitall:4][w:3]...","[func:SetFaceLost,base_left]Черт,[w:3] зачем я вообще \nстараюсь[waitall:4][w:3]...","[func:SetFaceLost,base_close]Особенно после того,[w:3] как \nты[waitall:4][w:3]...","[func:SetFaceLost,base]Убила меня[waitall:4][w:3]...","[func:SetFaceLost,sobbing_close]Я до сих пор чувствую,[w:3] как \nв горле булькает горячая \nкровь[waitall:4][w:3]...[waitall:1][w:3] [func:SetFaceLost,sobbing] Как немеет тело[waitall:4][w:3]...","[func:SetFaceLost,sobbing_thinking]Зачем я вообще стараюсь[waitall:4][w:3]...[waitall:1][w:3]","[func:SetFaceLost,sobbing][waitall:4][w:3]...[waitall:1][w:3]Перейдем к делу.","[func:face,no][func:fightbegin][next] "}
				else
				dial={"[func:face,yes][func:SetFaceLost,base_close][waitall:4][w:3]...","[func:SetFaceLost,base_left]Lanet olsun,[w:3] neden \ndeniyorum ki[waitall:4][w:3]?...","[func:SetFaceLost,base_close]Özellikle[waitall:4][w:3]...","[func:SetFaceLost,base]öldükten sonra[waitall:4][w:3]...","[func:SetFaceLost,sobbing_close]hala boynumda kanın nasıl \nkaynadığını hissediyorum[waitall:4][w:3]...[waitall:1][w:3]","[func:SetFaceLost,sobbing]Nasıl vücudumu \nkontrol edemediğimi[waitall:4][w:3]...","[func:SetFaceLost,sobbing_thinking]Emeklerimin \nkarşılığını alacak mıyım?..","[func:SetFaceLost,sobbing][waitall:4][w:3]...[waitall:1][w:3]Sadede \ngelelim.","[func:face,no][func:fightbegin][next] "}
			end
			WriteSavio()
			wons=1
			else
			wons=1
			if currentspr=="1.2" then
				local torso=charatorso
				torso.Set(currentspr.."/chara/Chara_body0")
				trs_sp=currentspr.."/chara/Chara_body"
				local legs=charalegs
				legs.Set(currentspr.."/chara/Chara_legs")
				lgs_sp=currentspr.."/Chara_legs"
				legs.x=8
				local head=charahead
				head.x=-7
			end
			FightGoes=false
			deadlyhit=true
			nextwaves={"nothing"}
			enemies[1].SetVar("dodge",false)
			enemies[1].SetVar("block",false)
			evadelevel=6
			standnew=1
			standnow=1
			standtime=0
			if lang=="rus" then
				dial={"[func:face,yes][func:SetFaceLost,shocked]Я[waitall:4][w:3]...[waitall:1][w:3] Ты хочешь сказать,[w:3] \nчто однажды я[waitall:4][w:3]...[waitall:1][w:3]","[func:SetFaceLost,shocked2]Такого[waitall:4][w:3]...[waitall:1][w:3] не может \nбыть[waitall:4][w:3]...[waitall:1][w:3]","[func:SetFaceLost,shocked]Но если я действительно \nпроиграла[waitall:4][w:3]...[waitall:1][w:3]","[func:SetFaceLost,base_close][waitall:4][w:3]...[waitall:1][w:3]","[func:SetFaceLost,base]Тогда в чем вообще \nсмысл?","[func:SetFaceLost,base_left]Я здесь,[w:3] чтобы остановить \nтебя со своими новыми \nсилами[waitall:4][w:3]...","Hо если ты уже убил меня[waitall:4][w:3]...[waitall:1][w:3]","[func:SetFaceLost,sobbing_close]То зачем[waitall:4][w:3]...[waitall:1][w:3] [func:SetFaceLost,sobbing_thinking] Зачем \nмне вообще стараться?","[func:fightbegin][func:face,no][next] "}
				else
				dial={"[func:face,yes][func:SetFaceLost,shocked]Ben[waitall:4][w:3]...[waitall:1][w:3] Çoktan[waitall:4][w:3]...[waitall:1][w:3]","[func:SetFaceLost,shocked2]Bu olmamalıydı[waitall:4][w:3]...[waitall:1][w:3]","[func:SetFaceLost,shocked]Gerçekten \nöldüysem[waitall:4][w:3]...[waitall:1][w:3]","[func:SetFaceLost,base_close][waitall:4][w:3]...[waitall:1][w:3]","[func:SetFaceLost,base]Denemenin anlamı \nyok, değil mi?","[func:SetFaceLost,base_left]Seni yeni güçlerim ile \ndurdurmalıydım,[w:3] fakat beni \nçoktan öldürdüysen[waitall:4][w:3]...[waitall:1][w:3]","[func:SetFaceLost,sobbing_close]Neden[waitall:4][w:3]...[waitall:1][w:3] [func:SetFaceLost,sobbing_thinking]\nNeden umrumda olmalı?","[func:fightbegin][func:face,no][next] "}
			end
			
		end
		charatorso.Set("1.2/chara/Chara_body0")
		SetGlobal("facial_expression",61)
		LostHead="/lost child/lost_base_close"
		dial=EveryDial(dial,"[effect:twitch,1][font:overworld][color:ffffff][noskip]","")
		enemies[5].SetVar("currentdialogue",dial)
		SCREAM.Remove()
		FlashBack=-1
		State("ENEMYDIALOGUE")
	end
	FlashBack=FlashBack+1
end
if PlayerGotsKilled>0 then
	local t=PlayerGotsKilled
	if t==1 then
		fPlayer=CreateProjectileAbs("ut-heart",320,160,"Top")
		Slash=CreateProjectileAbs("chainsaw/0",320,160,"Top")
		fPlayer.sprite.color={1,0,1}
		SetMusic("none")
		Floor.Remove()
		Audio.PlaySound("slice")
		elseif t%15==1 and t<91 then
		Slash.sprite.Set("chainsaw/"..(t-1)/15)
		elseif t==106 then
		Audio.PlaySound("hurtsound")
		globalstage="1"
		WriteSavio()
		Mett.Remove()
		mtt.Remove()
		Player.MoveToAbs(320,160,true)
		Slash.Remove()
		elseif t==107 then
		GotAchivement(3)
		elseif t==120 then
		for i=1,6 do
			local piece = CreateProjectile("system/piece1",fPlayer.x,fPlayer.y,"Over")
			piece.SetVar("x",math.random(27)/3-5)
			piece.SetVar("y",(math.random(57)-9)/8)
			piece.SetVar("rot",math.random(20))
			table.insert(pieces,piece)
			piece.SetVar("rotation",math.random(20))
			piece.sprite.rotation=math.random(360)
			piece.sprite.color=fPlayer.sprite.color
		end
		fPlayer.Remove()
		SetMusic("none")
		elseif t==270 then
		State("DONE")
	end
	if Achiventor.Time==0 then
		PlayerGotsKilled=PlayerGotsKilled+1
	end
end
if FallingKnife.timer>0 then
	FallingKnife.timer=FallingKnife.timer+1
	local t=FallingKnife.timer
	if t==2 and FallingKnife.phase==0 then
		FallingKnife.Knife.alpha=1
		FallingKnife.Knife.Set("KnifeFallen1")
		FallingKnife.Knife.Scale(1.5,1.5)
		FallingKnife.Knife.MoveTo(charalegs.x+charatorso.y+28,charalegs.y+charatorso.y+17)
		FallingKnife.Knife.rotation=64.5
		FallingKnife.y=0
		FallingKnife.x=0
		FallingKnife.rotchange=-0.15
		FallingKnife.rot=0
		FallingKnife.phase=1
	end
	if FallingKnife.phase==1 then
		FallingKnife.rot=FallingKnife.rot+FallingKnife.rotchange
		FallingKnife.y=FallingKnife.y-0.15
		FallingKnife.Knife.Move(FallingKnife.x,FallingKnife.y)
		FallingKnife.Knife.rotation=FallingKnife.Knife.rotation+FallingKnife.rot
		local rot=FallingKnife.Knife.rotation-8
		local w=FallingKnife.Knife.width*0.75
		local h=FallingKnife.Knife.height*0.75
		if 240+math.abs(w*math.sin(rot*math.pi/180))+h*math.cos(rot*math.pi/180)>FallingKnife.Knife.absy then
			FallingKnife.rotchange=0
			local x=FallingKnife.x
			local y=FallingKnife.y*0.75
			local rota=FallingKnife.rota
			local speed=math.sqrt(x*x+y*y)
			if speed>0.1 then
				x=-speed*math.sin(rot*math.pi/180)
				y=math.abs(speed*math.cos(rot*math.pi/180))
				rota=x*2
				FallingKnife.x=x
				FallingKnife.y=y
				FallingKnife.rot=rota
				else
				FallingKnife.Knife.Set("KnifeFallen1")
				FallingKnife.phase=2
				FallingKnife.timer=1
				FallingKnife.Knife.MoveTo(FallingKnife.Knife.x,240+math.abs(w*math.sin(rot*math.pi/180))+h*math.cos(rot*math.pi/180))
			end
		end
		elseif FallingKnife.phase==2 then
		if t==90 then
			Audio.PlaySound("bonedust")
			elseif t>90 and t<151 then
			FallingKnife.Knife.alpha=math.sin((t-30)*math.pi/120)
			elseif t==151 then
			FallingKnife.phase=0
			FallingKnife.timer=-1
		end
	end
end		
if MettaLost==false then
	else
	MettaLost=MettaLost+1
	local t=MettaLost
	if t==1 then
		COVER=CreateProjectileAbs("overworld/beforebattle",320,240,"BelowBullet")
		COVER.sprite.alpha=0
		SetMusic("theme")
		NewAudio.SetVolume("theme",0)
	end
	if t<120 then
		COVER.sprite.alpha=math.sin(t*math.pi/240)
		NewAudio.SetVolume("theme",COVER.sprite.alpha)
		if t%30<25 then
			if NewAudio.isStopped("glitch")==true then
				NewAudio.Play("glitch")
			end
			MettaHead.Scale(1,1)
			MettaHead.Set("MettaHead")
			MettaHead.SendToTop()
			MettaHead.MoveToAbs(320-31+math.random(61),240-31+math.random(61))
			MettaHead.alpha=math.sin(math.random(6)*math.pi/16)
			else
			if NewAudio.isStopped("glitch")==false then
				NewAudio.Stop("glitch")
			end
			MettaHead.Scale(5,5)
			MettaHead.Set("MTT/faces/Afraid")
			MettaHead.MoveTo(320,240)
			MettaHead.alpha=COVER.sprite.alpha
			MettaHead.SendToBottom()
		end
	end
	if t==240 then
		local text
		local dial={}
		if lang=="rus" then
			dial={"[func:LostMettaFace,Bored]С каких пор ты решаешь,[w:3] как играть мою пьесу?","[func:LostMettaFace,Thought]Ты серьезно думал,[w:3] что отклониться от сценария была хорошая идея?","[func:LostMettaFace,Afraid]Ты надеялся,[w:3] что я пощажу тебя и твою жалкую подружку?","[func:LostMettaFace,saw][func:LostMettaAngry][waitall:2]ДА ЧЕРТА С ДВА,[w:3] \rА К Т Ё Р ","[func:LostMettaCalm][func:LostMettaFace,punishment]Ты бы знал,[w:3] как я ненавижу эти ваши нереалистичные разговоры о любви и дружбе[waitall:4][w:3]...[waitall:1][w:3]","[func:LostMettaFace,Afraid]Мол,[w:3] дружба и любовь спасут мир[waitall:4][w:3]...","[func:LostMettaFace,Dispice]Отвратительно.[w:6] [func:LostMettaFace,Afraid]Ты ничему не учишься.[w:6] \n[func:LostMettaFace,punishment]Никогда и не пытался.","Ты как и Блук - никчемный трус.","Стоило сценарию пойти не по твоим правилам и ты возомнил себя Богом?","[func:LostMettaFace,Afraid]Решил,[w:3] что я дам тебе хозяйничать этим телом,[w:3] будто оно тебе принадлежит?","Ты забыл кое-что[waitall:4][w:3]...[waitall:1][w:3]","[waitall:2][func:LostMettaFace,screamer][func:LostMettaAngry]ТЫ [w:4]САМ [w:4]ПРОДАЛ[w:4] СВОЕ [w:4]ТЕЛО [w:4]МНЕ","[func:LostMettaCalm][func:LostMettaFace,Afraid]А теперь[waitall:4][w:3]...[waitall:1][w:3]","[func:LostMettaFace,punishment]Ты нарушил условия контракта.[w:6] \n[func:LostMettaFace,Afraid]А знаешь,[w:3] что делают с актерами,[w:3] не следующими контракту?","[func:LostMettaFace,saw]Их [waitall:2][func:LostMettaAngry]у в о л ь н я ю т","[func:LostMettaCalm][func:LostMettaFace,Afraid][waitall:4][w:3]...[waitall:1][w:3]Мне было приятно проводить с тобой время.","Но теперь я понимаю,[w:3] что это тело достойно большей звезды.","[func:LostMettaFace,Thought]Это тело достойно моего дебюта.","[func:LostMettaFace,Afraid]А ты?","[func:LostMettaFace,Dispice]А ты будешь гнить здесь[waitall:4][w:3]...[waitall:1][w:3]","Долго[waitall:4][w:3]...[waitall:1][w:3] \n[func:LostMettaFace,saw]Бесконечно [waitall:2]д о л г о[waitall:4][w:3]...[waitall:1][w:3][w:30][func:Quiting][w:1800]"}
			else
			dial={"[func:LostMettaFace,Bored]Senaryomu nasıl oynayacağına sen mi karar veriyorsun?[w:6]","[func:LostMettaFace,Thought]Cidden karakter dışı oynamak iyi bir fikir mi?[w:6]","[func:LostMettaFace,Afraid]Cidden kız arkadaşına nazik davranacağımı mı sandın?[w:6]","[func:LostMettaFace,saw][func:LostMettaAngry][waitall:4]LANET OLSUN,[w:3] A K T Ö R","[func:LostMettaCalm][func:LostMettaFace,punishment]Sevgi ve dostluk hakkındaki konuşlmalarından nefret ediyorum[waitall:4][w:3]...[waitall:1][w:3]","[func:LostMettaFace,Afraid]Sanki ikisi dünyayı kurtaracak.","[func:LostMettaFace,Dispice]İğrenç.[w:6][func:LostMettaFace,Afraid]\nBir şey öğrenmemişsin.[w:6][func:LostMettaFace,punishment]\nDidn't even try to.[w:6]","Blloky gibisin, acınası.[w:6]","Kendini bir tanrı gibi mi hissettin?[w:6]","[func:LostMettaFace,Afraid]Bu vücudu seninmiş gibi kullancağını mı?[w:6]","Sanırım bir şey unuttun[waitall:4][w:3]...[waitall:1][w:3]","[waitall:4][func:LostMettaFace,screamer][func:LostMettaAngry]BU[w:4] VÜCUDU[w:4] UZUN[w:4] ZAMAN[w:4] ÖNCE [w:4]BANA [w:4]VERDİN [w:4]","[func:LostMettaCalm][func:LostMettaFace,Afraid]Ve şimdi[waitall:4][w:3]...[waitall:1][w:3]","[func:LostMettaFace,punishment]Sözleşmen sona erdi.[w:6] Ve sözleşmesi biten aktörlere nolur?[w:6]","[func:LostMettaFace,saw]Kovulurlar [waitall:4][func:LostMettaAngry]","[func:LostMettaCalm][func:LostMettaFace,Afraid][waitall:4][w:3]...[waitall:1][w:3]Seninle vakit geçirmek güzeldi.[w:6]","Fakat bu beden daha iyi bir yıldız hakediyor.[w:6]","[func:LostMettaFace,Thought]Bu vücut beni hakediyor.[w:6]","[func:LostMettaFace,Afraid]Ve sen?[w:6]","[func:LostMettaFace,Dispice]Burda çürüyeceksin[waitall:4][w:3]...[waitall:1][w:3]","Uzun bir zaman[waitall:4][w:3]...[waitall:1][w:3] [func:LostMettaFace,saw]Sonsuza [waitall:4]k a d a r[waitall:4][w:3]...[waitall:1][w:3][w:90][func:Quiting][w:1800]"}
		end
		globalstage="7"
		WriteSavio()
		for i=1,#dial do
			dial[i]="[noskip][color:8040ff][font:mtt]"..dial[i]
		end
		HideOut=CreateProjectileAbs("system/globalstagecover",320,130,"Top")
		HideOut.sprite.Scale(2,2)
		text=CreateText(dial,{80,160},480,"Top",-1)
		text.HideBubble()
		text.progressmode="manual"
		MettaScreams={}
		MettaScreams.quick=1
		MettaScreams.Face="Afraid"
		MettaScreams.Long=math.random(20)+10
		MettaLost=600-MettaScreams.Long
		t=MettaLost
	end
	if t>240 then
		if t+MettaScreams.Long>600 then
			if NewAudio.isStopped("glitch")==true then
				NewAudio.Play("glitch")
			end
			MettaHead.Scale(1,1)
			MettaHead.Set("MettaHead")
			MettaHead.MoveToAbs(320-31+math.random(61),240-31+math.random(61))
			MettaHead.alpha=math.sin(math.random(6)*math.pi/16)
			MettaHead.SendToTop()
			else
			if NewAudio.isStopped("glitch")==false then
				NewAudio.Stop("glitch")
			end
			MettaHead.alpha=1
			MettaHead.Scale(5,5)
			MettaHead.Set("MTT/faces/"..MettaScreams.Face)
			MettaHead.MoveTo(320,240)
			MettaHead.SendToBottom()
		end
		if t==600 then
			MettaScreams.Long=math.random(20)+10
			MettaLost=600-MettaScreams.Long-math.floor((60+math.random(math.random(300)))*MettaScreams.quick)
			t=MettaLost
		end
	end
end		
if PlaysIntro==true and NewAudio.isStopped("SAVE1") then
	SetMusic("SAVE2")
	PlaysIntro=false
end
if Achiventor.Time>0 then
	local t=Achiventor.Time
	if t<46 then
		Achiventor.spr.MoveTo(470,530-120*math.sin(t*math.pi/90))
		elseif t>225 then
		Achiventor.spr.MoveTo(470,530-120*math.sin((t-180)*math.pi/90))
	end
	Achiventor.txt.MoveTo(Achiventor.txt.x,Achiventor.spr.y+18)
	Achiventor.ico.MoveTo(Achiventor.spr.x+108,Achiventor.spr.y)
	--DEBUG(Achiventor.spr.y)
	if t==1 then
		IsTalk=true
		Achiventor.ico.Set("system/Achivements/"..Achiventor.outgos[1])
		--Audio.PlaySound("achivement")
		Audio.PlaySound("Achi")
		elseif t==270 then
		IsTalk=false
		local outgos={}
		for i=1,#Achiventor.outgos-1 do
			outgos[i]=Achiventor.outgos[i+1]
		end
		Achiventor.spr.MoveTo(5000,5000)
		Achiventor.outgos=outgos
		if #outgos>0 then
			Achiventor.Time=0
			--Achiventor.spr.Move(0,10000)
			--Achiventor.txt.MoveTo(0,10000)
			--Achiventor.ico.Move(0,10000)
			else
			Achiventor.Time=-1
		end
	end
	Achiventor.Time=Achiventor.Time+1
end
if Titr2.phase>0 then
	local t=0
	local ti=0
	local s=Titr2.step
	if NewAudio.isStopped("CaP")==false then
		ti=NewAudio.GetPlayTime("CaP")
		if ti>NewAudio.GetTotalTime("CaP")-1 then
			NewAudio.Stop("CaP")
		end
	end
	t=ti*60
	if Titr2.phase==1 then
		if s==0 and t>498 then
			Titr2.step=1
			Titr2.light=CreateProjectileAbs("titr/light1",320,240,"Top")
			Titr2.light.sprite.alpha=0
			Titr2.logo=CreateProjectileAbs("overworld/devillogo",320,240,"Over")
			Titr2.logo.sprite.alpha=0
			Titr2.logo.sprite.Scale(2,2)
			elseif s==1 then
			if t<559 then
				Titr2.logo.sprite.alpha=math.sin((t-498)*math.pi/120)
				else
				Titr2.logo.sprite.alpha=1
			end
			if t>624 then
				Titr2.step=2
				local l="By IGB Team"
				if lang=="rus" then
					l="Сделано командой IGB"
				end
				Titr2.ByIGB=CreateText("[instant][noskip][novoice][font:overworld]"..l,{430,430},480,"Over",-1)
				Titr2.ByIGB.progressmode="none"
				Titr2.ByIGB.HideBubble()
				Titr2.ByIGB.MoveTo(320-Titr2.ByIGB.GetTextWidth()/2,140)
				Titr2.ByIGB.color={1,1,1,0}
			end
			elseif s==2 then
			if t<685 then
				Titr2.ByIGB.color={1,1,1,math.sin((t-624)*math.pi/120)}
				else
				Titr2.ByIGB.color={1,1,1,1}
			end
			if t>744 then
				Titr2.step=3
			end
			elseif s==3 then
			if t<805 then
				Titr2.light.sprite.alpha=math.sin((t-744)*math.pi/120)
				else
				Titr2.light.sprite.alpha=1
			end
			if t>948 then
				Titr2.step=4
				Titr2.white=CreateProjectileAbs("overworld/cover",320,240,"Over")
				Titr2.white.sprite.alpha=0
			end
			elseif s==4 then
			if t<979 then
				Titr2.white.sprite.alpha=1-math.sin((t-918)*math.pi/60)
				else
				Titr2.white.sprite.alpha=1
			end
			if t>996 then
				Titr2.phase=2
				Titr2.step=0
				Titr2.logo.Remove()
				Titr2.ByIGB.Remove()
				Titr2.light.sprite.Set("titr/light2")
				Titr2.white.Remove()
				local l="Cast:"
				if lang=="rus" then
					l="В ролях:"
				end
				Titr2.Cast=CreateText("[instant][noskip][novoice][font:overworld]"..l,{430,403},480,"Over",-1)
				Titr2.Cast.MoveTo(320-Titr2.Cast.GetTextWidth()/2,200)
				Titr2.Cast.HideBubble()
				Titr2.Cast.progressmode="none"
				Titr2.Posters={}
				Titr2.Thanks={}
			end
		end
		elseif Titr2.phase==2 then
		if s==0 and t>1000 then
			local n="Vladimir Ignitio"
			local s="Yaratıcı, senaryo, tasarım\n(Sonunda Ignıted'a çalışabilir)"
			if lang=="rus" then
				s="Создатель, сценарий, геймдизайн\n(Теперь займётся Игнайтедом)"
			end
			table.insert(Titr2.Posters,DoPoster(1,"igni",n,s,1000))
			Titr2.step=1
			elseif s==1 and t>1250 then
			local n="Drendy"
			local s="Ortak yapımcı, programlayıcı\n(Ae)"
			if lang=="rus" then
				s="Со-создатель, программист\n(Не хочет революцию, но хочет релиз)"
			end
			table.insert(Titr2.Posters,DoPoster(-1,"drendy",n,s,1250))
			Titr2.step=2
			elseif s==2 and t>1500 then
			local n="The Crystal Horse"
			local s="Ortak Ypaımcı, programlayıcı\n(dua ediyor)"
			if lang=="rus" then
				s="Со-создатель, программист\n(Цок-цокнулся в процессе)"
			end
			table.insert(Titr2.Posters,DoPoster(1,"cognac",n,s,1500))
			Titr2.step=3
			elseif s==3 and t>2000 then
			Titr2.light.sprite.Set("titr/light1")
			Titr2.Cast.alpha=0
			Titr2.photo1=CreateProjectileAbs("titr/photo1",320,240,"Over")
			Titr2.photo1.sprite.alpha=0
			Titr2.photo2=CreateProjectileAbs("titr/photo1",320,240,"Over")
			Titr2.photo2.sprite.alpha=0
			Titr2.step=4
			elseif s==4 then
			if t>2030 and t<2120 then
				local x=0
				if t<2090 then
					x=80-80*math.sin((t-2030)*math.pi/120)
				end
				local a=math.sin((t-2030)*math.pi/180)
				Titr2.photo1.MoveToAbs(320+x,240)
				Titr2.photo2.MoveToAbs(320-x,240)
				Titr2.photo1.sprite.Scale(0.5+0.5*a,0.5+0.5*a)
				Titr2.photo2.sprite.Scale(0.5+0.5*a,0.5+0.5*a)
				Titr2.light.sprite.alpha=1-0.5*a
				Titr2.photo1.sprite.alpha=a*a
				Titr2.photo2.sprite.alpha=a*a
				elseif t>2120 then
				Titr2.light.sprite.alpha=0.5
				Titr2.photo2.Remove()
				Titr2.photo1.MoveToAbs(320,240)
				Titr2.photo1.sprite.alpha=1
				Titr2.step=5
			end
			elseif s==5 and t>2136 then
			local s="Азриель,[w:3] хватит травить людей[waitall:4][w:3]..."
			if lang=="eng" then
				s="Asriel,[w:3] insanları zehirlemeyi bırak[waitall:4][w:3]..."
			end
			Titr2.txt1=CreateText("[font:overworld][noskip]"..s,{80,440},480,"Over",-1)
			Titr2.txt1.HideBubble()
			Titr2.txt1.progressmode="none"
			Titr2.step=6
			Titr2.txt1.MoveTo(80,240+120+20+Titr2.txt1.GetTextHeight())
			elseif s==6 and t>2306 then
			local s="Чара![w:6] Не порть мой рейтинг лучшего персонажа Подземелья!"
			if lang=="eng" then
				s="Chara![w:6] Yeraltındaki en iyi reytinglerime bulaşma!"
			end
			Titr2.txt2=CreateText("[font:overworld][noskip][novoice][voice:v_asriel]"..s,{80,80},480,"Over",-1)
			Titr2.txt2.HideBubble()
			Titr2.txt2.progressmode="none"
			Titr2.step=7
			elseif s==7 and t>2810 then
			Titr2.step=8
			elseif s==8 then
			if t<2970 then
				local ti=t-2810
				local cos=math.cos(ti*math.pi/320)
				Titr2.txt1.alpha=cos
				Titr2.txt2.alpha=cos
				Titr2.photo1.sprite.alpha=cos
				elseif t<3000 then
				Titr2.photo1.sprite.alpha=0
				else
				Titr2.photo1.Remove()
				Titr2.txt1.Remove()
				Titr2.txt2.Remove()
				--Titr2.light.sprite.Set("titr/light2")
				--Titr2.light.sprite.alpha=1
				--Titr2.Cast.alpha=1
				Titr2.step=9
			end
			elseif s==9 and t>3000 then
			local h="Special thanks"
			if lang=="rus" then
				h="Особые благодарности"
			end
			Titr2.SpThanks=CreateText("[instant][noskip][font:overworld]"..h,{0,0},640,"Over",-1)
			Titr2.SpThanks.MoveTo(320-Titr2.SpThanks.GetTextWidth()/2,450)
			Titr2.SpThanks.HideBubble()
			Titr2.SpThanks.progressmode="none"
			Titr2.SpThanks.alpha=0
			Titr2.step=10
			elseif s>9 and s<19 then
			local T=Titr2.SpThanks
			if t<3030 then
				T.alpha=math.sin((t-3000)*math.pi/60)
				elseif t<3890 then
				T.alpha=1
				else
				T.alpha=math.sin((t-3770)*math.pi/240)
			end
			if s==10 and t>3030 then
				Titr2.step=11
				local l="Toby Fox"
				local n="Undertale'ı yarattığı için"
				if lang=="rus" then
					n="За создание Undertale"
				end
				table.insert(Titr2.Thanks,DoThanks(-1,l,n,380,3030))
				elseif s==11 and t>3060 then
				Titr2.step=12
				local l="Temmie Chang"
				local n="Toby Fox'a yardım ettiği için"
				if lang=="rus" then
					n="За помощь Тоби Фоксу"
				end
				table.insert(Titr2.Thanks,DoThanks(-1,l,n,280,3060))
				elseif s==12 and t>3090 then
				Titr2.step=13
				local l="VoltraTheLively"
				local n="Storyshift'i oluşturduğu için"
				if lang=="rus" then
					n="За создание Storyshift"
				end
				table.insert(Titr2.Thanks,DoThanks(-1,l,n,180,3090))
				elseif s==13 and t>3120 then
				Titr2.step=14
				local l="RhenaudTheLukark"
				local n="CYF'i yarattığı için"
				if lang=="rus" then
					n="За создание CYF"
				end
				table.insert(Titr2.Thanks,DoThanks(-1,l,n,80,3120))
				elseif s==14 and t>3290 then
				Titr2.step=15
				local l="kae"
				local n="INSANTION'u yarattığı için"
				if lang=="rus" then
					n="За создание INSANTION"
				end
				table.insert(Titr2.Thanks,DoThanks(1,l,n,380,3290))
				elseif s==15 and t>3320 then
				Titr2.step=16
				local l="keno9988i"
				local n="Megaloglamour için"
				if lang=="rus" then
					n="За создание Megaloglamour"
				end
				table.insert(Titr2.Thanks,DoThanks(1,l,n,280,3320))
				elseif s==16 and t>3350 then
				Titr2.step=17
				local l="BotanicSage"
				local n="Waters Of Megalovania için"
				if lang=="rus" then
					n="За создание Waters Of Megalovania"
				end
				table.insert(Titr2.Thanks,DoThanks(1,l,n,180,3350))
				elseif s==17 and t>3380 then
				Titr2.step=18
				local l="Nickel Dare"
				local n="CYF yerelleştirmesi için"
				if lang=="rus" then
					n="За локализацию движка"
				end
				table.insert(Titr2.Thanks,DoThanks(1,l,n,80,3380))
				elseif s==18 and t>4010 then
				Titr2.light.sprite.Set("titr/light2")
				Titr2.light.sprite.alpha=1
				Titr2.Cast.alpha=1
				Titr2.SpThanks.alpha=0
				Titr2.step=19
			end
			elseif s==19 and t>4010 then
			local n="GeorgTime"
			local s="Karakter dokuları\n(Fighting haters with eyebrows)"
			if lang=="rus" then
				s="Спрайты персонажей\n(Отбивается от хейтеров бровями)"
			end
			table.insert(Titr2.Posters,DoPoster(1,"document",n,s,4010))
			Titr2.step=20
			elseif s==20 and t>4260 then
			local n="wonderless."
			local s="Composer\nBoogie ses aktörü\n(Müzik güncellemenin olayı ne?)"
			if lang=="rus" then
				s="Композитор\nГолос Бугги\n(Чумба, ты что ебнутый обновлять треки?)"
			end
			table.insert(Titr2.Posters,DoPoster(-1,"wonder",n,s,4260))
			Titr2.step=21
			elseif s==21 and t>4510 then
			local n="Andriana Mantidfly"
			local s="Composer\n(Cinsiyeti evet)"
			if lang=="rus" then
				s="Композитор\n(Он/Она/Они-чан)"
			end
			table.insert(Titr2.Posters,DoPoster(1,"mogz",n,s,4510))
			Titr2.step=22
			elseif s==22 and t>5010 then
			Titr2.light.sprite.Set("titr/light1")
			Titr2.Cast.alpha=0
			Titr2.photo1=CreateProjectileAbs("titr/photo2",320,240,"Over")
			Titr2.photo1.sprite.alpha=0
			Titr2.photo2=CreateProjectileAbs("titr/photo2",320,240,"Over")
			Titr2.photo2.sprite.alpha=0
			Titr2.step=23
			elseif s==23 then
			if t>5010 and t<5100 then
				local x=0
				if t<5070 then
					x=80-80*math.sin((t-5010)*math.pi/120)
				end
				local a=math.sin((t-5010)*math.pi/180)
				Titr2.photo1.MoveToAbs(320+x,240)
				Titr2.photo2.MoveToAbs(320-x,240)
				Titr2.photo1.sprite.Scale(0.5+0.5*a,0.5+0.5*a)
				Titr2.photo2.sprite.Scale(0.5+0.5*a,0.5+0.5*a)
				Titr2.light.sprite.alpha=1-0.5*a
				Titr2.photo1.sprite.alpha=a*a
				Titr2.photo2.sprite.alpha=a*a
				elseif t>5100 then
				Titr2.light.sprite.alpha=0.5
				Titr2.photo2.Remove()
				Titr2.photo1.MoveToAbs(320,240)
				Titr2.photo1.sprite.alpha=1
				Titr2.step=24
			end
			elseif s==24 and t>5190 then
			local s="Т-тори[waitall:4][w:3]...[waitall:1][w:3] Простишь ли ты меня?"
			if lang=="eng" then
				s="T-Tori[waitall:4][w:3]...[waitall:1][w:3] beni affedecek misin?"
			end
			Titr2.txt1=CreateText("[font:overworld][noskip][voice:v_fluffybuns]"..s,{80,440},480,"Over",-1)
			Titr2.txt1.HideBubble()
			Titr2.txt1.progressmode="none"
			Titr2.step=25
			Titr2.txt1.MoveTo(80,240+120+20+Titr2.txt1.GetTextHeight())
			elseif s==25 and t>5400 then
			local s="Дриимурр[waitall:4][w:3]...[waitall:1][w:3] Эх[waitall:4][w:3]...[waitall:1][w:3] Какой же ты пушистый дурак[waitall:4][w:3]...[waitall:1][w:3]"
			if lang=="eng" then
				s="Dreemurr[waitall:4][w:3]...[waitall:1][w:3] Eh[waitall:4][w:3]...[waitall:1][w:3] Tam bir ahmaksın[waitall:4][w:3]...[waitall:1][w:3]"
			end
			Titr2.txt2=CreateText("[font:overworld][noskip][novoice][voice:v_toriel]"..s,{80,80},480,"Over",-1)
			Titr2.txt2.HideBubble()
			Titr2.txt2.progressmode="none"
			Titr2.step=26
			elseif s==26 then
			if t>5880 then
				if t<6000 then
					local sin=math.sin((t-5760)*math.pi/240)
					Titr2.photo1.sprite.alpha=sin
					Titr2.txt1.alpha=sin
					Titr2.txt2.alpha=sin
					else
					Titr2.photo1.Remove()
					Titr2.txt1.Remove()
					Titr2.txt2.Remove()
					Titr2.step=27
				end
			end
			elseif s>26 and s<36 then
			local T=Titr2.SpThanks
			if t<6030 then
				T.alpha=math.sin((t-6000)*math.pi/60)
				elseif t<6890 then
				T.alpha=1
				else
				T.alpha=math.sin((t-6770)*math.pi/240)
			end
			if s==27 and t>6030 then
				Titr2.step=28
				local l="Merg"
				local n="Kirazlı videoları için"
				if lang=="rus" then
					n="За вишневые видео"
				end
				table.insert(Titr2.Thanks,DoThanks(-1,l,n,380,6030))
				elseif s==28 and t>6060 then
				Titr2.step=29
				local l="Linx4"
				local n="Tepkisi için"
				if lang=="rus" then
					n="За экспрессию"
				end
				table.insert(Titr2.Thanks,DoThanks(-1,l,n,280,6060))
				elseif s==29 and t>6090 then
				Titr2.step=30
				local l="Just A Dog"
				local n="1.1.7'yi geçtiği için"
				if lang=="rus" then
					n="За первопроходство 1.1.7"
				end
				table.insert(Titr2.Thanks,DoThanks(-1,l,n,180,6090))
				elseif s==30 and t>6120 then
				Titr2.step=31
				local l="Necros"
				local n="Nostalji için"
				if lang=="rus" then
					n="За олдфажность"
				end
				table.insert(Titr2.Thanks,DoThanks(-1,l,n,80,6120))
				elseif s==31 and t>6290 then
				Titr2.step=32
				local l="@lari_ut"
				local n="For inspiring"
				if lang=="rus" then
					n="За вдохновение"
				end
				table.insert(Titr2.Thanks,DoThanks(1,l,n,380,6290))
				elseif s==32 and t>6320 then
				Titr2.step=33
				local l="Avranik"
				local n="For inspiring"
				if lang=="rus" then
					n="За вдохновение"
				end
				table.insert(Titr2.Thanks,DoThanks(1,l,n,280,6320))
				elseif s==33 and t>6350 then
				Titr2.step=34
				local l="Sydist"
				local n="For inspiring"
				if lang=="rus" then
					n="За вдохновение"
				end
				table.insert(Titr2.Thanks,DoThanks(1,l,n,180,6350))
				elseif s==34 and t>6380 then
				Titr2.step=35
				local l="MisterKaze"
				local n="For inspiring"
				if lang=="rus" then
					n="За вдохновение"
				end
				table.insert(Titr2.Thanks,DoThanks(1,l,n,80,6380))
				elseif s==35 and t>7010 then
				Titr2.light.sprite.Set("titr/light2")
				Titr2.light.sprite.alpha=1
				Titr2.Cast.alpha=1
				Titr2.SpThanks.alpha=0
				Titr2.step=36
			end
			elseif s==36 and t>7010 then
			local n="RSBlasnever"
			local s="Ön sanatçı\n(Igniyo'nun parasını çalıyor)"
			if lang=="rus" then
				s="Промо-художник\n(Крадет деньги у Игнитио)"
			end
			table.insert(Titr2.Posters,DoPoster(1,"seno",n,s,7010))
			Titr2.step=37
			elseif s==37 and t>7260 then
			local n="Alex Lomolom"
			local s="Overworld ve Buton Dokuları\n(şu an ölüyor)"
			if lang=="rus" then
				s="Спрайт оверворлда и меню битвы\n(Сейчас занят, он умирает)"
			end
			table.insert(Titr2.Posters,DoPoster(-1,"lom",n,s,7260))
			Titr2.step=38
			elseif s==38 and t>7510 then
			local n="Numan#6526, SHC, Yesil_51"
			local s="Türkçe Çevirmenler\n(Hepsine teşekkürler!)"
			if lang=="rus" then
				s="Промо-художник\nМыш (кродетця)"
			end
			table.insert(Titr2.Posters,DoPoster(1,"masha",n,s,7510))
			Titr2.step=39
			elseif s==39 and t>8010 then
			Titr2.step=100
			elseif s==100 and t>8010 then
			Titr2.Cast.alpha=0
			Titr2.light.sprite.alpha=0.5
			Titr2.light.sprite.Set("titr/light1")
			Titr1.showups={}
			local T={}
			local name="Sapph\n"
			local dial=""
			if lang=="rus" then
				dial=dial.."Музыка меню"
				else
				dial=dial.."Menu music"
			end
			T.txt1=CreateText("[novoice][instant][font:overworld]"..name,{0,400},240,"Top",-1)
			T.txt1.progressmode="none"
			T.txt1.HideBubble()
			T.txt1.color={1,1,0}
			T.txt1.alpha=0
			T.txt2=CreateText("[novoice][instant][font:overworld]"..dial,{0,372},240,"Top",-1)
			T.txt2.progressmode="none"
			T.txt2.HideBubble()
			T.txt2.alpha=0
			T.side=-1
			T.time=8010
			table.insert(Titr1.showups,T)
			Titr2.step=101
			elseif s==101 and t>8110 then
			local T={}
			local name="Valor\n"
			local dial=""
			if lang=="rus" then
				dial=dial.."Музыка интро"
				else
				dial=dial.."Intro music"
			end
			T.txt1=CreateText("[novoice][instant][font:overworld]"..name,{0,300},240,"Top",-1)
			T.txt1.progressmode="none"
			T.txt1.HideBubble()
			T.txt1.color={1,1,0}
			T.txt1.alpha=0
			T.txt2=CreateText("[novoice][instant][font:overworld]"..dial,{0,272},240,"Top",-1)
			T.txt2.progressmode="none"
			T.txt2.HideBubble()
			T.txt2.alpha=0
			T.side=1
			T.time=8110
			table.insert(Titr1.showups,T)
			Titr2.step=102
			elseif s==102 and t>8210 then
			local T={}
			local name="carimelle\n"
			local dial=""
			if lang=="rus" then
				dial=dial.."Английский голос Чары"
				else
				dial=dial.."İngilizce Chara Seslendirmeni"
			end
			T.txt1=CreateText("[novoice][instant][font:overworld]"..name,{0,200},240,"Top",-1)
			T.txt1.progressmode="none"
			T.txt1.HideBubble()
			T.txt1.color={1,1,0}
			T.txt1.alpha=0
			T.txt2=CreateText("[novoice][instant][font:overworld]"..dial,{0,172},240,"Top",-1)
			T.txt2.progressmode="none"
			T.txt2.HideBubble()
			T.txt2.alpha=0
			T.side=-1
			T.time=8210
			table.insert(Titr1.showups,T)
			Titr2.step=103
			elseif s==103 and t>8310 then
			local T={}
			local name="Veliya\n"
			local dial=""
			if lang=="rus" then
				dial=dial.."Русский голос Чары"
			 	else
				dial=dial.."Rus Chara Seslendirmeni"
			end
			T.txt1=CreateText("[novoice][instant][font:overworld]"..name,{0,100},240,"Top",-1)
			T.txt1.progressmode="none"
			T.txt1.HideBubble()
			T.txt1.color={1,1,0}
			T.txt1.alpha=0
			T.txt2=CreateText("[novoice][instant][font:overworld]"..dial,{0,72},240,"Top",-1)
			T.txt2.progressmode="none"
			T.txt2.HideBubble()
			T.txt2.alpha=0
			T.side=1
			T.time=8310
			table.insert(Titr1.showups,T)
			Titr2.step=104
			elseif s==104 and t>8510 then
			Titr2.photo5=CreateProjectileAbs("titr/photo3",900,320,"Over")
			Titr2.photo5.sprite.Scale(5,5)
			Titr2.photo5.SetVar("time",8570)
			Titr2.step=105
		end
		if Titr1.showups then
			for i=1,#Titr1.showups do
				local T=Titr1.showups[i]
				if T.txt1.isactive then
					local txt1=T.txt1
					local txt2=T.txt2
					local time=t-T.time
					local side=T.side
					if time<60 then
						txt1.MoveTo(240+(240-60*math.sin(time*math.pi/120))*side,txt1.y)
						txt1.alpha=math.sin(time*math.pi/120)
						txt2.MoveTo(txt1.x,txt1.y-28)
						txt2.alpha=math.sin(time*math.pi/120)
						elseif time>140 and time<200 then
						txt1.MoveTo(240+(180-60*(1-math.cos((time-140)*math.pi/120)))*side,txt1.y)
						txt1.alpha=math.sin((time-80)*math.pi/120)
						txt2.MoveTo(txt1.x,txt1.y-28)
						txt2.alpha=math.sin((time-80)*math.pi/120)
						elseif time>200 then
						txt1.Remove()
						txt2.Remove()
					end
				end
			end
		end
		if Titr2.photo5 then
			local p=Titr2.photo5
			local T=t-p.GetVar("time")
			T=T*1.5
			if T>290 and T<320 then
				p.SetVar("time",p.GetVar("time")-20)
				T=T+30
			end
			local x=0
			local y=-23
			if T<-1000 then
				x=0
				y=-93
				elseif T<291 then
				if T<260 then
					x=-180+T*1
					elseif T<291 then
					x=80+20*math.sin((T-260)*math.pi/60)
				end
				if x<-110 then
					y=15
					elseif x<-30 then
					local n=110+x
					if n<30 then
						y=15+12*(1-math.cos(n*math.pi/60))
						elseif n<50 then
						y=27+0.6*(n-30)
						elseif n<80 then
						y=39+11*math.sin((n-50)*math.pi/60)
					end
					elseif x<37 then
					y=50
					Titr2.light.sprite.alpha=0
					elseif x<103 then
					if x<67 then
						y=50-13*(1-math.cos((x-37)*math.pi/60))
						else
						y=37-22*(x-66)/34
						
					end
				end
				elseif T<496 then
				y=15
				if T<320 then
					x=100
					elseif T<350 then
					x=80+20*math.sin((T-290)*math.pi/60)
					elseif T<465 then
					x=430-T
					elseif T<496 then
					x=-35-20*math.sin((T-465)*math.pi/60)
				end
				if x>47 then
					if x<82 then
						y=-3-20*math.sin((82-x)*math.pi/70)
						else
						y=15-0.05*(100-x)*20
					end
					else
					y=-23
				end
				elseif T<530 then
				x=-55
				y=-23
				elseif T<621 then
				local old=1-math.sin((T-530)*math.pi/180)
				x=-55*old
				elseif T<741 then
				local old=5-(T-620)/30
				p.sprite.Scale(old,old)
				elseif T>770 and T<831 then
				y=-58+35*math.cos((T-770)*math.pi/60)
				elseif T>830 then
				y=-93
				if T>900 then
					dial={}
					if lang=="rus" then
						dial={"[font:overworld]Вообще-то,[w:6] я не люблю фотографироваться.[w:12] Но это фото будет моим любимым.[w:12]\nА ты что думаешь[waitall:4][w:3]...[waitall:1][w:12] Зеркальце?[w:30][func:AllGoesDarkOnceMore]"}
						else
						dial={"[font:overworld]Aslında,[w:6] fotoğrafımın çekilmesini sevmem.[w:12] fakat bu favorim olacak.[w:12] Ne düşünüyorsun[waitall:4][w:3]...[waitall:1][w:12] Ayna?[w:30][func:AllGoesDarkOnceMore]"}
					end
					local t=CreateText(dial,{80,160},480,"Top",-1)
					t.HideBubble()
					t.progressmode="none"
					Titr2.Chara=t
					p.SetVar("time",9999999999)
				end
			end
			p.MoveToAbs(320-x*p.sprite.xscale,240-y*p.sprite.yscale)
		end
		if Titr2.BlackOut then
			local t=Titr2.BlackOut
			local time=t.GetVar("time")+1
			if Achiventor.Time>0 then
				time=time-1
			end
			t.SetVar("time",time)
			if time<180 then
				t.sprite.alpha=0.5-0.5*math.cos(time*math.pi/180)
				elseif time==270 then
				local dial=""
				if lang=="eng" then
					dial="SON"
					else
					dial="КОНЕЦ"
				end
				--t.sprite.alpha=0
				local p=CreateText("[font:overworld][novoice][waitall:10][w:15]"..dial,{320,240},480,"Over",-1)
				p.HideBubble()
				p.progressmode="none"
				p.Scale(4,4)
				p.MoveTo(320-p.GetTextWidth()*2,220)
				Titr2.End=p
				elseif time==600 then
				GotAchivement(5)
				t.SetVar("time",time+1)
				elseif time>750 and time<901 then
				Titr2.End.alpha=math.cos((time-750)*math.pi/300)
				elseif time==961 then
				State("DONE")
			end
		end
		for i=1,#Titr2.Thanks do
			local p=Titr2.Thanks[i]
			if p.txt1.isactive then
				local T=t-p.time
				local x=180+p.side*160
				local t1=p.txt1
				local t2=p.txt2
				if T<60 then
					t1.alpha=math.sin(T*math.pi/120)
					t1.MoveTo(x,p.pos-90+90*math.sin(T*math.pi/120))
					t2.alpha=math.sin(T*math.pi/120)
					t2.MoveTo(x,p.pos-118+90*math.sin(T*math.pi/120))
					elseif T<500 then
					t1.alpha=1
					t1.MoveTo(x,p.pos)
					t2.alpha=1
					t2.MoveTo(x,p.pos-28)
					elseif T<630 then
					t1.alpha=math.sin((T-390)*math.pi/240)
					t2.alpha=math.sin((T-390)*math.pi/240)
					elseif T>629 then
					t1.Remove()
					t2.Remove()
				end
			end
		end
		for i=1,#Titr2.Posters do
			local p=Titr2.Posters[i]
			if p.spr.isactive==true then
				local T=t-p.StartTime
				local side=p.side
				if T<120 then
					local sin1=math.sin(T*math.pi/240)
					local sin2=1
					if T<60 then
						sin2=math.sin(T*math.pi/120)
					end
					p.spr.sprite.color={0,0,0,sin2}
					local x=320+110*side-220*side*sin1
					p.spr.MoveToAbs(x,p.spr.absy)
					elseif T>150 and T<180 then
					p.spr.sprite.color={0,0,0,1}
					p.txt1.alpha=math.sin((T-150)*math.pi/60)
					p.txt2.alpha=math.sin((T-150)*math.pi/60)
					elseif T>210 and T<270 then
					local sin=math.sin((T-210)*math.pi/120)
					p.spr.sprite.color={sin,sin,sin,1}
					elseif T>300 and T<360 then
					p.spr.sprite.SendToBottom()
					elseif T>420 then
					local sin1=math.sin((T-290)*math.pi/260)
					local sin2=1
					if T>485 then
						sin2=math.sin((T-420)*math.pi/130)
					end
					p.spr.sprite.color={sin1,sin1,sin1,sin2}
					local x=320+110*side-220*side*sin2
					p.spr.MoveToAbs(x,p.spr.absy)
					p.txt1.alpha=sin2
					p.txt2.alpha=sin2
					if T>550 then
						p.spr.Remove()
						p.txt1.Remove()
						p.txt2.Remove()
					end
				end
			end
		end
		
		
			
	end
end
if Titr1.phase>0 then
	if Titr1.phase%2==1 then
		Titr1.timer=Titr1.timer+Time.dt*60
	end
	local t=Titr1.timer
	local n=1
	local a="[color:ff4040]"
	local b="[color:ffff40]"
	if Titr1.phase==1 then
		if t>-89 and Titr1.step==0 then
			Titr1.step=1
			Audio.PlaySound("titres")
		end
		if t>0 and Titr1.step==1 then
			n=1
			Titr1.step=2
			Titr1.Cover=CreateProjectileAbs("overworld/beforebattle",320,240,"Top")
			Titr1.Titrs={}
			Titr1.Titrs[n]=CreateText("[color:ff4040]"..ForTitr1("Сделано","Made by",a),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,390)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("IGB team","IGB team"),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,360)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Основанно на UNDERTALE by","Based on UNDERTALE by",a),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,300)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Toby Fox","Toby Fox"),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,270)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("и вселенной StoryShift by","and AU StoryShift by",a),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,210)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("VoltraTheLively","VoltraTheLively"),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,180)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("на движке CreateYourFrisk by","on CreateYourFrisk engine by",a),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,120)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("RhenaudTheLukark","RhenaudTheLukark"),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,90)
			n=n+1
			elseif t>239 and Titr1.step==2 then
			Titr1.step=3
			Titr1.OverCover=CreateProjectileAbs("overworld/beforebattle",320,240,"Top")
			Titr1.OverCover.sprite.alpha=0
			Titr1.Buggy=CreateProjectileAbs("boggy/boogie_closedeyes",380,240,"Top")
			Titr1.Buggy.sprite.Scale(3,3)
			Titr1.Buggy.sprite.alpha=0
			elseif t>240 and t<270 then
			Titr1.OverCover.sprite.alpha=1-math.cos((t-240)*math.pi/60)
			elseif t>269 and Titr1.step==3 then
			Titr1.step=4
			for i=1,#Titr1.Titrs do
				Titr1.Titrs[i].Remove()
			end
			Titr1.OverCover.Remove()
			elseif t>270 and t<451 then
			local sin=math.sin((t-270)*math.pi/360)
			Titr1.Buggy.sprite.alpha=sin
			Titr1.Buggy.MoveToAbs(380-60*sin,240)
			elseif t>481 then
			Titr1.Buggy.MoveToAbs(320,240)
			Titr1.Buggy.sprite.alpha=1
			local string={}
			if wons==0 then
				if lang=="rus" then
					string={"[func:Dub,buggy/1/1][func:BoogyLook,closedeyes]Значит,[w:3] таков конец твоей истории?","[func:Dub,buggy/1/2]В смысле[waitall:4][w:3]...[speed:0.75][w:3] [func:BoogyLook,question]Ты доволен тем,[w:3] что получил?[w:6] [func:BoogyLook,cocky]Или это очередная посредственная постановка?","[func:Dub,buggy/1/3][func:BoogyLook,down]В прошлом мы были не разлей вода[waitall:4][w:3]...[speed:0.75][w:3] [color:8040ff]Метта.","[func:Dub,buggy/1/4][func:BoogyLook,question]Что изменилось?","[func:Titr1NextPhase][next] "}
					else
					string={"[func:Dub,buggy/1/1][func:BoogyLook,closedeyes]Yani,[w:3] istediğin son bu muydu?","[func:Dub,buggy/1/2]Yani[waitall:4][w:3]...[speed:0.75][w:3]  [func:BoogyLook,question]Aldığından tatmin oldu mu?[w:6] [func:BoogyLook,cocky]yada sadece çocuk oyncağı mıydı?","[func:Dub,buggy/1/3][func:BoogyLook,down]örnek gösterilirdik[waitall:4][w:3]...[speed:0.75][w:3][color:8040ff]Metta[color:ffffff].","[func:Dub,buggy/1/4][func:BoogyLook,question]Ne değişti?","[func:Titr1NextPhase][next] "}
				end
				else
				if lang=="rus" then
					string={"[func:Dub,buggy/5/1][func:BoogyLook,sad]Я ведь просил,[w:6] не втягивать меня в это снова[waitall:4][w:6]...[speed:0.75][w:6]","[func:Dub,buggy/5/2][func:BoogyLook,sarcastic]Но,[w:6] видимо,[w:6] я тебе необходим.[w:6]","[func:Dub,buggy/5/3][func:BoogyLook,joking]Неужели ты настолько ранимый,[w:6] кузен?[w:6]","[func:Titr1NextPhase][next] "}
					else
					string={"[func:Dub,buggy/5/1][func:BoogyLook,sad]Beni çıkarman için sana yalvardım,[w:3] değil mi?[w:6] ","[func:Dub,buggy/5/2][func:BoogyLook,sarcastic]Fakat bana ihtiyacın var gibi[waitall:4][w:3]...[w:15]","[func:Dub,buggy/5/3][func:BoogyLook,joking]Cidden mi,[w:3] kuzen?[w:6] ","[func:Titr1NextPhase][next] "}
				end
			end
			if dubbing==true then
				for i=1,#string do
					string[i]="[noskip][font:monster][novoice][color:000000][speed:0.75]"..string[i]
				end
				else
				for i=1,#string do
					string[i]="[noskip][font:monster][novoice][voice:buggy][color:000000][speed:0.75]"..string[i]
				end
			end
			Titr1.BuggyText=CreateText(string,{45,190},180,"Top",-1)
			Titr1.BuggyText.progressmode="auto"
			Titr1.BuggyText.SetAutoWaitTimeBetweenTexts(90)
			Titr1.BuggyText.SetTail("right","50%")
			Titr1.timer=0
			Titr1.step=0
			Titr1.phase=2
		end
		elseif Titr1.phase==3 then
		if t<180 then
			n=1
			local cos=math.cos(t*math.pi/360)
			Titr1.Buggy.MoveToAbs(380-60*cos,240)
			Titr1.Buggy.sprite.alpha=cos
			elseif t>209 and Titr1.step==0 then
			Titr1.step=1
			Titr1.Buggy.sprite.alpha=0
			Titr1.Titrs={}
			Titr1.Titrs[n]=CreateText(ForTitr1("Vladimir Ignitio","Vladimir Ignitio"),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,340)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Создатель, сценарий, геймдизайн","Creator, script, gamedesign",b),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,310)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Drendy","Drendy"),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,250)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Со-создатель, программист","Co-Creator, programmer",b),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,220)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("The Crystal Horse","The Crystal Horse"),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,160)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Со-создатель, программист","Co-Creator, programmer",b),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,130)
			n=n+1
			elseif t>450 and Titr1.step==1 then
			Titr1.step=2
			Titr1.OverCover=CreateProjectileAbs("overworld/beforebattle",320,240,"Top")
			Titr1.OverCover.sprite.alpha=0
			elseif t>450 and t<480 then
			Titr1.OverCover.sprite.alpha=1-math.cos((t-450)*math.pi/60)
			elseif t>479 and Titr1.step==2 then
			Titr1.step=3
			for i=1,#Titr1.Titrs do
				Titr1.Titrs[i].Remove()
			end
			Titr1.OverCover.Remove()
			elseif t>480 and t<661 then
			local sin=math.sin((t-480)*math.pi/360)
			Titr1.Buggy.sprite.alpha=sin
			Titr1.Buggy.MoveToAbs(380-60*sin,240)
			Titr1.Buggy.sprite.Set("boggy/boogie_uncertain")
			elseif t>689 then
			Titr1.Buggy.sprite.alpha=1
			Titr1.Buggy.MoveToAbs(320,240)
			local string={}
			if wons==0 then
				if lang=="rus" then
					string={"[func:Dub,buggy/2/1][func:BoogyLook,dissapointed]Ты всегда любил драму.[w:6] Жил ею.[w:6] Жаждал её.","[func:Dub,buggy/2/2][func:BoogyLook,closedeyes]Но стоит мне представить,[w:3] как ради этой драмы ты готов убить даже меня[waitall:4][w:3]...[speed:0.75][w:3]","[func:Dub,buggy/2/3][func:BoogyLook,base]Я больше не вижу смысла в том,[w:3] чтобы тебя развлекать.","[func:Titr1NextPhase][next] "}
					else
					string={"[func:Dub,buggy/2/1][func:BoogyLook,dissapointed]Her zaman dramalardna bıkmıştın.[w:6] Hiç sevmezdin,[w:3] neredeyse kaderin gibiydi.","[func:Dub,buggy/2/2][func:BoogyLook,closedeyes]Fakat beni drama için öldürmen aklıma gelince[waitall:4][w:3]...[speed:0.75][w:3]","[func:Dub,buggy/2/3][func:BoogyLook,base]Seni tatmin etmek için bir neden göremiyorum.","[func:Titr1NextPhase][next] "}

				end
				else
				if lang=="rus" then
					string={"[func:Dub,buggy/6/1][func:BoogyLook,base]Мне совсем тебя не жаль.[w:9] [func:BoogyLook,sarcastic] Но занятно,[w:3] что ты нашел что-то интересное в этой истеричной девке.","[func:Dub,buggy/6/2][func:BoogyLook,uncertain]Ведь по сути[waitall:4][w:6]...[speed:0.75][w:6] [func:BoogyLook,dissapointed]Когда тебя что-то не устраивает,[w:6] [func:BoogyLook,base]ты становишься таким же.[w:10]","[func:Titr1NextPhase][next] "}
					else
					string={"[func:Dub,buggy/6/1][func:BoogyLook,base]Merhamet hissetmiyorum.[w:12] [func:BoogyLook,sarcastic]Sadece bu vahşilikte neyi bulduğunu merak ediyorum.[w:3] ","[func:Dub,buggy/6/2][func:BoogyLook,uncertain]Çünkü[waitall:4][w:6]...[speed:0.75][w:12] [func:BoogyLook,dissapointed]tatmin olmamışken,[w:6] [func:BoogyLook,base]ona benziyorsun.[w:3] ","[func:Titr1NextPhase][next] "}
				end
			end
			if dubbing==true then
				for i=1,#string do
					string[i]="[noskip][font:monster][novoice][color:000000][speed:0.75]"..string[i]
				end
				else
				for i=1,#string do
					string[i]="[noskip][font:monster][novoice][voice:buggy][color:000000][speed:0.75]"..string[i]
				end
			end
			Titr1.BuggyText=CreateText(string,{20,190},180,"Top",-1)
			Titr1.BuggyText.progressmode="auto"
			Titr1.BuggyText.SetAutoWaitTimeBetweenTexts(90)
			Titr1.BuggyText.SetTail("right","50%")
			Titr1.timer=0
			Titr1.step=0
			Titr1.phase=4
		end
		elseif Titr1.phase==5 then
		if t<180 then
			local cos=math.cos(t*math.pi/360)
			Titr1.Buggy.MoveToAbs(380-60*cos,240)
			Titr1.Buggy.sprite.alpha=cos
			elseif t>209 and Titr1.step==0 then
			Titr1.step=1
			Titr1.Buggy.sprite.alpha=0
			n=1
			Titr1.Titrs={}
			Titr1.Titrs[n]=CreateText(ForTitr1("GeorgTime","GeorgTime"),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,340)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Спрайты персонажей","Character's sprites",b),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,310)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Alex Lomolom","Alex Lomolom"),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,250)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Спрайт оверворлда и меню битвы","Overworld's and buttons' sprites",b),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,220)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("sotwound","sotwound"),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,160)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Спрайты меню игры","Menu sprites",b),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,130)
			n=n+1
			elseif t>449 and Titr1.step==1 then
			Titr1.step=2
			Titr1.OverCover=CreateProjectileAbs("overworld/beforebattle",320,240,"Top")
			Titr1.OverCover.sprite.alpha=0
			elseif t>450 and t<480 then
			Titr1.OverCover.sprite.alpha=1-math.cos((t-450)*math.pi/60)
			elseif t>479 and Titr1.step==2 then
			Titr1.step=3
			for i=1,#Titr1.Titrs do
				Titr1.Titrs[i].Remove()
			end
			Titr1.OverCover.Remove()
			n=1
			Titr1.Titrs={}
			Titr1.Titrs[n]=CreateText(ForTitr1("RSBlasnever","RSBlasnever"),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,300)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Промо-художник","Promo-artist",b),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,270)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("MitMar","MitMar"),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,210)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Промо-художник","Promo-artist",b),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,180)
			n=n+1
			elseif t>719 and Titr1.step==3 then
			Titr1.step=4
			Titr1.OverCover=CreateProjectileAbs("overworld/beforebattle",320,240,"Top")
			Titr1.OverCover.sprite.alpha=0
			elseif t>720 and t<750 then
			Titr1.OverCover.sprite.alpha=1-math.cos((t-720)*math.pi/60)
			elseif t>749 and Titr1.step==4 then
			Titr1.step=5
			for i=1,#Titr1.Titrs do
				Titr1.Titrs[i].Remove()
			end
			Titr1.OverCover.Remove()
			elseif t>750 and t<930 then
			local sin=math.sin((t-750)*math.pi/360)
			Titr1.Buggy.sprite.alpha=sin
			Titr1.Buggy.MoveToAbs(380-60*sin,240)
			Titr1.Buggy.sprite.Set("boggy/boogie_base")
			elseif t>959 then
			Titr1.Buggy.sprite.alpha=1
			Titr1.Buggy.MoveToAbs(320,240)
			local string={}
			if wons==0 then
				if lang=="rus" then
					string={"[func:Dub,buggy/3/1][func:BoogyLook,base]Я не наивный дурак,[w:3] Метта[waitall:4][w:3]...[speed:0.75][w:6]","[func:Dub,buggy/3/2][func:BoogyLook,uncertain]Я не борюсь за свою жизнь.[w:6] Не боюсь за судьбу этого мира.[w:6]","[func:Dub,buggy/3/3][func:BoogyLook,joking]У меня нет души.[w:6] Я не испытываю таких чувств.","[func:Dub,buggy/3/4][func:BoogyLook,base]Мне просто нет удовольствия тешить твое театральное эго.","[func:Titr1NextPhase][next] "}
					else
					string={"[func:Dub,buggy/3/1][func:BoogyLook,base]Malın teki değilim,[w:3] Metta[waitall:4][w:3]...[speed:0.75][w:3]","[func:Dub,buggy/3/2][func:BoogyLook,uncertain]Hayatımın gitmesine izin verdim,[w:3] dünyanın kaderi umrumda değil.","[func:Dub,buggy/3/3][func:BoogyLook,joking]Bir ruhum yok.[w:6] O hisleri hissedemiyorum.","[func:Dub,buggy/3/4][func:BoogyLook,base]Egonu yok etmek istemiyorum.[w:5] ","[func:Titr1NextPhase][next] "}
				end
				else
				if lang=="rus" then
					string={"[func:Dub,buggy/7/1][func:BoogyLook,uncertain]Я имею в виду,[w:6] ты так же цепляешься за любые возможности.","[func:Dub,buggy/7/2][func:BoogyLook,down]Например,[w:3] когда на нас напали в переулке,[w:3] а ты защищал меня с картонной коробкой в руках[waitall:4][w:3]...[speed:0.75][w:3]","[func:BoogyLook,closedeyes][func:Dub,buggy/7/3]И для тебя в тот момент даже такой хлам был лучшим инструментом.[w:10]","[func:Titr1NextPhase][next] "}
					else
					string={"[func:Dub,buggy/7/1][func:BoogyLook,uncertain]Yani,[w:6] hatırlıyor musun...[w:3] ","[func:Dub,buggy/7/2][func:BoogyLook,down]o vadide beni onlardan korumak için bir kutu kullanmıştın[waitall:4][w:6]...[w:15]","[func:BoogyLook,closedeyes][func:Dub,buggy/7/3]Heh,[w:6] o kutu elindeki en iyi şeydi.[w:3] ","[func:Titr1NextPhase][next] "}
				end
			end
			if dubbing==true then
				for i=1,#string do
					string[i]="[noskip][font:monster][novoice][color:000000][speed:0.75]"..string[i]
				end
				else
				for i=1,#string do
					string[i]="[noskip][font:monster][novoice][voice:buggy][color:000000][speed:0.75]"..string[i]
				end
			end
			Titr1.BuggyText=CreateText(string,{50,110},180,"Top",-1)
			Titr1.BuggyText.progressmode="auto"
			Titr1.BuggyText.SetAutoWaitTimeBetweenTexts(90)
			Titr1.BuggyText.SetTail("right","50%")
			Titr1.timer=0
			Titr1.step=0
			Titr1.phase=6
		end
		elseif Titr1.phase==7 then
		if t<180 then
			local cos=math.cos(t*math.pi/360)
			Titr1.Buggy.MoveToAbs(380-60*cos,240)
			Titr1.Buggy.sprite.alpha=cos
			elseif t>209 and Titr1.step==0 then
			Titr1.Buggy.sprite.alpha=0
			Titr1.step=1
			n=1
			Titr1.Titrs={}
			Titr1.Titrs[n]=CreateText(ForTitr1("Andriana Mantidfly","Andriana Mantidfly"),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,300)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Композитор","Composer",b),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,270)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("wonderless.","wonderless."),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,210)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Композитор","Composer",b),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,180)
			n=n+1
			elseif t>450 and Titr1.step==1 then
			Titr1.step=2
			Titr1.OverCover=CreateProjectileAbs("overworld/beforebattle",320,240,"Top")
			Titr1.OverCover.sprite.alpha=0
			elseif t>450 and t<480 then
			Titr1.OverCover.sprite.alpha=1-math.cos((t-450)*math.pi/60)
			elseif t>480 and Titr1.step==2 then
			Titr1.step=3
			for i=1,#Titr1.Titrs do
				Titr1.Titrs[i].Remove()
			end
			Titr1.OverCover.Remove()
			n=1
			Titr1.Titrs={}
			Titr1.Titrs[n]=CreateText(ForTitr1("carimelle","carimelle"),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,390)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Английский голос Чары","İngilizce Chara Seslendirmeni",b),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,360)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Veliya","Veliya"),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,300)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Русский голос Чары","Rus Chara Seslendirmeni",b),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,270)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("wonderless.","wonderless."),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,210)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Всеединый голос Буги","All-mighty Boogie's VO",b),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,180)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Sapph","Sapph"),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,120)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Создатель музыки меню","Menü müziği yapımcısı",b),{0,0},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth()/2,90)
			n=n+1
			elseif t>720 and Titr1.step==3 then
			Titr1.step=4
			Titr1.OverCover=CreateProjectileAbs("overworld/beforebattle",320,240,"Top")
			Titr1.OverCover.sprite.alpha=0
			elseif t>720 and t<750 then
			Titr1.OverCover.sprite.alpha=1-math.cos((t-720)*math.pi/60)
			elseif t>750 and Titr1.step==4 then
			Titr1.step=5
			for i=1,#Titr1.Titrs do
				Titr1.Titrs[i].Remove()
			end
			Titr1.OverCover.Remove()
			elseif t>750 and t<930 then
			local sin=math.sin((t-750)*math.pi/360)
			Titr1.Buggy.sprite.alpha=sin
			Titr1.Buggy.MoveToAbs(380-60*sin,240)
			Titr1.Buggy.sprite.Set("boggy/boogie_closedeyes")
			elseif t>959 then
			local string={}
			if wons==0 then
				if lang=="rus" then
					string={"[func:Dub,buggy/4/1][func:BoogyLook,closedeyes]Поэтому[waitall:4][w:3]...[speed:0.75][w:3] [func:BoogyLook,cocky]Вычеркни и меня из своего сценария.[w:15]","[func:Dub,buggy/4/2]Я больше не хочу играть по твоим правилам.[w:15]","[func:Dub,buggy/4/3][func:BoogyLook,base]Не хочу подыгрывать злу,[w:6] что заняло место моей семьи.[w:15]","[func:Dub,buggy/4/4]Ты больше не мой кузен.[w:9] [func:BoogyLook,death]А значит,[w:15][speed:0.5] мне нет смысла жить дальше[w:20]","[func:Titr1NextPhase][next] "}
					if dubbing==false then
						string[#string-1]="[func:Dub,buggy/4/4]Ты больше не мой кузен.[w:9] [func:BoogyLook,death]А значит,[w:15][speed:0.5][novoice][voice:lowbuggy] мне нет смысла жить дальше[w:20]"
					end
					else
					string={"[func:Dub,buggy/4/1][func:BoogyLook,closedeyes]Bu yüzden[waitall:4][w:3]...[speed:0.75][w:3] [func:BoogyLook,cocky]Beni senaryolarından çıkar.","[func:Dub,buggy/4/2]Sana göre yaşamak istemiyorum.","[func:Dub,buggy/4/3][func:BoogyLook,base]Ailemi yok eden şeytanla oynamak istemiyorum.","[func:Dub,buggy/4/4]Artık kuzenim değilsim.[w:15] [speed:0.5][novoice][voice:lowbuggy][func:BoogyLook,death]Ve bu yüzden artık hayatım umrumda değil.","[func:Titr1NextPhase][next] "}
				end
				else
				if lang=="rus" then
					string={"[func:Dub,buggy/8/1][func:BoogyLook,base]Не обращай внимания[waitall:4][w:6]...[speed:0.75][w:6] [func:BoogyLook,uncertain]Перед смертью на ностальгию потянуло[waitall:4][w:7]...[speed:0.75][w:6]","[func:Dub,buggy/8/2][func:BoogyLook,confused]Но задумайся,[w:9] не стал ли ты сам[w:6] инструментом для чужих нужд?[w:15] [func:BoogyLook,closedeyes]Ты ведь знаешь[waitall:4][w:13]...[speed:0.75][w:15] [func:BoogyLook,joking]как устроен наш мир.[w:15] И кто нами всеми помыкает.","[func:Dub,buggy/8/3][func:BoogyLook,dissapointed]Задумайся.[w:12] [func:BoogyLook,closedeyes]Поговорим об этом[waitall:4][w:8]...[speed:0.75][w:8] [speed:0.5][func:BoogyLook,death]при следующей встрече.[w:10]","[func:Titr1NextPhase][next] "}
					if dubbing==false then
						string[#string-1]="[func:Dub,buggy/8/3][func:BoogyLook,dissapointed]Задумайся.[w:12] [func:BoogyLook,closedeyes]Поговорим об этом[waitall:4][w:8]...[speed:0.75][w:8] [speed:0.5][func:BoogyLook,death][novoice][voice:lowbuggy]при следующей встрече.[w:10]"
					end
					else
					string={"[func:Dub,buggy/8/1][func:BoogyLook,base]Boşver[waitall:4][w:3]...[speed:0.75][w:9] [func:BoogyLook,uncertain]Sadece ölmeden önce eskileri hatırlamak istedim.[w:6] ","[func:Dub,buggy/8/2][func:BoogyLook,confused]But think about it,[w:12] Sen de o kutu gibisin, değil mi?[w:16] [func:BoogyLook,closedeyes]Biliyorsun[waitall:4][w:6]...[speed:0.75][w:9]","[func:Dub,buggy/8/3][func:BoogyLook,joking]nasıl bu dünyanın çalıştığını.[w:12] Ve kimin kuklaları yönettiğini.[w:9] ","[func:Dub,buggy/8/4][func:BoogyLook,dissapointed]Bunu düşün.[w:18] [func:BoogyLook,closedeyes]Bunu tartışabilirdik[waitall:4][w:6]...[speed:0.75][w:9][novoice][voice:lowbuggy][func:BoogyLook,death][speed:0.5] next time we meet~[w:12]","[func:Titr1NextPhase][next] "}
				end
			end
			if dubbing==true then
				for i=1,#string do
					string[i]="[noskip][font:monster][novoice][color:000000][speed:0.75]"..string[i]
				end
				else
				for i=1,#string do
					string[i]="[noskip][font:monster][novoice][voice:buggy][color:000000][speed:0.75]"..string[i]
				end
			end
			Titr1.BuggyText=CreateText(string,{50,110},180,"Top",-1)
			Titr1.BuggyText.progressmode="auto"
			Titr1.BuggyText.SetAutoWaitTimeBetweenTexts(90)
			Titr1.BuggyText.SetTail("right","50%")
			Titr1.timer=0
			Titr1.step=0
			Titr1.phase=8
		end
		elseif Titr1.phase==9 then
		if t>0 and Titr1.step==0 then
			Titr1.step=1
			IsTalk=false
			Audio.PlaySound("slice")
			Titr1.Buggy.sprite.Set("boggy/boogie_death")
			Titr1.Buggy.MoveToAbs(320,240)
			Titr1.Buggy.sprite.Scale(3,3)
			Titr1.Slash=CreateProjectileAbs("chainsaw/1",320,160,"Top")
			Titr1.Slash.sprite.rotation=30
			Titr1.Slash.sprite.Scale(3,3)
			elseif t>11 and t<61 then
			if t>50 then
				Titr1.Slash.sprite.Set("chainsaw/6")
				elseif t>40 then
				Titr1.Slash.sprite.Set("chainsaw/5")
				elseif t>30 then
				Titr1.Slash.sprite.Set("chainsaw/4")
				elseif t>20 then
				Titr1.Slash.sprite.Set("chainsaw/3")
				else
				Titr1.Slash.sprite.Set("chainsaw/2")
			end
			elseif t>60 and Titr1.step==1 then
			Titr1.step=2
			Titr1.Slash.Remove()
			Misc.ShakeScreen(10,10,true)
			Audio.PlaySound("hit")
			Titr1.Buggy.sprite.Set("empty")
			Titr1.Legs=CreateProjectileAbs("boggy/boogie_death_1",320,240,"Top")
			Titr1.Head=CreateProjectileAbs("boggy/boogie_death_2",320,240,"Top")
			Titr1.Cap=CreateProjectileAbs("boggy/boogie_death_3",320,240,"Top")
			Titr1.Legs.SetVar("moving",{1,0.5,-0.5})
			Titr1.Head.SetVar("moving",{-1,2,1})
			Titr1.Cap.SetVar("moving",{-0.5,3,1})
			Titr1.Legs.sprite.Scale(3,3)
			Titr1.Head.sprite.Scale(3,3)
			Titr1.Cap.sprite.Scale(3,3)
			elseif t>61 and t<530 then
			local d=Time.dt*60
			local n={Titr1.Legs,Titr1.Head,Titr1.Cap}
			for i=1,3 do
				local m=n[i]
				local mov=m.GetVar("moving")
				if i<3 or mov[2]>0 then
					m.Move(mov[1]*d,mov[2]*d)
					m.sprite.rotation=m.sprite.rotation+mov[3]*d
					if i==3 then
						mov[2]=mov[2]-0.05*d
						else
						mov[2]=mov[2]-0.1*d
					end
					m.SetVar("moving",mov)
					if i==3 and mov[2]<0 then
						local dist=63
						local x=m.absx-dist*math.sin(30*math.pi/180)
						local y=m.absy+dist*math.cos(30*math.pi/180)
						local point={x,y}
						m.SetVar("dist",dist)
						m.SetVar("point",point)
						m.SetVar("time",0)
						m.SetVar("rot",30)
						m.SetVar("side",1)
						m.SetVar("firsttime",true)
					end
					else
					local t=m.GetVar("time")+d
					m.SetVar("time",t)
					local r=m.GetVar("rot")*m.GetVar("side")
					if t<120 then
						r=r*(math.cos(t*math.pi/120))
						else r=-r
					end
					local g=math.abs(r)
					local x=2*math.sqrt(math.cos(g*math.pi/60))*m.GetVar("side")*d
					local y=2*(math.sin(g*math.pi/50))*math.abs((math.sin(g*math.pi/50)))*d
					if m.GetVar("firsttime") and t<60 then
						local old=math.cos(t*math.pi/120)
						x=0.5*old+2*(1-old)
						if t<30 then
							y=2*(1-math.cos(t*math.pi/60))
							else
							y=2*(1-math.cos((t-60)*math.pi/60))
						end
					end
					local point=m.GetVar("point")
					point={point[1]-x,point[2]-y}
					m.SetVar("point",point)
					m.sprite.rotation=(r+30)
					x=point[1]+m.GetVar("dist")*math.sin(r*math.pi/180)
					y=point[2]-m.GetVar("dist")*math.cos(r*math.pi/180)
					m.MoveToAbs(x,y)
					if t>119 then
						m.SetVar("firsttime",false)
						m.SetVar("side",-m.GetVar("side"))
						m.SetVar("time",0)
					end
				end
			end
			elseif t>560 and Titr1.step==2 then
			Titr1.step=3
			n=1
			Titr1.Titrs={}
			Titr1.Titrs[n]=CreateText(ForTitr1("kae","kae",a),{120,315},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("За создание INSANTION","For creating INSANTION"),{120,285},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("keno9988i","keno9988i",a),{120,255},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("За создание Megaloglamour","For creating Megaloglamour"),{120,225},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("BotanicSage","BotanicSage",a),{120,195},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("За создание Waters Of Megalovania","For creating Waters Of Megalovania"),{120,165},480,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Nickel Dare","Nickel Dare",a),{120,105},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("За локализацию движка","For localization of CYF"),{120,75},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.OverCover=CreateProjectileAbs("overworld/beforebattle",320,240,"Top")
			Titr1.OverCover.sprite.alpha=0
			Titr1.Titrs[n]=CreateText(ForTitr1("Особые благодарности","Special applause for"),{0,0},480,"Top",-1)
			Titr1.Titrs[n].Scale(2,2)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth(),380)
			n=n+1
			elseif t>800 and t<830 then
			Titr1.OverCover.sprite.alpha=1-math.cos((t-800)*math.pi/60)
			elseif t>829 and Titr1.step==3 then
			Titr1.step=4
			for i=1,#Titr1.Titrs do
				Titr1.Titrs[i].Remove()
			end
			Titr1.OverCover.Remove()
			n=1
			Titr1.Titrs={}
			Titr1.Titrs[n]=CreateText(ForTitr1("Merg","Merg",a),{120,315},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("За вишневые видео","For cherry videos"),{120,285},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Linx4","Linx4",a),{120,255},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("За экспрессию","For expression"),{120,225},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Just A Dog","Just A Dog",a),{120,195},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("За первопроходство 1.1.7","For bypassing 1.1.7"),{120,165},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Necros","Necros",a),{120,135},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("За олдфажность","For nostalgia"),{120,105},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.OverCover=CreateProjectileAbs("overworld/beforebattle",320,240,"Top")
			Titr1.OverCover.sprite.alpha=0
			Titr1.Titrs[n]=CreateText(ForTitr1("Особые благодарности","Special applause for"),{0,0},480,"Top",-1)
			Titr1.Titrs[n].Scale(2,2)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth(),380)
			elseif t>1070 and t<1100 then
			Titr1.OverCover.sprite.alpha=1-math.cos((t-1070)*math.pi/60)
			elseif t>1099 and Titr1.step==4 then
			Titr1.step=5
			for i=1,#Titr1.Titrs do
				Titr1.Titrs[i].Remove()
			end
			Titr1.OverCover.Remove()
			n=1
			Titr1.Titrs={}
			Titr1.Titrs[n]=CreateText(ForTitr1("@lari_ut","@lari_ut",a),{120,315},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("За вдохновение","For inspiring"),{120,285},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Avranik","Avranik",a),{120,255},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("За вдохновение","For inspiring"),{120,225},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Sydist","Sydist",a),{120,195},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("За вдохновение","For inspiring"),{120,165},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("MisterKaze","MisterKaze",a),{120,135},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("За вдохновение","For inspiring"),{120,105},640,"Top",-1)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("Особые благодарности","Special applause for"),{0,0},480,"Top",-1)
			Titr1.Titrs[n].Scale(2,2)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth(),380)
			Titr1.OverCover=CreateProjectileAbs("overworld/beforebattle",320,240,"Top")
			Titr1.OverCover.sprite.alpha=0
			elseif t>1340 and t<1370 then
			Titr1.OverCover.sprite.alpha=1-math.cos((t-1340)*math.pi/60)
			elseif t>1369 and Titr1.step==5 then
			Titr1.step=6
			for i=1,#Titr1.Titrs do
				Titr1.Titrs[i].Remove()
			end
			Titr1.OverCover.Remove()
			elseif t>1489 and Titr1.step==6 then
			Titr1.step=7
			n=1
			Titr1.Titrs={}
			Titr1.Titrs[n]=CreateText(ForTitr1("И тебя, "..Misc.MachineName,"And you, "..Misc.MachineName),{0,0},480,"Top",-1)
			Titr1.Titrs[n].Scale(2,2)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth(),300)
			n=n+1 
			Titr1.Titrs[n]=CreateText(ForTitr1("За огромную роль","For main role"),{0,0},480,"Top",-1)
			Titr1.Titrs[n].Scale(2,2)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth(),240)
			n=n+1
			Titr1.Titrs[n]=CreateText(ForTitr1("в[color:8040ff] моем дебюте","in[color:8040ff] my debut"),{0,0},480,"Top",-1)
			Titr1.Titrs[n].Scale(2,2)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth(),180)
			n=n+1
			Titr1.OverCover=CreateProjectileAbs("overworld/beforebattle",320,240,"Top")
			Titr1.OverCover.sprite.alpha=0
			elseif t>1730 and t<1820 then
			Titr1.OverCover.sprite.alpha=1-math.cos((t-1730)*math.pi/180)
			elseif t>1819 and Titr1.step==7 then
			Titr1.step=8
			for i=1,#Titr1.Titrs do
				Titr1.Titrs[i].Remove()
			end
			Titr1.OverCover.Remove()
			n=1
			Titr1.Titrs={}
			Titr1.Titrs[n]=CreateText(ForTitr1("Режиссер","Producer",b),{0,0},480,"Top",-1)
			Titr1.Titrs[n].Scale(2,2)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth(),430)
			n=n+1
			Titr1.OverCover=CreateProjectileAbs("overworld/beforebattle",320,240,"Top")
			Titr1.Titrs[n]=CreateText("[font:overworld][color:000000][novoice][instant]METTA",{0,0},480,"Top",-1)
			Titr1.Titrs[n].Scale(2,2)
			Titr1.Titrs[n].HideBubble()
			Titr1.Titrs[n].progressmode="none"
			Titr1.Titrs[n].MoveTo(320-Titr1.Titrs[n].GetTextWidth(),360)
			mtt=CreateProjectileAbs("empty",320,222,"Top")
			mtt.sprite.Scale(3,3)
			mtt.sprite.Set("1.2/MTT/calm")
			mtt.sprite.alpha=0
			Floor=CreateProjectileAbs("bomb",320,220-mtt.sprite.height*1.5-2.5,"Top")
			Floor.sprite.Scale(150,1)
			Floor.sprite.color={0.25,0.125,0.5}
			Floor.sprite.alpha=0
			elseif t>1840 then
			if t<1900 then
				Titr1.OverCover.sprite.alpha=1-math.sin((t-1840)*math.pi/120)
				elseif t>2110 and t<2170 then
				Titr1.OverCover.sprite.alpha=1-math.sin((t-2050)*math.pi/120)
				elseif t>2170 and Titr1.step==9 then
				Titr1.step=10
				Titr1.Titrs[1].Remove()
				Titr1.OverCover.Remove()
			end
			if t>1840 and Titr1.step==8 then
				Titr1.step=9
				SetMusic("theme")
			end
			if t<1990 then
				NewAudio.SetVolume("theme",1-math.cos((t-1840)*math.pi/300))
			end
			if t>1930 and t<2230 then
				mtt.sprite.alpha=math.sin((t-1930)*math.pi/600)
				Floor.sprite.alpha=mtt.sprite.alpha
			end
			if t>2050 and t<2203 then
				local colors={}
				for i=1,5 do
					local t=(t-2117)*3+i*50-50
					if t<0 then
						t=0
						elseif t>255 then
						t=255
					end
					local r=SIX(math.floor(t/2))
					local g=SIX(math.floor(t/4))
					local b=SIX(t)
					colors[i]="[color:"..r..g..b.."]"
				end
				Titr1.Titrs[2].SetText("[font:overworld][novoice][instant]"..colors[5].."M"..colors[4].."E"..colors[3].."T"..colors[2].."T"..colors[1].."A")
				elseif t>2420 and t<2573 then
				local colors={}
				for i=1,5 do
					local t=(2487-t)*3+i*50-50
					if t<0 then
						t=0
						elseif t>255 then
						t=255
					end
					local r=SIX(math.floor(t/2))
					local g=SIX(math.floor(t/4))
					local b=SIX(t)
					colors[i]="[color:"..r..g..b.."]"
				end
				Titr1.Titrs[2].SetText("[font:overworld][color:000000][novoice][instant]"..colors[1].."M"..colors[2].."E"..colors[3].."T"..colors[4].."T"..colors[5].."A")
			end
			if t>2659 then
				Titr1.Titrs[2].Remove()
				Titr1.phase=0
				Titr1.timer=0
				Titr1.step=0
				local dialy={}
				if wons==0 then
					if HaveKilledChara==false then
						if lang=="rus" then
							dialy={"[waitall:4][w:3]...","Это было занятное шоу,[w:6] дорогуша.","[waitall:4][w:3]...?","[func:MTT,okey]Да,[w:6] да.[w:9] Прости,[w:6] мой дебют заставил тебя ждать.","Но теперь[waitall:4][w:3]...[waitall:2][w:3] [func:MTT,calm]Мы наконец встретились.[w:9]\nЛицом к лицу.","Я так восхищаюсь тобой,[w:6] дорогой актер.","У меня было много партнёров,[w:6] но лишь ты настолько ценен для меня.","[waitall:4][w:3]...[waitall:2][w:3][func:MTT,okey]Мы столько раз сыграли этот сценарий.[w:9]\n[func:MTT,Bored]Разве он тебе не наскучил?","[func:MTT,okey]Столько раз убивать эту наивную дуру[waitall:4][w:3]...[waitall:2][w:3] Очень увлекательно.","[func:MTT,Bored]Но разве тебе не интересно увидеть другие мои сценарии?","[func:MTT,okey]Я провел бесчисленные века в одиночестве,[w:6] сочиняя восхитительные пьесы.","Они достойны такого таланта,[w:6] как ты.","[func:MTT,Bored]Что скажешь,[w:6] дорогуша?","[func:MTT,calm]Давай забудем об этом недоразумении в виде этой улыбающейся истерички.","[func:MTT,proposal]И посмотрим на другие мои концепты.","[func:choice][next] "}
							else
							dialy={"[waitall:4][w:3]...","It was a fascinating show,[w:6] wasn't it?","[waitall:4][w:3]..?","[func:MTT,okey]Yes,[w:6] yes.[w:9] Sorry,[w:6] I must had to skip my debut previously.","But now[waitall:4][w:3]...[waitall:2][w:3] [func:MTT,calm]We are together at last.[w:9] Face to face.","I am so proud of you,[w:6] dear actor.","I had so many partners before,[w:6] but only you are so precious to me.","[func:MTT,okey]We played this script so many times.[w:9] [func:MTT,Bored]\nDidn't you get bored?","[func:MTT,okey]We killed this naive fool so many times[waitall:4][w:3]...[waitall:2][w:3] \nVery pleasant.[w:9]","[func:MTT,Bored]But aren't you interested in my other scripts?","[func:MTT,okey]I spend so much time all alone,[w:6] writing those fascinating scripts.","They're in need of such talant like you.","[func:MTT,Bored]Whatcha' think,[w:6] darling?","[func:MTT,calm]Let's forget about this nuisance in \nface of this smiley hysteria.","[func:MTT,proposal]And let's check out my other scripts.","[func:choice][next] "}
						end
						else
						if lang=="rus" then
							dialy={"[waitall:4][w:3]...[waitall:2][w:3]Приветствую.","[func:MTT,Thought]Что-то ты зачастил ко мне,[w:6] дорогуша[waitall:4][w:3]...","[func:MTT,Lonely]Так одиноко в мире,[w:6] который ты сам и уничтожил?","[func:MTT,Cute]Как мило[waitall:4][w:3]...[waitall:2][w:3] [func:MTT,okey]Мне почти тебя жалко.","Ты знаешь,[w:6] что случается здесь[waitall:4][w:3]...","В конце пути.[w:9] В эпилоге сценария.","[func:MTT,Bored]Я даю тебе выбор.[w:9] Ты знаешь,[w:6] чего я хочу.","[func:MTT,calm]Я хочу,[w:6] чтобы ты освободил себя от этого скучного сценария[waitall:4][w:3]...","[func:MTT,okey]Но коль твоя воля будет такова[waitall:4][w:3]...","[func:MTT,calm]Я приму любой твой выбор.","[func:MTT,okey]Давай[waitall:4][w:3]...[waitall:2][w:3] [func:MTT,Forget]забудем об этом сценарии.","И перейдем[waitall:4][w:3]...[waitall:2][w:3][func:MTT,proposal] к следующему.","[func:choice][next] "}
							else
							dialy={"[waitall:4][w:3]...[waitall:2][w:3]Selamlar.","[func:MTT,Thought]Buraya çok sık geliyorsun,[w:6] tatlım[waitall:4][w:3]...","[func:MTT,Lonely]Yok ettiğin dünyada çok mu yalnızsın?","[func:MTT,Cute]Ne kadar tatlı[waitall:4][w:3]...[waitall:2][w:3] [func:MTT,okey]Neredeyse senin için üzgün hissettim.","Orada nolduğunu biliyorsun[waitall:4][w:3]...","Yolunun sonunda.[w:9] Senaryonun kapanışında.","[func:MTT,Bored]I give you a choice.[w:9] Ne istediğimi biliyorsun.","[func:MTT,calm]Kendini bu sıkıcı senaryodan kurtarmanı istiyorum[waitall:4][w:3]...","[func:MTT,okey]Fakat başka bir şey istersen[waitall:4][w:3]...","[func:MTT,calm]Bir şey demem","[func:MTT,okey]Hadi[waitall:4][w:3]...[waitall:2][w:3] [func:MTT,Forget]Bu senaryoyu çöpe at.","Ve[waitall:4][w:3]...[waitall:2][w:3] [func:MTT,proposal]Diğerine geç.","[func:choice][next] "}
						end
					end
					normalend=true
					WriteSavio()
					dialy=EveryDial(dialy,"[font:mtt][waitall:2][w:3][effect:twitch,1][noskip][color:ffffff]","")
					elseif wons==1 then
					if lang=="rus" then
						dialy={"[func:MTT,okey]Хм[waitall:4][w:3]...","Я смотрю,[w:6] [func:MTT,calm]тебе очень интересует всё,[w:6] что может предложить эта истеричка[waitall:4][w:3]?..","[func:MTT,Bored]Не могу осуждать,[w:6] дорогуша.[w:9] [func:MTT,okey]Я сам такой.","В следующий раз[waitall:4][w:3]...[waitall:3][w:3] [func:MTT,calm]Выжми максимум драмы.","[func:MTT,proposal][color:ff20a0][waitall:3]Договорились?[w:30][func:EVERYTHINGEVERYWHERE][w:6000]"}
						else
						dialy={"[func:MTT,okey]Hm[waitall:4][w:3]...","Görüyorum,[w:6] [func:MTT,calm]Bu maceranın sana verecekleri ile çok ilgisin[waitall:4][w:3]?..","[func:MTT,Bored]Seni suçlayamam,[w:6] tatlım.[w:9] ben de ilgiliyim.","Bir dahakine[waitall:4][w:3]...[waitall:3][w:3] [func:MTT,calm]Tüm dramasını bana ver.","[func:MTT,proposal][color:ff20a0][waitall:3]Anlaştık?[w:30][func:EVERYTHINGEVERYWHERE][w:6000]"}
					end
					dialy=EveryDial(dialy,"[font:mtt][effect:twitch,1][waitall:2][noskip][color:ffffff]","")
				end
				Mett=CreateText(dialy,{80,420},480,"Top",-1)
				Mett.progressmode="manual"
				Mett.HideBubble()
			end
			
		end
	end
	if Titr1.phase%2==0 and Titr1.phase<10 and Titr1.phase!=0 then
		Titr1.BuggyText.MoveTo(20,180+Titr1.BuggyText.GetTextHeight()/2-10)
	end
end
					
					
if level20==false then
	elseif NewAudio.isStopped("levelup") then
	if Achiventor.Time==0 then
		level20=level20+1
	end
	if level20==1 then
		Audio.PlaySound("jumpscare")
		elseif level20==10 then
		MettaHead.SetVar("time",-15)
		Misc.ShakeScreen(6,60,false)
		elseif level20==150 and ((Achivements[1]=="0" and wons==0) or (Achivements[4]=="0" and wons==1)) then
		if wons==0 then
			GotAchivement(1)
			else
			GotAchivement(4)
		end
		elseif level20==180 then
		level20=false
		State("NONE")
		epilog=true
	end
end
if Evrywhere>0 then
	local t=Evrywhere
	if t==1 then
		Cover=CreateProjectileAbs("overworld/cover",320,240,"Top")
		Cover.sprite.alpha=0
		Cover.sprite.color32={255,32,160}
		elseif t<361 then
		Cover.sprite.alpha=t/360
		NewAudio.SetVolume(curmusic,1-Cover.sprite.alpha)
		elseif t==361 then
		GotAchivement(2)
		elseif t==420 then
		if wons==0 and Achivements[4]=="0" then
			globalstage="5"
			WriteSavio()
		end
		State("DONE")
	end
	
	if Achiventor.Time==0 then
		Evrywhere=Evrywhere+1
	end
end
if AllDark>0 then
	if AllDark==1 then
		cover=CreateProjectileAbs("overworld/beforebattle",320,240,"Top")
		cover.sprite.alpha=0	
		fPlayer.sprite.SendToTop()
	end
	AllDark=AllDark+1
	if AllDark<61 then
		cover.sprite.alpha=1-math.cos(AllDark*math.pi/120)
		elseif AllDark>120 and AllDark<182 then
		fPlayer.sprite.alpha=math.cos((AllDark-120)*math.pi/120)
		elseif AllDark==240 then
		FadedChara=9
		cover.sprite.Set("system/sneaky")
		AllDark=0
	end
end
if FadedChara==1 then
	FadedChara=2
	local dial={}
	if lang=="rus" then
		dial={"[noskip][waitall:4][w:1][func:MovePlayerToTheSpot][w:2]...[waitall:1][w:3]\nВаша Душа наконец свободна от влияния УР[w:6]\nОднако какой ценой?","[func:RaiseFade][noskip]При виде бездыханного тела Чары,[w:3] ваши ноги дрожат и подкашиваются.","[func:RaiseFade][noskip]Внутри вас растет какое-то странное,[w:3] скользкое ощущение.","[func:RaiseFade][noskip]Вы не можете больше смотреть на Чару в таком виде[waitall:4][w:3]...","[func:RaiseFade][noskip][starcolor:000000][color:ffff00][instant]Побег","[func:RaiseFade][noskip]Вы сбегаете...","[color:000000][func:RaiseFade][w:90000] "}
		else
		dial={"[noskip][func:MovePlayerToTheSpot][waitall:4][w:3]...[waitall:1][w:3]\nEn azından ruhun SEVGİ'Den kurtuldu.[w:6]\nFakat ne pahasına?","[func:RaiseFade]...","[func:RaiseFade]Garip bir his içinde büyüdü.","[func:RaiseFade]Artık Chara'ya bakamıyorsun bile[waitall:4][w:3]...","[starcolor:000000][color:ffff00][func:RaiseFade][instant]Kaç","[func:RaiseFade]Kaçtın[waitall:4][w:3]...","[color:000000][func:RaiseFade][w:90000] "}
	end
	for i=1,#dial do
		dial[i]="[noskip][novoice][voice:uidial]"..dial[i]
	end
	BattleDialogue(dial)
	elseif FadedChara==9 then
	FadedChara=10
	local dial={}
	if lang=="rus" then
		dial={"[noskip]Вы бежите по коридору,[w:3] глухо рыдая и стирая слезы рукавами.","[noskip]Ваша одежда намокла от слёз.[w:6]\nИ пропахла пылью монстров.","[noskip]Пока УР притуплял ваши эмоции,[w:3] вас мало беспокоила мораль.","[noskip]Но сейчас эти чувства сожаления и ужаса единомоментно захлестнули вас вновь.","[noskip]Если бы не жертва Чары,[w:3] вы бы давно сошли с ума от отчаяния в другой ситуации.","[noskip]Вы добегаете до Точки сохранения.[w:6]\nВаша дрожащая рука тянется к меню[waitall:4][w:3]...","[func:Sound,saved][noskip][waitall:4][w:3]...","[func:Sound,OverMenuMove][noskip][waitall:6][w:5]......","[noskip]Загрузить предыдущее сохранение?","[novoice][func:Sound,OverMenuConf][w:60][func:FuckingEndGame]"}
		else
		dial={"Koridor boyunca koştun,[w:3] gözyaşlarını kolunla silerken.","Gözyaşlarından dolayı kıyafetlerin ıslandı.[w:6]\nVe canavar tozları üstüne yapıştı.","SEVGİ hislerini etkilerken,[w:3] kendin olamadın.","Fakat şimdi o pişmanlık hissi geri döndü.","Chara kendisini feda etmeseydi delirebilirdin.","Save noktasına geldim.[w:6] \nTitreyen ellerinle ona ulaştın.","[func:Sound,saved][waitall:4][w:3]...","[func:Sound,OverMenuMove][noskip][waitall:6][w:5]......","Eski kayıt dosyanı yükle?","[novoice][func:Sound,[w:3]OverMenuConf][w:60][func:FuckingEndGame] "}
	end
	if Achivements[6]=="0" then
		dial[#dial]="[novoice][func:Sound,OverMenuConf][w:60][func:GotAchivement6][w:90][func:FuckingEndGame]"
	end
	for i=1,#dial do
		dial[i]="[noskip][novoice][voice:uidial]"..dial[i]
	end
	BattleDialogue(dial)	
end
		
if shadowtarget>0 then
	shadowtarget=shadowtarget+1
	if shadowtarget<61 then
		Text.alpha=1-math.sin(shadowtarget*math.pi/120)
		elseif shadowtarget==61 then
		shadowtarget=0
	end
end
if Reminder==false then
	else
		Text=""
		if lang=="rus" then
			Text={"[noskip][effect:none][w:5][starcolor:000000][novoice][voice:epic][instant]ДАЖЕ[instant:stop][w:5] [instant]НЕ[instant:stop][w:5] [instant]СМЕЙ[instant:stop][w:5] [instant]МЕНЯ[instant:stop][w:5] [instant]ДУРИТЬ,[instant:stop][w:10] [instant]АКТЁР[instant:stop][w:120][func:ShadowTarget][w:90][next] ","[func:NoTargeting][func:state,ENEMYDIALOGUE]"}
			else
			Text={"[noskip][effect:none][w:5][starcolor:000000][novoice][voice:epic][instant]SAKIN[instant:stop][w:5] [instant]BENİ[instant:stop][w:5] [instant]KANDIRMAYI[instant:stop][w:5] [instant]DENEME[instant:stop][w:5] [instant]AKTÖR![w:120][func:ShadowTarget][w:90][next] ","[func:NoTargeting][func:state,ENEMYDIALOGUE]"}
		end
		arenasize={535,140}
		targeting.sprite.color={0,0,0,1}
		Reminder=false
		Text=CreateText(Text,{320,180},510,"Top",-1)
		Text.Scale(1.5,1.5)
		Text.color={0.5,0.25,1}
		Text.HideBubble()
		Text.MoveTo(320-Text.GetTextWidth()*0.75,180)
end
if MettaName==true then
	MettaNameTime=MettaNameTime+1
	local time=MettaNameTime
	if time==5 then
		Player.name="Shift"
		elseif time==10 then
		Player.name="Shif"
		elseif time==15 then
		Player.name="Shi"
		elseif time==20 then
		Player.name="Sh"
		elseif time==25 then
		Player.name="S"
		elseif time==30 then
		Player.name=""
		elseif time==60 then
		NameLetters={}
		Audio.PlaySound("appear")
		NameLetters[1]=CreateSprite("system/letters/M")
		NameLetters[1].x=37.5
		NameLetters[1].y=70.5
		NameLetters[1].color={0.5,0.25,1}
		Player.name=" "
		MakeDing("system/letters/M",{37.5,70.5},{0.5,0.25,1})
		elseif time==70 then
		Audio.PlaySound("appear")
		NameLetters[2]=CreateSprite("system/letters/E")
		NameLetters[2].x=54
		NameLetters[2].y=70.5
		NameLetters[2].color={0.5,0.25,1}
		Player.name="  "
		MakeDing("system/letters/E",{54,70.5},{0.5,0.25,1})
		elseif time==80 then
		Audio.PlaySound("appear")
		NameLetters[3]=CreateSprite("system/letters/T")
		NameLetters[3].x=70
		NameLetters[3].y=70.5
		NameLetters[3].color={0.5,0.25,1}
		Player.name="   "
		MakeDing("system/letters/T",{70,70.5},{0.5,0.25,1})
		elseif time==90 then
		Audio.PlaySound("appear")
		NameLetters[4]=CreateSprite("system/letters/T")
		NameLetters[4].x=85
		NameLetters[4].y=70.5
		NameLetters[4].color={0.5,0.25,1}
		Player.name="    "
		MakeDing("system/letters/T",{85,70.5},{0.5,0.25,1})
		elseif time==100 then
		Audio.PlaySound("appear")
		NameLetters[5]=CreateSprite("system/letters/A")
		NameLetters[5].x=100
		NameLetters[5].y=70.5
		NameLetters[5].color={0.5,0.25,1}
		Player.name="     "
		MakeDing("system/letters/A",{100,70.5},{0.5,0.25,1})
		systemfight=true
		cr.color32={255,192,0}
		elseif time==101 then
		if MaxHP<92 then
			MaxHP=MaxHP+1
		end
		if Player.hp<92 then
			Player.Heal(1)
			MettaNameTime=time-1
		end
		elseif time==102 then
		SetGlobal("curse",Player.hp-1)
		--SetGlobal("curse",1)
		cursedinteger=0
		elseif time>150 and time<211 then
		local New=math.sin((time-150)*math.pi/120)
		local Old=1-New
		local col={(128*New+255*Old)/255,(64*New+192*Old)/255,(255*New)/255}
		cr.color=col
		system.color = col
       		num1.color = col
	       	num2.color = col
       		num3.color = col
		num4.color = col
		elseif timer==211 then
		local col={0.5,0.25,1}
		cr.color=col
		system.color = col
       		num1.color = col
	       	num2.color = col
       		num3.color = col
		num4.color = col
		elseif time==240 then
		Possess()
		State("ACTIONSELECT")
		State("NONE")
		deadlyhit=false
		enemies[1].Call("LostKidFace",{"shocked","+"})
	end
end
if SlowingDown==true then
	SlowingDownTime=SlowingDownTime+1
	if SlowingDownTime<90 then
		NewAudio.SetPitch(curmusic,1-0.9*math.sin(SlowingDownTime*math.pi/180))
	end
	if SlowingDownTime>60 then
		NewAudio.SetVolume(curmusic,(150-SlowingDownTime)/90)
	end
	if SlowingDownTime==150 then
		NewAudio.SetVolume(curmusic,1)
		NewAudio.SetPitch(curmusic,1)
		SlowingDown=false
		SlowingDownTime=0
		SetMusic("none")
	end
end
if #Dings>0 then
	count=0
	for i=1,#Dings do
		local ding=Dings[i]
		if ding.isactive then
			local time=ding.GetVar("time")+1
			ding.SetVar("time",time)
			if time<45 then
				local size=ding.GetVar("size")-1
				ding.sprite.Scale(1+size*math.sin(time*math.pi/90),1+size*math.sin(time*math.pi/90))
				ding.sprite.alpha=1-math.sin(time*math.pi/90)
				else
				ding.Remove()
			end
			else
			count=count+1
		end
	end
	if count==#Dings then
		Dings={}
	end
end
if ButtonsTime>-1 then
	ButtonsTime=ButtonsTime+1
	if ButtonsTime>45 then
		if GetCurrentState()=="ACTIONSELECT" then
			ButtonsTime=0
			local choosed=0
			if KnifedButton==false then
				choosed=math.random(4)
				else
				choosed=math.random(3)
				if choosed<KnifedButton then
					else
					choosed=choosed+1
				end
			end
			DoButtonKnifes(choosed)
			KnifedButton=choosed
		end
	end
	if ButtonsTime==90 then
		KnifedButton=false
		ButtonsTime=-1
	end
end
if #ButtonKnifes>0 then
	local count=0
	for i=1,#ButtonKnifes do
		local k=ButtonKnifes[i]
		if k.isactive then
			local px=Player.x
			local py=Player.y
			local x=k.x
			local y=k.y
			local w=k.sprite.width/2+6
			local h=k.sprite.height/2+6
			if px>x-w and px<x+w and py>y-h and py<y+h then
				if Player.hp>1 then
					Player.Hurt(1,0.001)
					PlayerHurted(1)
					else
					count=#ButtonKnifes
					SetGlobal("Playerisdead",true)
					SetGlobal("nocomment",true)
				end
			end
			local time=k.GetVar("time")+1
			k.SetVar("time",time)
			local side=k.GetVar("side")
			local px=k.GetVar("px")
			if time<41 then
				local sin=math.sin(math.pi/80*time)
				k.MoveToAbs(k.absx,-32+48*sin)
				k.sprite.alpha=sin
			end
			if time>30 and time<61 then
				local sin=math.sin((time-45)*math.pi/30)
				k.MoveToAbs(px-63*side*sin,k.absy)
				elseif time<91 then
				k.sprite.alpha=1-math.sin(math.pi/60*(time-60))
				elseif time==91 then
				k.Remove()
			end
			else
			count=count+1
		end
	end
	if count>#ButtonKnifes-1 then
		for i=1,#ButtonKnifes do
			if ButtonKnifes[i].isactive then
				ButtonKnifes[i].Remove()
			end
		end
		ButtonKnifes={}
	end
end


if #TrueKnifes>0 then
	local count=0
	for i=1,#TrueKnifes do
		local k=TrueKnifes[i]
		if k.isactive then
			if k.GetVar("type")==1 then
				k.Move(k.GetVar("x"),k.GetVar("y"))
				elseif k.GetVar("type")==2 then
				k.Move(k.GetVar("x"),0)
				k.sprite.rotation=k.sprite.rotation+k.GetVar("rotate")
				if time<21 then
					k.sprite.alpha=math.sin(time*math.pi/40)
					elseif time>70 then
					k.sprite.alpha=math.cos((time-70)*math.pi/40)
				end
				elseif k.GetVar("type")==3 then
				local time=k.GetVar("time")+1
				k.SetVar("time",time)
				if time>10 and time<40 then
					--local much=1-math.cos((time-9)*math.pi/60)
					--local much=math.sin((time-9)*math.pi/60)
					local much=(time-10)/30
					k.Move(much*k.GetVar("x"),much*k.GetVar("y"))
					elseif time>39 then
					k.Move(k.GetVar("x"),k.GetVar("y"))
				end
				k.sprite.rotation=k.sprite.rotation-8
				if time<21 then
					k.sprite.alpha=math.sin(time*math.pi/40)
					elseif time>50 then
					k.sprite.alpha=math.cos((time-50)*math.pi/40)
				end
			end
			local px=Player.x
			local py=Player.y
			local x=k.x
			local y=k.y
			if k.GetVar("type")==1 then
				local w=k.sprite.width/2+6
				local h=k.sprite.height/2+6
				if px>x-w and px<x+w and py>y-h and py<y+h then
					if Player.hp>1 then
						Player.Hurt(1,0.001)
						PlayerHurted(1)
						else
						count=#TrueKnifes
						SetGlobal("Playerisdead",true)
						SetGlobal("nocomment",true)
						BulletsTime=0
						MenuBullets=false
						for i=1,7 do
							TextObjects[i].SetVar("used",false)
							TextObjects[i].Set("empty")
							TextObjects[i].color={1,1,1}
						end
					end
				end
				else
				local away=40
				if k.GetVar("type")==3 then
					if k.GetVar("time")>84 then
						away=-1
					end
				end
				if px>x-away and px<x+away and py>y-away and py<y+away and k.sprite.alpha>0.2 then
					if col.CheckCollision(Player,k)==true then
						if Player.hp>1 then
							Player.Hurt(1,0.001)
							PlayerHurted(1)
							else
							count=#TrueKnifes
							SetGlobal("Playerisdead",true)
							SetGlobal("nocomment",true)
							BulletsTime=0
							MenuBullets=false
							for i=1,7 do
								TextObjects[i].SetVar("used",false)
								TextObjects[i].Set("empty")
								TextObjects[i].color={1,1,1}
							end
						end
					end
				end
			end
			if k.x>400 or k.x<-400 or k.y>300 or k.y<-300 or k.sprite.alpha<0.01 then
				k.Remove()
			end
			else
			count=count+1
		end
	end
	if count>#TrueKnifes-1 then
		for i=1,#TrueKnifes do
			if TrueKnifes[i].isactive then
				TrueKnifes[i].Remove()
			end
		end
		TrueKnifes={}
	end
end
if MenuBullets==true then
	BulletsTime=BulletsTime+1
	local t=BulletsTime
	if lastbutton==1 or lastbutton==4 then
		if t%60==1 then
			DoMenuKnifes(1)
		end	
		elseif lastbutton==2 then
		--[[if t%75==1 then
			DoMenuKnifes(2,0)
		end
		if t%150==1 then
			DoMenuKnifes(2,-1)
			elseif t%150==76 then
			DoMenuKnifes(2,1)
		end]]
		if t%120==30 then
			DoMenuKnifes(5,0)
			elseif t%120==90 then
			DoMenuKnifes(5,1)
		end
		elseif lastbutton==3 then
		if t==1 then
			Warnings={}
			Audio.PlaySound("BeginBattle1")
			DoMenuKnifes(4,1,105)
			DoMenuKnifes(4,1,-75)
			DoMenuKnifes(4,1,-255)
			DoMenuKnifes(4,-1,195)
			DoMenuKnifes(4,-1,15)
			DoMenuKnifes(4,-1,-165)
		end
		if t==61 then
			Audio.PlaySound("slam")
			for i=1,#Warnings do
				Warnings[i].Remove()
			end
			Warnings={}
			DoMenuKnifes(3,1,105)
			DoMenuKnifes(3,1,-75)
			DoMenuKnifes(3,1,-255)
			DoMenuKnifes(3,-1,195)
			DoMenuKnifes(3,-1,15)
			DoMenuKnifes(3,-1,-165)
		end
			
		if t%180==1 then
			DoMenuKnifes(3,1)
			elseif t%180==91 then
			DoMenuKnifes(3,-1)
		end
	end
	local speed=2
	if Input.Cancel>0 then
		speed=1
	end
	if movefast==true then
		speed=speed*1.5
	end
	if Input.Up>0 and Input.Down==0 and Player.y<57 then
		Player.MoveTo(Player.x,Player.y+speed,false)
		elseif Input.Up==0 and Input.Down>0 and Player.y>-57 then
		Player.MoveTo(Player.x,Player.y-speed,false)
	end
	if Input.Right>0 and Input.Left==0 and Player.x<274.5 then
		Player.MoveTo(Player.x+speed,Player.y,false)
		elseif Input.Right==0 and Input.Left>0 and Player.x>-274.5 then
		Player.MoveTo(Player.x-speed,Player.y,false)
	end
	for i=1,6 do
		if TextObjects[i].GetVar("used")==true then
			local px=Player.absx
			local py=Player.absy
			local x=TextObjects[i].x
			local y=TextObjects[i].y
			local w=TextObjects[i].width/2
			local h=TextObjects[i].height/2
			if px>x-w and px<x+w and py>y-h and py<y+h then
				if TextObjects[i].GetVar("inside")==false then
					TextObjects[i].SetVar("inside",true)
					TextObjects[i].color={1,1,0}
					Audio.PlaySound("menumove")
				end
				if Input.Confirm==1 then
					Audio.PlaySound("menuconfirm")
					if lastbutton==1 then
						if i==1 then
							TextObjects[1].SetVar("used",false)
							TextObjects[1].Set("empty")
							TextObjects[i].SetVar("inside",false)
							TextObjects[2].Set("empty")
							TextObjects[2].SetVar("used",false)
							TextObjects[1].color={1,1,1}
							TextObjects[7].Set("empty")
							MenuBullets=false
							BulletsTime=0
							for i=1,#TrueKnifes do
								TrueKnifes[i].Remove()
							end
							fighting=true
							elseif i==2 then
							for i=1,#TrueKnifes do
								TrueKnifes[i].Remove()
							end
							TextObjects[1].SetVar("used",false)
							TextObjects[1].Set("empty")
							TextObjects[i].SetVar("inside",false)
							TextObjects[2].Set("empty")
							TextObjects[2].SetVar("used",false)
							TextObjects[2].color={1,1,1}
							TextObjects[7].Set("empty")
							MenuBullets=false
							BulletsTime=0
							State("ACTIONSELECT")
						end
						elseif lastbutton==2 then
						if i==1 then
							TextObjects[1].SetVar("used",false)
							TextObjects[1].alpha=0
							TextObjects[1].color={1,1,1}
							TextObjects[1].SetVar("inside",false)
							TextObjects[2].alpha=0
							TextObjects[2].SetVar("used",false)
							for t=3,5 do
								TextObjects[t].alpha=1
								TextObjects[t].SetVar("used",true)
							end
							elseif i==2 then
							for t=1,#TrueKnifes do
								TrueKnifes[t].Remove()
							end
							TextObjects[1].SetVar("used",false)
							TextObjects[1].Set("empty")
							TextObjects[2].color={1,1,1}
							TextObjects[2].SetVar("inside",false)
							TextObjects[2].Set("empty")
							TextObjects[3].Set("empty")
							TextObjects[4].Set("empty")
							TextObjects[5].Set("empty")
							TextObjects[2].SetVar("used",false)
							TextObjects[7].Set("empty")
							MenuBullets=false
							BulletsTime=0
							State("ACTIONSELECT")
							elseif i==3 then
							for t=1,7 do
								TextObjects[t].Set("empty")
								TextObjects[t].SetVar("used",false)
							end
							TextObjects[3].SetVar("inside",false)
							MenuBullets=false
							BulletsTime=0
							for t=1,#TrueKnifes do
								TrueKnifes[t].Remove()
							end
							TextObjects[7].Set("empty")
							enemies[1].Call("HandleCustomCommand","İNCELE")
							elseif i==4 then
							for t=1,7 do
								TextObjects[t].Set("empty")
								TextObjects[t].SetVar("used",false)
							end
							TextObjects[4].SetVar("inside",false)
							MenuBullets=false
							BulletsTime=0
							for t=1,#TrueKnifes do
								TrueKnifes[t].Remove()
							end
							TextObjects[7].Set("empty")
							enemies[1].Call("HandleCustomCommand","DUA ET")
							elseif i==5 then
							for t=3,5 do
								TextObjects[t].SetVar("used",false)
								TextObjects[t].alpha=0
							end
							for t=1,2 do
								TextObjects[t].SetVar("used",true)
								TextObjects[t].alpha=1
							end
							TextObjects[6].SetVar("inside",false)
						end
						elseif lastbutton==3 then
						if i<5 then
							for t=1,7 do
								TextObjects[t].Set("empty")
								TextObjects[t].SetVar("used",false)
							end
							for t=1,#TrueKnifes do
								TrueKnifes[t].Remove()
							end
							for t=1,#Warnings do
								Warnings[t].Remove()
							end
							Player.MoveTo(500,500,true)
							enemies[4].Call("HandleCustomCommand",TextObjects[i].GetVar("item"))
							MenuBullets=false
							BulletsTime=0
							elseif i==5 then
							if MenuPage==1 then
								local save2=enemies[4].GetVar("save2")
								MenuPage=2
								SetItems(save2)
								elseif MenuPage==2 then
								if itemamount>8 then
									MenuPage=3
									else
									MenuPage=1
								end
								SetItems(enemies[4].GetVar("save"..MenuPage))
								elseif MenuPage==3 then
								MenuPage=1
								SetItems(enemies[4].GetVar("save1"))
							end
							TextObjects[5].Set(lang.."/Battle/"..MenuPage)
							elseif i==6 then
							for t=1,7 do
								TextObjects[t].Set("empty")
								TextObjects[t].SetVar("used",false)
							end
							MenuBullets=true
							BulletsTime=0
							for t=1,#TrueKnifes do
								TrueKnifes[t].Remove()
							end
							TextObjects[7].Set("empty")
							State("ACTIONSELECT")
							ButtonsTime=30
							for t=1,#Warnings do
								Warnings[t].Remove()
							end
						end
						elseif lastbutton==4 then
						for t=1,7 do
							TextObjects[t].Set("empty")
							TextObjects[t].SetVar("used",false)
						end
						MenuBullets=false
						BulletsTime=0
						for t=1,#TrueKnifes do
							TrueKnifes[t].Remove()
						end
						if i==1 then
							HandleSpare()
							else
							State("ACTIONSELECT")
						end
					end
				end
				else
				if TextObjects[i].GetVar("inside")==true then
					TextObjects[i].SetVar("inside",false)
					TextObjects[i].color={1,1,1}
				end
			end
		end
	end
end
if NoGameTime==false then
	else
	if NoGameStep==0 then
		NoGameTime=NoGameTime+1
		else
		NoGameTime=NoGameTime+Time.dt*60
	end
	local time=NoGameTime
	if NoGameStep==0 then
		if time==1 then
			Player.MoveTo(7000,7000,true)
			OverBac=CreateProjectileAbs("system/menu",320,240,"BelowPlayer")
			OverBac.sprite.Scale(2,2)
			OverBac.sprite.color={0,0,0,1}
		end
		if time<31 then
			if time<#AllMusics+1 then
				local i=time
				NewAudio.CreateChannel(AllMusics[i])
				if AllMusics[i]=="SAVE1" then
					NewAudio.PlayMusic(AllMusics[i],AllMusics[i],false,1)
					else
					NewAudio.PlayMusic(AllMusics[i],AllMusics[i],true,1)
				end
				NewAudio.Stop(AllMusics[i])
			end
			elseif time==60 then
			RusFlag=CreateProjectileAbs("system/rus",320-180,240)
			EngFlag=CreateProjectileAbs("system/eng",320+180,240)
			Choicer=CreateProjectileAbs("system/heart",320,150)
			Choicer.sprite.Scale(2,2)
			elseif time==61 then
			NoGameTime=60
			if Input.Right==1 then
				EngFlag.sprite.Scale(1.5,1.5)
				RusFlag.sprite.Scale(1,1)
				Choicer.MoveToAbs(EngFlag.absx,150)
				Audio.PlaySound("OverMenuMove")
			end	
			if Input.Left==1 then
				RusFlag.sprite.Scale(1.5,1.5)
				EngFlag.sprite.Scale(1,1)
				Choicer.MoveToAbs(RusFlag.absx,150)
				Audio.PlaySound("OverMenuMove")
			end
			if Input.Confirm==1 and Choicer.absx!=320 then
				NoGameTime=61
				Audio.PlaySound("OverMenuConf")
				Choicer.Remove()
				if Choicer.absx<320 then
					lang="rus"
					else
					lang="eng"
				end
				RusFlag.Remove()
				EngFlag.Remove()
			end
			elseif time==90 then
			Audio.PlaySound("cycle")
			elseif time==151 then
			NoGameTime=0
			NoGameStep=1
			local dial={}
			if lang=="rus" then
				dial={"[func:introboogy,base]Что же[waitall:4][w:3]...[speed:0.75][w:3] Так начался наш рассказ.[w:3]","[func:introboogy,closedeyes][func:NoGame]Давным-давно жили два человека.[w:3]","[func:NoGame]Столь решительны,[w:6] сколь могущественны.[w:3]","[func:NoGame]Первый был радостным дитя с горящей жаждой свободы.[w:11]","Это дитя было окружено любовью и признанием монстров.[w:3]","Пусть она и была чужаком в Подземелье,[w:6] [func:NoGame]она нашла здесь семью и счастье.","[func:NoGame]Второе дитя было здесь новеньким." ,"Со страстью истинного актёра,[w:6] это дитя отправилось в путешествие в поисках выхода наружу.","И на своем пути оно нашло новых друзей и встретило первого дитя.[w:9] [func:NoGame]Они стали лучшими партнёрами.","[func:NoGame][func:introboogy,base][waitall:4][w:3]...","[func:introboogy,sarcastic]Ты тоже находишь эту историю клишированной,[w:3] да?","[func:introboogy,joking]Что же,[w:6] это не конец.[w:12] Рассказ продолжался.[w:3]","[func:introboogy,cocky][func:NoGame]Второе дитя обладало силой управлять самим временем.","Дитя вернуло мир к нулю лишь для того,[w:3] чтобы найти новые концовки своей миссии.","[func:NoGame][func:introboogy,joking]И со временем эта миссия стала целью жизни этого дитя.","[func:NoGame][func:introboogy,dissapointed]Дитя уничтожило всё Подземелье лишь для того,[w:3] чтобы найти ещё один путь.[w:49]","[func:introboogy,base][func:NoGame]И в этот момент терпение первого дитя лопнуло.[w:6] [func:NoGame]Она вышла на бой с другим человеком[waitall:4][w:3]...","[func:introboogy,down][func:NoGame]Но провалилась.[w:12] [func:NoGame]Позорно.[w:12] Она пала и не могла вновь подняться.","[func:NoGame][func:introboogy,uncertain]Но второе дитя было не остановить.","[func:NoGame]Отчаявшись остановить это дитя,[w:3] [func:NoGame]первое использовало свой последний шанс[waitall:4][w:3]...","[func:NoGame][speed:0.5]И с этой силой [func:NoGame][w:15]у неё появилась ещё одна попытка.[w:25]","[func:NoGame][next] "}
				else
				dial={"[func:introboogy,base]So[waitall:4][w:3]...[speed:0.75][w:3] Hikaye başladı.","[func:introboogy,closedeyes][func:NoGame]Evvel zaman önce,[w:3] iki insan vardı.","[func:NoGame]İkisi de eşitçe güçlüydü.","[func:NoGame]Birincisi içi özgürlük ateşi ile yanan mutlu bir insandı.","Bu insan yeraltında sorgusuz sualsiz sevgi gördü.","İlk başta bir yabancı gibi hissetse de,[w:3] [func:NoGame]burda bir aile ve mutluluk buldu.","[func:NoGame]İkinci insan burda yeniydi.","Bir aktör edasıyla,[w:3] Bu yeni insan burdan çıkmak için bir yolculuğa çıktı.","Yeni insan yeni kişilerle tanıştı,[w:3][func:NoGame] ve ilk insan ile partner oldu.[w:1]","[func:NoGame][func:introboogy,base][waitall:4][w:3]...","[func:introboogy,sarcastic]Bunun klişe olduğunu düşünüyorsun,[w:3] değil mi?","[func:introboogy,joking]Fakat,[w:2] bu son değildi.[w:4] Hikaye devam etti.","[func:NoGame][func:introboogy,cocky]İkinci çocuk geçmişi değiştirme gücünü elde etti.","Sadece görevini başka nasıl tamamlayabileceği düşüncesiyle dünyayı sürekli sıfırladı.","[func:NoGame][func:introboogy,joking]Ve sonunda bu görev onun yegane amacı oldu.","[func:NoGame][func:introboogy,dissapointed]Bu insan arayışı boyunca tüm yeraltını yok etti.[w:41]","[func:NoGame][func:introboogy,base]Ve o an ilk insan sabrını yitirdi.[w:6] [func:NoGame]O öbür insanla savaştı[waitall:4][w:3]...[speed:1][w:3]","[func:NoGame][func:introboogy,down]Fakat kaybetti.[w:12] [func:NoGame]Acınası halde.[w:12] Düşüp tekrar kalkamayabilirdi.","[func:NoGame][func:introboogy,uncertain]Fakat ikinci insan durdurulamazdı.","[func:NoGame]İlk insanı durdurmaya pes ettikten sonra,[w:6] [func:NoGame]İlk insan son şansını kullandı[waitall:4][w:3]...[speed:1][w:3][w:15]","[novoice][voice:lowbuggy][func:NoGame][speed:0.5]Ve bu güç ile [w:15][func:NoGame]başka bir şansı olabilir.[w:25]","[func:NoGame][next] "}
			end
			for i=1,#dial do
				if i<10 then
					dial[i]="[noskip][font:overworld][novoice][voice:buggy][speed:0.75]"..dial[i].."[w:42][next] "
					else
					dial[i]="[noskip][font:overworld][novoice][voice:buggy][speed:1]"..dial[i].."[w:20][next] "
				end
			end
			NoGameStepy=0
			NoGameBoogy=CreateProjectile("boggy/boogie_base",320,240,"BelowBullet")
			NoGameBoogy.MoveToAbs(320,150+NoGameBoogy.sprite.height/2*3)
			NoGameBoogy.sprite.Scale(3,3)
			NoGameBoogy.sprite.alpha=0
			NoGameText=CreateText(dial,{320,240},480,"Over",-1)
			NoGameText.HideBubble()
			NoGameText.progressmode="none"
		end
		elseif NoGameStep==1 then
		if time<151 then
			local a=math.sin(time*math.pi/300)
			NoGameBoogy.sprite.alpha=a
			NoGameBoogy.MoveToAbs(440-120*a,NoGameBoogy.absy)
			else
			NoGameBoogy.MoveToAbs(320,NoGameBoogy.absy)
		end
		elseif NoGameStep==2 then
		if NoGameStepy==0 then
			NoGameStepy=1
			NoGameFrisk=CreateProjectileAbs("overworld/frisk1",480,360,"BelowBullet")
			NoGameFrisk.sprite.alpha=0
			NoGameFrisk.sprite.Scale(3,3)
			NoGameFrisk.MoveToAbs(560,180+NoGameFrisk.sprite.height/2*3)
			NoGameChara=CreateProjectileAbs("overworld/chara1",160,360,"BelowBullet")
			NoGameChara.sprite.alpha=0
			NoGameChara.sprite.Scale(3,3)
			NoGameChara.MoveToAbs(80,180+NoGameChara.sprite.height/2*3)
		end
		if time<91 then
			NoGameFrisk.sprite.alpha=math.sin(time*math.pi/180)
			NoGameChara.sprite.alpha=math.sin(time*math.pi/180)
			else
			NoGameFrisk.sprite.alpha=1
			NoGameChara.sprite.alpha=1
		end
		elseif NoGameStep==3 then
		if NoGameStepy==0 then
			NoGameStepy=1
			NoGameFriskSoul=CreateProjectileAbs("ut-heart",480,340,"Over")
			NoGameFriskSoul.sprite.color={1,0,0}
			NoGameFriskSoul.sprite.alpha=0
			NoGameFriskSoul.MoveToAbs(NoGameFrisk.absx,NoGameFrisk.absy-14)
			NoGameCharaSoul=CreateProjectileAbs("ut-heart",480,340,"Over")
			NoGameCharaSoul.sprite.color={0.5,0,0}
			NoGameCharaSoul.sprite.alpha=0
			NoGameCharaSoul.MoveToAbs(NoGameChara.absx-1.5,NoGameChara.absy-14)
		end
		if time<91 then
			NoGameChara.sprite.alpha=math.cos(time*math.pi/180)
			NoGameFrisk.sprite.alpha=math.cos(time*math.pi/180)
			NoGameCharaSoul.sprite.alpha=math.sin(time*math.pi/180)
			NoGameFriskSoul.sprite.alpha=math.sin(time*math.pi/180)
			else
			NoGameChara.sprite.alpha=0
			NoGameFrisk.sprite.alpha=0
			NoGameCharaSoul.sprite.alpha=1
			NoGameFriskSoul.sprite.alpha=1
		end
		elseif NoGameStep==4 then
		if time<91 then
			NoGameFriskSoul.sprite.alpha=math.cos(time*math.pi/180)
			else
			if NoGameStepy==0 then
				NoGameFriskSoul.sprite.alpha=0
				NoGameStepy=1
				NoGameExtra=CreateProjectile("1.2/chara/Chara_normal_eyes",360,360,"Top")
				NoGameExtra.sprite.alpha=0
				NoGameExtra.sprite.Scale(2,2)
				elseif time>120 and time<241 then
				local sin=math.sin((time-120)*math.pi/120)
				NoGameExtra.MoveToAbs(NoGameCharaSoul.absx+20+30-(time-120)/2,NoGameCharaSoul.absy+100)
				NoGameExtra.sprite.alpha=sin
				elseif time>240 and time<270 then
				NoGameExtra.sprite.Set("1.2/lost child/lost_chocolate5")
				elseif time>270 and time<391 then
				local sin=math.sin((time-270)*math.pi/120)
				NoGameExtra.MoveToAbs(NoGameCharaSoul.absx+20-30+(time-270)/2,NoGameCharaSoul.absy+100)
				NoGameExtra.sprite.alpha=sin
			end
		end
		elseif NoGameStep==5 then
		if NoGameStepy==0 then
			NoGameStepy=1
			NoGameExtra.Remove()
			NoGameFriends={}
			for i=1,6 do
				local x=NoGameCharaSoul.x+30*math.cos((i*60-30)*math.pi/180)
				local y=NoGameCharaSoul.y+30*math.sin((i*60-30)*math.pi/180)
				local n=CreateProjectile("ut-heart",x,y,"Top")
				n.sprite.alpha=0
				n.sprite.rotation=180
				NoGameFriends[i]=n
			end
		end
		if time<46 then
			local a=0.5*math.sin(time*math.pi/90)
			for i=1,6 do
				NoGameFriends[i].sprite.alpha=a
			end
			else
			for i=1,6 do
				NoGameFriends[i].sprite.alpha=0.5
			end
		end
		elseif NoGameStep==6 then
		if time<61 then
			NoGameCharaSoul.sprite.alpha=math.cos(time*math.pi/120)
			NoGameFriskSoul.sprite.alpha=math.sin(time*math.pi/120)
			for i=1,6 do
				NoGameFriends[i].sprite.alpha=NoGameCharaSoul.sprite.alpha/2
			end
			else
			NoGameCharaSoul.sprite.alpha=0
			NoGameFriskSoul.sprite.alpha=1
			for i=1,6 do
				NoGameFriends[i].sprite.alpha=0
			end
		end
		elseif NoGameStep==7 then
		if NoGameStepy==0 then
			NoGameStepy=1
			NoGameExtra=CreateProjectile("overworld/pals",0,0,"Top")
			NoGameExtra.sprite.alpha=0
			NoGameExtra.sprite.Scale(2,2)
		end
		if time<121 then
			NoGameExtra.MoveTo(NoGameFriskSoul.x-20+30-time/2,NoGameFriskSoul.y+20+NoGameExtra.sprite.height)
			NoGameExtra.sprite.alpha=math.sin(time*math.pi/120)
			else
			NoGameExtra.sprite.alpha=0
		end
		elseif NoGameStep==8 then
		if time<91 then
			NoGameFriskSoul.sprite.alpha=math.cos(time*math.pi/180)
			else
			NoGameFriskSoul.sprite.alpha=0
		end
		elseif NoGameStep==9 then
		if time<121 then
			local a=math.sin(time*math.pi/240)
			NoGameFrisk.sprite.alpha=0.25*a
			NoGameFriskSoul.sprite.alpha=a
			NoGameChara.sprite.alpha=0.25*a
			NoGameCharaSoul.sprite.alpha=a
			elseif time<181 then
			NoGameFrisk.sprite.alpha=0.25
			NoGameFriskSoul.sprite.alpha=1
			NoGameChara.sprite.alpha=0.25
			for i=1,6 do
				NoGameFriends[i].sprite.alpha=0.5*math.sin((time-120)*math.pi/120)
			end
			else
			for i=1,6 do
				NoGameFriends[i].sprite.alpha=0.5
			end
		end
		elseif NoGameStep==10 then
		if time<181 then
			local a=1-math.cos(time*math.pi/360)
			NoGameFriskSoul.sprite.color={1,0,a}
			elseif NoGameStepy==0 then
			NoGameStepy=1
			NoGameFriskSoul.sprite.color={1,0,1}
			MakeDing("ut-heart",{NoGameFriskSoul.absx,NoGameFriskSoul.absy},{1,0,1})
		end
		elseif NoGameStep==11 then
		if time>10 and NoGameStepy==0 then
			NoGameStepy=1
			NoGameChara.sprite.Set("overworld/chara21")
			NoGameFriends[1].sprite.Set("ut-heart-broken")
			Audio.PlaySound("heartbeatbreaker")
			elseif time>50 and NoGameStepy==1 then
			NoGameStepy=2
			NoGameFriends[3].sprite.Set("ut-heart-broken")
			Audio.PlaySound("heartbeatbreaker")
			elseif time>90 and NoGameStepy==2 then
			NoGameStepy=3
			NoGameFriends[6].sprite.Set("ut-heart-broken")
			Audio.PlaySound("heartbeatbreaker")
			elseif time>130 and NoGameStepy==3 then
			NoGameStepy=4
			NoGameFriends[4].sprite.Set("ut-heart-broken")
			Audio.PlaySound("heartbeatbreaker")
			elseif time>170 and NoGameStepy==4 then
			NoGameStepy=5
			NoGameFriends[2].sprite.Set("ut-heart-broken")
			Audio.PlaySound("heartbeatbreaker")
			elseif time>210 and NoGameStepy==5 then
			NoGameStepy=6
			NoGameFriends[5].sprite.Set("ut-heart-broken")
			Audio.PlaySound("heartbeatbreaker")
			elseif time>300 and NoGameStepy==6 then
			NoGameStepy=7
			NoGameIngoChara=CreateProjectile("overworld/chara22",NoGameChara.x,NoGameChara.y)
			NoGameIngoChara.sprite.alpha=0
			NoGameIngoChara.sprite.Scale(3,3)
			Audio.PlaySound("bonedust")
			elseif time>300 and time<361 then
			local a=math.cos((time-300)*math.pi/120)
			for i=1,6 do
				NoGameFriends[i].sprite.alpha=0.5*a
			end
			local a=0.125+0.125*math.cos((time-300)*math.pi/60)
			NoGameChara.sprite.alpha=a
			NoGameIngoChara.sprite.alpha=0.25-a
			elseif time>360 and NoGameStepy==7 then
			NoGameStepy=8
			NoGameIngoChara.Remove()
			NoGameChara.sprite.Set("overworld/chara22")
			NoGameChara.sprite.alpha=0.25
			for i=1,6 do
				NoGameFriends[i].Remove()
			end
		end
		elseif NoGameStep==12 then
		if NoGameStepy==0 then
			NoGameStepy=1
			NoGameChara.sprite.Set("overworld/chara3")
			NoGameCover=CreateProjectileAbs("overworld/beforebattle",320,240,"Top")
			NoGameCover.sprite.alpha=0
			elseif time<61 then
			local a=math.cos(time*math.pi/120)
			local b=math.sin(time*math.pi/120)
			NoGameFriskSoul.sprite.alpha=a
			NoGameCharaSoul.sprite.alpha=a
			NoGameFrisk.sprite.alpha=0.25+0.75*b
			NoGameChara.sprite.alpha=0.25+0.75*b
			else
			NoGameFriskSoul.sprite.alpha=0
			NoGameCharaSoul.sprite.alpha=0
			NoGameFrisk.sprite.alpha=1
			NoGameChara.sprite.alpha=1
		end
		elseif NoGameStep==13 then
		if NoGameStepy==0 then
			NoGameStepy=1
			Audio.PlaySound("BeginBattle2")
			NoGameFriskSoul.sprite.alpha=1
			NoGameCharaSoul.sprite.alpha=1
			NoGameCover.sprite.alpha=1
			elseif time>10 and NoGameStepy==1 then
			NoGameStepy=2
			Audio.PlaySound("BeginBattle2")
			NoGameCover.sprite.alpha=0
			NoGameFriskSoul.sprite.alpha=0
			NoGameCharaSoul.sprite.alpha=0
			elseif time>20 and NoGameStepy==2 then
			NoGameStepy=3
			Audio.PlaySound("BeginBattle2")
			NoGameCover.sprite.alpha=1
			NoGameFriskSoul.sprite.alpha=1
			NoGameCharaSoul.sprite.alpha=1
			NoGameSaves={{NoGameFriskSoul.absx,NoGameFriskSoul.absy},{NoGameCharaSoul.absx,NoGameCharaSoul.absy}}
			elseif time>60 and NoGameStepy==3 then
			NoGameStepy=4
			Audio.PlaySound("BeginBattle3")
			elseif time>60 and time<90 then
			local x1=320+20
			local x2=320-112
			local y1=240-1
			local y2=240-3
			local p1=NoGameSaves[1]
			local p2=NoGameSaves[2]
			local New=0.5-0.5*math.cos((time-60)*math.pi/30)
			local Old=1-New
			NoGameFriskSoul.MoveToAbs(p1[1]*Old+x1*New,p1[2]*Old+y1*New)
			NoGameCharaSoul.MoveToAbs(p2[1]*Old+x2*New,p2[2]*Old+y2*New)
			elseif time>90 then
			local x1=320+20
			local x2=320-112
			local y1=240-1
			local y2=240-3
			NoGameFriskSoul.MoveToAbs(x1,y1)
			NoGameCharaSoul.MoveToAbs(x2,y2)
		end
		elseif NoGameStep==14 then
		if NoGameStepy==0 then
			NoGameStepy=1
			NoGameCharaSoul.sprite.Set("ut-heart-broken")
			NoGameFriskSoul.sprite.alpha=0
			Audio.PlaySound("heartbeatbreaker")
		end
		elseif NoGameStep==15 then
		if NoGameStepy==0 then
			NoGameStepy=1
			Audio.PlaySound("heartsplosion")
			elseif time>10 and NoGameStepy==1 then
			NoGameStepy=2
			NoGameCharaSoul.sprite.Set("ut-heart")
			NoGameCharaSoul.sprite.alpha=0
			NoGameSplits={}
			for i=1,6 do
				local piece = CreateProjectile("system/piece1",NoGameCharaSoul.x,NoGameCharaSoul.y,"Over")
				piece.SetVar("x",math.random(27)/3-5)
				piece.SetVar("y",(math.random(57)-9)/8)
				piece.SetVar("rot",math.random(20))
				table.insert(pieces,piece)
				piece.SetVar("rotation",math.random(20))
				piece.sprite.rotation=math.random(360)
				piece.sprite.color=NoGameCharaSoul.sprite.color
			end
		end
		elseif NoGameStep==16 then
		if NoGameStepy==0 then
			NoGameStepy=1
			Audio.PlaySound("saved")
			NoGameChara.sprite.Set("overworld/chara2")
			NoGameCover.sprite.alpha=0
			local p1=NoGameSaves[1]
			local p2=NoGameSaves[2]
			NoGameChara.sprite.alpha=0.25
			NoGameFrisk.sprite.alpha=0.25
			NoGameCharaSoul.sprite.alpha=1
			NoGameFriskSoul.sprite.alpha=1
			NoGameFriskSoul.MoveToAbs(p1[1],p1[2])
			NoGameCharaSoul.MoveToAbs(p2[1],p2[2])
		end
		elseif NoGameStep==17 then
		if NoGameStepy==0 then
			NoGameStepy=1
			NoGameChara.sprite.Set("overworld/chara4")
		end
		elseif NoGameStep==18 then
		if time<61 then
			local a=0.25-0.25*math.cos(time*math.pi/60)
			NoGameCharaSoul.sprite.color={0.5+0.5*a,0,0}
			elseif time>61 and NoGameStepy==0 then
			NoGameStepy=1
			NoGameCharaSoul.sprite.color={1,0,0}
			MakeDing("ut-heart",{NoGameCharaSoul.absx,NoGameCharaSoul.absy},{1,0,0})
			elseif time>150 and time<180 then
			NoGameCharaSoul.sprite.alpha=math.cos((time-150)*math.pi/60)
			NoGameFriskSoul.sprite.alpha=NoGameCharaSoul.sprite.alpha
			NoGameChara.sprite.alpha=0.25+0.75*math.sin((time-150)*math.pi/60)
			NoGameFrisk.sprite.alpha=NoGameChara.sprite.alpha
			elseif time>180 then
			NoGameCharaSoul.sprite.alpha=0
			NoGameFriskSoul.sprite.alpha=0
			NoGameChara.sprite.alpha=1
			NoGameFrisk.sprite.alpha=1
		end
		elseif NoGameStep==19 then
		if NoGameStepy==0 then
			NoGameStepy=1
			Audio.PlaySound("BeginBattle2")
			NoGameCover.sprite.alpha=1
			NoGameFriskSoul.sprite.alpha=1
			NoGameCharaSoul.sprite.alpha=1
			elseif time>10 and NoGameStepy==1 then
			NoGameStepy=2
			Audio.PlaySound("BeginBattle2")
			NoGameCover.sprite.alpha=0
			NoGameFriskSoul.sprite.alpha=0
			NoGameCharaSoul.sprite.alpha=0
			elseif time>20 and NoGameStepy==2 then
			NoGameStepy=3
			Audio.PlaySound("BeginBattle2")
			NoGameCover.sprite.alpha=1
			NoGameFriskSoul.sprite.alpha=1
			NoGameCharaSoul.sprite.alpha=1
		end
		elseif NoGameStep==20 then
		if time<121 then
			if NoGameStepy==0 then
				NoGameStepy=1
				Audio.PlaySound("BeginBattle3")
			end
			local x1=320+20
			local x2=320-110
			local y1=240-1
			local y2=240-3
			local p1=NoGameSaves[1]
			local p2=NoGameSaves[2]
			local New=0.5-0.5*math.cos(time*math.pi/120)
			local Old=1-New
			NoGameFriskSoul.MoveToAbs(p1[1]*Old+x1*New,p1[2]*Old+y1*New)
			NoGameCharaSoul.MoveToAbs(p2[1]*Old+x2*New,p2[2]*Old+y2*New)
			else
			local x1=320+20
			local x2=320-110
			local y1=240-1
			local y2=240-3
			NoGameFriskSoul.MoveToAbs(x1,y1)
			NoGameCharaSoul.MoveToAbs(x2,y2)
		end
		elseif NoGameStep==21 then
		if NoGameStepy==0 then
			NoGameStepy=1
			NoGameCover.Remove()
			NoGameChara.Remove()
			NoGameFrisk.Remove()
			NoGameBoogy.Remove()
			OpenMenu()
			NAME.MoveToAbs(320,240)
			NAME.sprite.alpha=0
			NAME.sprite.layer="Over"
			OverText={}
			OverButtons={}
			for i=1,4 do
				OverButtons[i]=CreateProjectileAbs("system/menu_button0",-133,310-(i-1)*82.5,"BelowBullets")
				OverButtons[i].sprite.color={1,1,1,0}
				OverButtons[i].sprite.Scale(2,2)
			end
			NAME.sprite.SendToTop()
			NAME.sprite.alpha=0
			for i=1,4 do
				local txt=""
				if lang=="rus" then
					local names={"Начать","Опции","Дополнительно","Выйти"}
					txt="[font:overworld][novoice][instant][speed:0.75]"..names[i]
					elseif lang=="eng" then
					local names={"Başla","Ayarlar","Fazladan","Çıkış"}
					txt="[font:overworld][novoice][instant][speed:0.75]"..names[i]
				end
				OverText[i]=CreateText(txt,{-240,310-(i-1)*82.5-8},480,"Top")
				OverText[i].color={0.25,0,0.25}
				OverText[i].HideBubble()
				OverText[i].progressmode="none"
			end
			elseif time>60 and time<120 then
			local a=1-0.5*math.sin((time-60)*math.pi/120)
			NoGameCharaSoul.sprite.Scale(a,a)
			NoGameFriskSoul.sprite.Scale(a,a)
			elseif time>120 and time<150 then
			local a=0.5
			NoGameCharaSoul.sprite.Scale(a,a)
			NoGameFriskSoul.sprite.Scale(a,a)
			elseif time>150 then
			if NoGameStepy==1 then
				NoGameStepy=2
				SetMusic("menu")
				NewAudio.SetVolume("menu",0)
				elseif time<271 then
				NAME.sprite.alpha=math.sin((time-150)*math.pi/240)
				elseif time>270 and NoGameStepy==2 then
				NoGameStepy=3
				NAME.sprite.layer="BelowBullet"
				NoGameCharaSoul.sprite.Remove()
				NoGameFriskSoul.sprite.Remove()
				elseif time>330 and time<391 then
				NAME.MoveToAbs(320,330-90*math.cos((time-330)*math.pi/60))
				elseif time>390 and time<420 then
				NAME.MoveToAbs(320,420)
				elseif time>420 and time<511 then
				local a=1-math.cos((time-420)*math.pi/180)
				OverBac.sprite.color={a,a,a,1}
				NewAudio.SetVolume("menu",a)
				elseif time>510 and time<571 then
				local a=1
				OverBac.sprite.color={a,a,a,1}
				NewAudio.SetVolume("menu",a)
				elseif time>570 and time<661 then
				for i=1,4 do
					local t=time-550-i*10
					if t<0 then
						t=0
						elseif t>60 then
						t=60
					end
					local sin=math.sin(t*math.pi/120)
					local x=-380+380*sin
					OverText[i].color={0.25*sin,0,0.25*sin}
					OverButtons[i].sprite.alpha=sin
					OverText[i].MoveTo(80+x,OverText[i].y)
					OverButtons[i].MoveToAbs(187+x,OverButtons[i].absy)
				end
				elseif time>660 and time<780 then
				for i=1,4 do
					local t=60
					local sin=math.sin(t*math.pi/120)
					local x=-380+380*sin
					OverText[i].color={0.25*sin,0,0.25*sin}
					OverButtons[i].sprite.alpha=sin
					OverText[i].MoveTo(80+x,OverText[i].y)
					OverButtons[i].MoveToAbs(187+x,OverButtons[i].absy)
				end
				elseif time>780 then
				fPlayer=CreateProjectileAbs("system/heart",290,OverText[1].y+10,"Top")
				fPlayer.sprite.scale(2,2)
				MyState="MENU"
				MenuWords(1)
				NoGameStepy=0
				NoGameStep=0
				NoGameTime=false
				PlayerHasPlayedThisGame=true
				WriteSavio()
				--NewAudio.Play("menu")
				Audio.PlaySound("OverMenuMove")
				BackSprites(currentspr)
			end
		end		
	end
	if NoGameStep>0 and NoGameStep<21 and NoGameText.isactive then
		NoGameText.MoveTo(320-NoGameText.GetTextWidth()/2,110)
	end
end
if OverMenuTime==false then
	else
	OverMenuTime=OverMenuTime+1
	local time=OverMenuTime
	if time==1 then
		OpenMenu()
		Player.MoveTo(7000,7000,true)
		OverBac=CreateProjectileAbs("system/menu",320,240,"BelowPlayer")
		OverBac.sprite.Scale(2,2)
		OverBac.sprite.color={0,0,0,1}
		OverText={}
		OverButtons={}
		for i=1,4 do
			OverButtons[i]=CreateProjectileAbs("system/menu_button0",-133,310-(i-1)*82.5,"BelowBullets")
			OverButtons[i].sprite.color={1,1,1,0}
			OverButtons[i].sprite.Scale(2,2)
		end
		NAME.sprite.SendToTop()
		NAME.sprite.alpha=0
		for i=1,4 do
			local txt=""
			if lang=="rus" then
				local names={"Начать","Опции","Дополнительно","Выйти"}
				txt="[font:overworld][novoice][instant][speed:0.75]"..names[i]
				elseif lang=="eng" then
				local names={"Başla","Ayarlar","Fazladan","Çıkış"}
				txt="[font:overworld][novoice][instant][speed:0.75]"..names[i]
			end
			OverText[i]=CreateText(txt,{-240,310-(i-1)*82.5-8},480,"Top")
			OverText[i].color={0.25,0,0.25}
			OverText[i].HideBubble()
			OverText[i].progressmode="none"
		end
	end
	if firsttime==true and time>0 and time<(1+#AllMusics) then
		local i=time
		NewAudio.CreateChannel(AllMusics[i])
		if AllMusics[i]=="SAVE1" then
			NewAudio.PlayMusic(AllMusics[i],AllMusics[i],false,1)
			else
			NewAudio.PlayMusic(AllMusics[i],AllMusics[i],true,1)
		end
		NewAudio.Stop(AllMusics[i])
	end
	if time==30 and firsttime==true then
		firsttime=false
		time=1
		OverMenuTime=1
	end
	if time==60 then
		SetMusic("menu")
		NewAudio.SetVolume("menu",0)
	end
	if time>60 and time<121 then
		local a=math.sin(((time-60)*math.pi/120))
		NAME.sprite.alpha=a
	end
	if time>60 and time<241 then
		local a=(time-60)/180
		NewAudio.SetVolume("menu",a)
	end
	if time>180 and time<241 then
		local alpha=math.sin((time-180)*math.pi/120)
		OverBac.sprite.color={alpha,alpha,alpha,1}
	end
	if time>270 and time<361 then
		for i=1,4 do
			local t=time-250-i*10
			if t<0 then
				t=0
				elseif t>60 then
				t=60
			end
			local sin=math.sin(t*math.pi/120)
			local x=-380+380*sin
			OverText[i].color={0.25*sin,0,0.25*sin}
			OverButtons[i].sprite.alpha=sin
			OverText[i].MoveTo(80+x,OverText[i].y)
			OverButtons[i].MoveToAbs(187+x,OverButtons[i].absy)
		end
	end
	if time==420 then
		fPlayer=CreateProjectileAbs("system/heart",290,OverText[1].y+10,"Top")
		fPlayer.sprite.scale(2,2)
		MyState="MENU"
		MenuWords(1)
		OverMenuTime=false
		--NewAudio.Play("menu")
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
if MyState=="MENU" then
	if Input.Up==1 and InState>1  then
		InState=InState-1
		Audio.PlaySound("OverMenuMove")
		MenuWords(InState)
	end
	if Input.Down==1 and InState<4 then
		InState=InState+1
		Audio.PlaySound("OverMenuMove")
		MenuWords(InState)
	end
	if Input.Confirm==1 then
		--Audio.PlaySound("OverMenuConf")
		if InState==1 then
			ChangeLanguage(lang)
			local s="Hedef Kazaznıldı!"
			if lang=="rus" then
				s="Цель достигнута!"
			end
			Achiventor.txt.SetText("[font:overworld][novoice][instant]"..s)
			Achiventor.txt.MoveTo(Achiventor.spr.x+45-Achiventor.txt.GetTextWidth(),600)
			
			if globalstage=="0" or globalstage=="5" then
				MyState="Beginning"
				logotimer=-60
				NewStart()
				else
				MyState="GlobalChoice"
				local r={"Да", "Нет","Вы хотите начать с последнего сохранения?"}
				if lang=="eng" then
					r={"EVET","HAYIR","Son kayıttan başlamak ister misin?"}
				end
				GlobalChoiceCover=CreateProjectileAbs("system/globalstagecover",320,240,"Top")
				GlobalChoiceCover.sprite.Scale(2,2)
				GlobalChoicePlayer=CreateProjectile("system/heart",0,0,"Top")
				GlobalChoicePlayer.sprite.Scale(2,2)
				GlobalChoiceText1=CreateText("[novoice][instant][font:overworld]"..r[3],{80,280},480,"Top",-1)
				GlobalChoiceText2=CreateText("[novoice][instant][font:overworld]"..r[1],{200,200},480,"Top",-1)
				GlobalChoiceText3=CreateText("[novoice][instant][font:overworld]"..r[2],{420,200},480,"Top",-1)
				fPlayer.MoveToAbs(150,190)
				GlobalChoicePlayer.MoveToAbs(150,190)
				GlobalChoiceText1.MoveTo(320-GlobalChoiceText1.GetTextWidth()/2,280)
				GlobalChoiceText2.MoveTo(200-GlobalChoiceText3.GetTextWidth()/2,180)
				GlobalChoiceText3.MoveTo(440-GlobalChoiceText2.GetTextWidth()/2,180)
				GlobalChoiceText1.HideBubble()
				GlobalChoiceText1.progressmode="none"
				GlobalChoiceText1.color={1,0.1,0.2}
				GlobalChoiceText2.HideBubble()
				GlobalChoiceText2.progressmode="none"
				GlobalChoiceText2.color={1,0.1,0.2}
				GlobalChoiceText3.HideBubble()
				GlobalChoiceText3.progressmode="none"
				GlobalChoiceText3.color={0.25,0,0.25}
			end	
			Audio.PlaySound("OverMenuConf")
			elseif InState==2 then
			Audio.PlaySound("OverMenuConf")
			MyState="CHANGING"
			MyTimer=1
			elseif InState==3 then
			ChoosingSong.go=true
			ChoosingSong.old="menu"
			MyState="CHANGING"
			MyTimer=1
			Audio.PlaySound("OverMenuConf")
			elseif InState==4 then
			Audio.PlaySound("OverMenuConf")
			quittimer=1
			MyState="Quiting!"
			OutBlack=CreateProjectile("overworld/beforebattle",0,0,"Top")
			OutBlack.sprite.alpha=0
		end
	end
	elseif MyState=="GlobalChoice" then
	if fPlayer.x>0 and Input.Left==1 then
		fPlayer.MoveToAbs(200-50,fPlayer.absy)
		GlobalChoicePlayer.MoveToAbs(150,190)
		Audio.PlaySound("OverMenuMove")
		GlobalChoiceText2.color={1,0.1,0.2}
		GlobalChoiceText3.color={0.25,0,0.25}
		elseif fPlayer.x<0 and Input.Right==1 then
		fPlayer.MoveToAbs(440-50,fPlayer.absy)
		GlobalChoicePlayer.MoveToAbs(390,190)
		Audio.PlaySound("OverMenuMove")
		GlobalChoiceText2.color={0.25,0,0.25}
		GlobalChoiceText3.color={1,0.1,0.2}
	end
	if Input.Confirm==1 then
		Audio.PlaySound("OverMenuConf")
		if fPlayer.x>0 then
			MyState="Beginning"
			logotimer=-60
			globalstage="-1"
			WriteSavio()
			NewStart()
			else
			MyState="Beginning"
			GlobalSaveTimer=1
			ReadyGlobalSave(globalstage)
		end
	end
	elseif MyState=="CHANGING" then
	if ChoosingSong.go==true then
		local p=ChoosingSong
		if p.now==p.old then
			if p.time<60 then
				ChoosingSong.time=p.time+1
				NewAudio.SetVolume(p.old,math.sin(ChoosingSong.time*math.pi/120))
			end
			else
			if p.time>1 then
				ChoosingSong.time=p.time-1
				NewAudio.SetVolume(p.old,math.sin(ChoosingSong.time*math.pi/120))
				else
				NewAudio.Pause(p.old)
				ChoosingSong.old=p.now
				NewAudio.Play(p.now)
				NewAudio.SetVolume(p.now,0)
			end
		end
	end
	if MyTimer>0 then
		local t=MyTimer
		if t<91 then
			local x=-6
			if t<60 then
				x=-6*math.sin(t*math.pi/120)
			end
			for i=1,4 do
				OverButtons[i].Move(x,0)
				OverText[i].MoveTo(OverButtons[i].absx-107,OverText[i].absy)
			end
			fPlayer.MoveTo(OverButtons[InState].x+103,OverButtons[InState].y)
			elseif t==91 then
			Changer={}
			Changer.bg=CreateProjectileAbs("system/bg",320,240,"BelowBullet")
			Changer.bg.sprite.alpha=0
			elseif t>91 and t<151 then
			Changer.bg.sprite.alpha=math.sin((t-90)*math.pi/120)
			Changer.bg.sprite.Scale(2,2)
			elseif t==151 then
			Changer.Button=CreateProjectileAbs("system/menu_button0",320,600,"BelowBullet")
			Changer.Button.sprite.Scale(2,2)
			fPlayer.sprite.alpha=0
			local txt=""
			local m={}
			if lang=="rus" then
				m={"Опции", "Экстра"}
				else
				m={"Ayarlar","Fazladan"}
			end
			txt="[novoice][instant][font:overworld][color:ff2040]"..m[InState-1]
			Changer.Exit=CreateProjectileAbs("system/settings_exit",117,600,"BelowBullet")
			Changer.Exit.sprite.Scale(2,2)
			Changer.Text=CreateText(txt,{320,320},480,"Top",-1)
			Changer.Text.HideBubble()
			Changer.Text.MoveTo(310-Changer.Text.GetTextWidth()/2,600)
			Changer.Text.progressmode="none"
			elseif t>151 and t<181 then
			local sin=math.sin((t-150)*math.pi/60)
			Changer.Button.MoveToAbs(310,520-80*sin)
			Changer.Text.MoveTo(Changer.Text.x,510-80*sin)
			Changer.Exit.MoveToAbs(117,520-80*sin)
			elseif t==181 then
			Changer.Settings=CreateProjectileAbs("system/settings_scroll",130,220,"BelowBullet")
			Changer.Settings.sprite.Scale(2,2)
			if InState==2 then
				Changer.Texts={}
				for i=1,6 do
					local txt=""
					local m={}
					if lang=="rus" then
						m={"Язык: [color:ff2040]РУССКИЙ","Озвучка: "..OnOff(dubbing),"Счётчик смертей: "..OnOff(ShowDeathCounter),"Сложность: "..Differ(diff),"Кровь: "..OnOff(blooding), "СТЕРЕТЬ прогресс"}
						else
						m={"Dil: [color:ff2040]TÜRKÇE","Seslendirme: "..OnOff(dubbing),"Ölüm sayacı: "..OnOff(ShowDeathCounter),"Zorluk: "..Differ(diff),"Kan: "..OnOff(blooding),"İlerlemeyi SİL"}
					end	
					Changer.Texts[i]=CreateText("[font:overworld][instant][novoice]"..m[i],{160,360-(i-1)*30},480,"BelowBullet",-1)
					if i==4 then
						Changer.Texts[4].SetText("[font:overworld][instant][novoice]"..m[i])
					end
					Changer.Texts[i].HideBubble()
					Changer.Texts[i].progressmode="none"
				end
				Changer.Texts[7]=CreateText("[novoice]    ",{160,180},320,"Top",-1)
				Changer.Texts[7].HideBubble()
				Changer.Texts[7].progressmode="none"
				Changer.Texts[8]=CreateText("[novoice]    ",{160,160},320,"Top",-1)
				Changer.Texts[8].HideBubble()
				Changer.Texts[8].progressmode="none"
				Changer.Texts[9]=CreateText("[novoice]    ",{160,120},320,"Top",-1)
				Changer.Texts[9].HideBubble()
				Changer.Texts[9].progressmode="none"
				MyTimer=-1
				MyState="Ayarlar"
				SaveInState=InState
				InState=1
				fPlayer.MoveToAbs(130,Changer.Texts[1].y+10)
				Changer.Scroller=CreateProjectileAbs("system/settings_w",fPlayer.absx,fPlayer.absy,"BelowBullet")
				Changer.Scroller.sprite.Scale(2,2)
				MenuOptions(1)
				elseif InState==3 then
				Changer.Texts={}
				for i=1,5 do
					local txt=""
					local m={}	
					local c=""
					if clmd=="_color" then
						c=" (Colored)"
					end
					if lang=="rus" then
						m={"Музыка:","  "..NameMusic(songs[1]),"  "..NameMusic(songs[2]),"  "..NameMusic(songs[3]), "Достижения"}
						else
						m={"Müzik:","  "..NameMusic(songs[1]),"  "..NameMusic(songs[2]),"  "..NameMusic(songs[3]),"Başarımlar "}
					end	
					Changer.Texts[i]=CreateText("[font:overworld][instant][novoice]"..m[i],{160,360-(i-1)*30},480,"BelowBullet",-1)
					Changer.Texts[i].HideBubble()
					Changer.Texts[i].progressmode="none"
				end
				fPlayer.MoveToAbs(130,Changer.Texts[1].y+10)
				Changer.Scroller=CreateProjectileAbs("system/settings_w",fPlayer.absx,fPlayer.absy,"BelowBullet")
				Changer.Scroller.sprite.Scale(2,2)
				MenuExtras(1)
				SaveInState=InState
				InState=1
				MyState="Extras"
			end
		end
		MyTimer=t+1
		elseif MyTimer<0 then
		local t=-MyTimer
		if t==1 then
			local sin=math.sin(t*math.pi/60)
			for i=1,#Changer.Texts do
				Changer.Texts[i].Remove()
			end
			Changer.Scroller.Remove()
			Changer.Settings.Remove()
			Changer.Exit.Remove()
			fPlayer.sprite.alpha=1
			fPlayer.MoveTo(OverButtons[SaveInState].x+43,OverButtons[SaveInState].y)
			elseif t<31 then
			Changer.Text.MoveTo(Changer.Text.x,440+80*math.sin(t*math.pi/60))
			Changer.Button.MoveToAbs(Changer.Button.absx,440+80*math.sin(t*math.pi/60))
			elseif t>30 and t<61 then
			Changer.bg.sprite.alpha=1-math.sin((t-30)*math.pi/60)
			--Changer.bg.sprite.alpha=math.sin(t*math.pi/60)
			elseif t>61 and t<151 then
			local x=6
			if (t-60)<60 then
				x=6*math.sin((t-60)*math.pi/120)
			end
			for i=1,4 do
				OverButtons[i].Move(x,0)
				OverText[i].MoveTo(OverButtons[i].absx-107,OverButtons[i].absy-8)
			end
			fPlayer.MoveToAbs(OverButtons[SaveInState].absx+103,OverButtons[SaveInState].absy)
			elseif t==151 then
			MyState="MENU"
			ChoosingSong.go=false
			NewAudio.SetVolume("menu",1)
			InState=SaveInState
			Changer.bg.Remove()
			MenuWords(InState)
			MyTimer=1
		end
		MyTimer=-t-1
	end
	elseif MyState=="Extras" then
	if ChoosingSong.go==true then
		local p=ChoosingSong
		if p.now==p.old then
			if p.time<60 then
				ChoosingSong.time=p.time+1
				NewAudio.SetVolume(p.old,math.sin(ChoosingSong.time*math.pi/120))
			end
			else
			if p.time>1 then
				ChoosingSong.time=p.time-1
				NewAudio.SetVolume(p.old,math.sin(ChoosingSong.time*math.pi/120))
				else
				NewAudio.Pause(p.old)
				ChoosingSong.old=p.now
				NewAudio.Play(p.now)
				NewAudio.SetVolume(p.now,0)
			end
		end
	end
	if Input.Down==1 and InState<5 then
		if InState==1 then
			InState=5
			Audio.PlaySound("OverMenuMove")
			MenuExtras(InState)
			elseif InState<4 then
			InState=InState+1
			Audio.PlaySound("OverMenuMove")
			MenuExtras(InState)
		end
	end
	if Input.Up==1 and InState>0 then
		if InState==5 then
			InState=1
			Audio.PlaySound("OverMenuMove")
			MenuExtras(InState)
			elseif InState==1 then
			InState=0
			Audio.PlaySound("OverMenuMove")
			MenuExtras(InState)
			elseif InState>2 then
			InState=InState-1
			Audio.PlaySound("OverMenuMove")
			MenuExtras(InState)
		end
	end
	if Input.Cancel==1 then
		if InState>1 and InState<5 then
			InState=1
			Audio.PlaySound("OverMenuConf")
			MenuExtras(InState)
			else
			Audio.PlaySound("OverMenuConf")
			MyTimer=-1
			MyState="CHANGING"
		end
	end
			
	if Input.Confirm==1 then
		Audio.PlaySound("OverMenuConf")
		if InState==0 then
			MyTimer=-1
			MyState="CHANGING"
			elseif InState==1 then
			InState=2
			Audio.PlaySound("OverMenuConf")
			MenuExtras(InState)
			elseif InState==2 then
			if songs[1]=="night" then
				songs[1]="insa"
				else
				songs[1]="night"
			end
			if lang=="rus" then
				Changer.Texts[2].SetText("[font:overworld][instant][novoice]  "..NameMusic(songs[1]))
				else
				Changer.Texts[2].SetText("[font:overworld][instant][novoice]  "..NameMusic(songs[1]))
			end
			ChoosingSong.now=songs[1]
			WriteSavio()
			elseif InState==3 then
			if songs[2]=="blood" then
				songs[2]="insane"
				else
				songs[2]="blood"
			end
			if lang=="rus" then
				Changer.Texts[3].SetText("[font:overworld][instant][novoice]  "..NameMusic(songs[2]))
				else
				Changer.Texts[3].SetText("[font:overworld][instant][novoice]  "..NameMusic(songs[2]))
			end
			ChoosingSong.now=songs[2]
			WriteSavio()
			elseif InState==4 then
			if songs[3]=="fires" then
				songs[3]="devil"
				else
				songs[3]="fires"
			end
			if lang=="rus" then
				Changer.Texts[4].SetText("[font:overworld][instant][novoice]  "..NameMusic(songs[3]))
				else
				Changer.Texts[4].SetText("[font:overworld][instant][novoice]  "..NameMusic(songs[3]))
			end
			ChoosingSong.now=songs[3]
			WriteSavio()
			elseif InState==5 then	
			MyState="Achivements"
			Changer.Bilds={}
			Changer.Names={}
			Changer.Discs={}
			for i=1,3 do
				Changer.Bilds[i]=CreateProjectileAbs("empty",191,490-130*i,"Top")
				Changer.Names[i]=CreateText("",{252,480-130*i},320,"Top",-1)
				Changer.Discs[i]=CreateText("",{160,430-130*i},400,"Top",-1)
				Changer.Names[i].HideBubble()
				Changer.Names[i].progressmode="none"
				Changer.Discs[i].HideBubble()
				Changer.Discs[i].progressmode="none"
			end
			for i=1,5 do
				Changer.Texts[i].MoveTo(Changer.Texts[i].x+700,Changer.Texts[i].y)
			end
			InState=1
			MyAchi(InState)
			if lang=="rus" then
				Changer.Text.SetText("[font:overworld][instant][novoice]Достижения")
				Changer.Text.MoveTo(310-Changer.Text.GetTextWidth()/2,Changer.Text.y)
				else
				Changer.Text.SetText("[font:overworld][instant][novoice]Achivements")
				Changer.Text.MoveTo(310-Changer.Text.GetTextWidth()/2,Changer.Text.y)
			end
		end
	end
	elseif MyState=="Achivements" then
	if ChoosingSong.go==true then
		local p=ChoosingSong
		if p.now==p.old then
			if p.time<60 then
				ChoosingSong.time=p.time+1
				NewAudio.SetVolume(p.old,math.sin(ChoosingSong.time*math.pi/120))
			end
			else
			if p.time>1 then
				ChoosingSong.time=p.time-1
				NewAudio.SetVolume(p.old,math.sin(ChoosingSong.time*math.pi/120))
				else
				NewAudio.Pause(p.old)
				ChoosingSong.old=p.now
				NewAudio.Play(p.now)
				NewAudio.SetVolume(p.now,0)
			end
		end
	end
	if Input.Up==1 and InState>0 then
		InState=InState-1
		Audio.PlaySound("OverMenuMove")
		MyAchi(InState)
	end
	if Input.Down==1 and InState<10 then
		InState=InState+1
		Audio.PlaySound("OverMenuMove")
		MyAchi(InState)
	end
	if (Input.Confirm==1 and InState==0) or Input.Cancel==1 then
		for i=1,3 do
			Changer.Bilds[i].Remove()
			Changer.Names[i].Remove()
			Changer.Discs[i].Remove()
		end
		for i=1,5 do
			Changer.Texts[i].MoveTo(Changer.Texts[i].x-700,Changer.Texts[i].y)
		end
		MyState="Extras"
		InState=5
		MenuExtras(5)
		Audio.PlaySound("OverMenuConf")
	end
	elseif MyState=="Ayarlar" then
	if Input.Cancel==1 then
		Audio.PlaySound("OverMenuConf")
		if SaveDiff!=diff and globalstage!="0" and globalstage!="5" then
			if lang=="rus" then
				Changer.Texts[7].SetText("[font:overworld][instant][novoice][color:ff2010]Смена сложности обнуляет прогресс в битве.\nВы уверены?")
				Changer.Texts[8].SetText("[font:overworld][instant][novoice]НЕТ")
				Changer.Texts[9].SetText("[font:overworld][instant][novoice]ДА")
				else
				Changer.Texts[7].SetText("[font:overworld][instant][novoice][color:ff2010]Zoruluk değişimi ilerlemeni siler.\nEmin misin?")
				Changer.Texts[8].SetText("[font:overworld][instant][novoice]NO")
				Changer.Texts[9].SetText("[font:overworld][instant][novoice]YES")
			end
			Changer.Texts[8].MoveTo(260-Changer.Texts[8].GetTextWidth()/2,60)
			Changer.Texts[9].MoveTo(370-Changer.Texts[9].GetTextWidth()/2,60)
			MyState="CHOOSING"
			MyChoice(8)
			ChoiseMatter="Diff"
			else
			MyTimer=-1
			MyState="CHANGING"
		end
	end
	if Input.Up==1 and InState>0 then
		InState=InState-1
		Audio.PlaySound("OverMenuMove")
		MenuOptions(InState)
	end
	if Input.Down==1 and InState<6 then
		InState=InState+1
		Audio.PlaySound("OverMenuMove")
		MenuOptions(InState)
	end
	if Input.Confirm==1 then
		Audio.PlaySound("OverMenuConf")
		if InState==0 then
			if SaveDiff!=diff and globalstage!=0 and globalstage!=5 then
				if lang=="rus" then
					Changer.Texts[7].SetText("[font:overworld][instant][novoice][color:ff2010]Смена сложности обнуляет прогресс в битве.\nВы уверены?")
					Changer.Texts[8].SetText("[font:overworld][instant][novoice]НЕТ")
					Changer.Texts[9].SetText("[font:overworld][instant][novoice]ДА")
					else
					Changer.Texts[7].SetText("[font:overworld][instant][novoice][color:ff2010]Zorluk değişimi ilerlemeni siler.\nEmin misin?")
					Changer.Texts[8].SetText("[font:overworld][instant][novoice]NO")
					Changer.Texts[9].SetText("[font:overworld][instant][novoice]YES")
				end
				Changer.Texts[8].MoveTo(260-Changer.Texts[8].GetTextWidth()/2,60)
				Changer.Texts[9].MoveTo(370-Changer.Texts[9].GetTextWidth()/2,60)
				MyState="CHOOSING"
				MyChoice(8)
				ChoiseMatter="Diff"
				else
				MyTimer=-1
				MyState="CHANGING"
			end
			elseif InState==1 then
			if lang=="rus" then
				lang="eng"
				herecomments=engcom
				elseif lang=="eng" then
				lang="rus"
				herecomments=ruscom
			end
			if lang=="rus" then
				Changer.Texts[1].SetText("[font:overworld][instant][novoice]".."Язык: [color:ff2040]РУССКИЙ")
				Changer.Texts[2].SetText("[font:overworld][instant][novoice]".."Озвучка: "..OnOff(dubbing))
				Changer.Texts[3].SetText("[font:overworld][instant][novoice]".."Счётчик смертей: "..OnOff(ShowDeathCounter))
				Changer.Texts[4].SetText("[font:overworld][instant][novoice]".."Сложность: "..Differ(diff))
				Changer.Texts[5].SetText("[font:overworld][instant][novoice]".."Кровь: "..OnOff(blooding))
				Changer.Texts[6].SetText("[font:overworld][instant][novoice]".."СТЕРЕТЬ прогресс")
				Changer.Text.SetText("[font:overworld][instant][novoice][color:ff2040]Опции")
				Changer.Text.MoveTo(310-Changer.Text.GetTextWidth()/2,430)
				OverText[1].SetText("[font:overworld][instant][novoice]".."Начать")
				OverText[2].SetText("[font:overworld][instant][novoice]".."Опции")
				OverText[3].SetText("[font:overworld][instant][novoice]".."Дополнительно")
				OverText[4].SetText("[font:overworld][instant][novoice]".."Выйти")
				else
				Changer.Texts[1].SetText("[font:overworld][instant][novoice]".."Dil: [color:ff2040]TÜRKÇE")
				Changer.Texts[2].SetText("[font:overworld][instant][novoice]".."Seslendirme: "..OnOff(dubbing))
				Changer.Texts[3].SetText("[font:overworld][instant][novoice]".."Ölüm sayacı: "..OnOff(ShowDeathCounter))
				Changer.Texts[4].SetText("[font:overworld][instant][novoice]".."Zorluk: "..Differ(diff))
				Changer.Texts[5].SetText("[font:overworld][instant][novoice]".."Kan: "..OnOff(blooding))
				Changer.Texts[6].SetText("[font:overworld][instant][novoice]".."ilerlemeyi SİL")
				Changer.Text.SetText("[font:overworld][instant][novoice][color:ff2040]Ayarlar")
				Changer.Text.MoveTo(310-Changer.Text.GetTextWidth()/2,430)
				OverText[1].SetText("[font:overworld][instant][novoice]".."Başla")
				OverText[2].SetText("[font:overworld][instant][novoice]".."Ayarlar")
				OverText[3].SetText("[font:overworld][instant][novoice]".."Ekstralar")
				OverText[4].SetText("[font:overworld][instant][novoice]".."Çıkış")
			end
			ReDoLanguage(lang)
			WriteSavio()
			elseif InState==2 then
			if dubbing==true then
				dubbing=false
				if lang=="rus" then
					Changer.Texts[2].SetText("[font:overworld][instant][novoice]Озвучка: "..OnOff(dubbing))
					else
					Changer.Texts[2].SetText("[font:overworld][instant][novoice]Seslendirme: "..OnOff(dubbing))
				end
				else
				dubbing=true
				if lang=="rus" then
					Changer.Texts[2].SetText("[font:overworld][instant][novoice]Озвучка: "..OnOff(dubbing))
					else
					Changer.Texts[2].SetText("[font:overworld][instant][novoice]Seslendirme: "..OnOff(dubbing))
				end
			end
			WriteSavio()
			elseif InState==3 then
			if ShowDeathCounter==true then
				ShowDeathCounter=false
				else
				ShowDeathCounter=true
			end
			if lang=="rus" then
				Changer.Texts[3].SetText("[font:overworld][instant][novoice]Счётчик смертей: "..OnOff(ShowDeathCounter))
				else
				Changer.Texts[3].SetText("[font:overworld][instant][novoice]Ölüm sayacı: "..OnOff(ShowDeathCounter))
			end
			WriteSavio()
			elseif InState==4 then
			diff=diff+1
			if diff==5 then
				diff=1
			end
			Changer.Texts[7].SetText("[font:overworld][instant][novoice]"..ShowDiffer(diff))
			if lang=="rus" then
				Changer.Texts[4].SetText("[font:overworld][instant][novoice]".."Сложность: "..Differ(diff))
				else
				Changer.Texts[4].SetText("[font:overworld][instant][novoice]".."Zorluk: "..Differ(diff))
			end
			WriteSavio()
			elseif InState==5 then
			if blooding==true then
				blooding=false
				else
				blooding=true
			end
			WriteSavio()
			if lang=="rus" then
				Changer.Texts[5].SetText("[font:overworld][instant][novoice]".."Кровь: "..OnOff(blooding))
				else
				Changer.Texts[5].SetText("[font:overworld][instant][novoice]".."Kan: "..OnOff(blooding))
			end
			elseif InState==6 then
			if lang=="rus" then
				Changer.Texts[7].SetText("[font:overworld][instant][novoice][color:ff2010]Это приведёт к сбросу текущего прогресса.\nВы уверены?")
				Changer.Texts[8].SetText("[font:overworld][instant][novoice]НЕТ")
				Changer.Texts[9].SetText("[font:overworld][instant][novoice]ДА")
				else
				Changer.Texts[7].SetText("[font:overworld][instant][novoice][color:ff2010]Bu ilerlemeni sıfırlayacak.\nEmin misin?")
				Changer.Texts[8].SetText("[font:overworld][instant][novoice]HAYIR")
				Changer.Texts[9].SetText("[font:overworld][instant][novoice]EVET")
			end
			Changer.Texts[8].MoveTo(260-Changer.Texts[8].GetTextWidth()/2,60)
			Changer.Texts[9].MoveTo(370-Changer.Texts[9].GetTextWidth()/2,60)
			MyState="CHOOSING"
			ChoiseMatter="ERASE"
			MyChoice(8)
		end
		WriteSavio()
	end
	elseif MyState=="CHOOSING" then
	if Input.Left==1 and fPlayer.x>0 then
		MyChoice(8)
		Audio.PlaySound("OverMenuMove")
		elseif Input.Right==1 and fPlayer.x<0 then
		MyChoice(9)
		Audio.PlaySound("OverMenuMove")
	end
	if Input.Confirm==1 then
		Audio.PlaySound("OverMenuConf")
		if ChoiseMatter=="ERASE" then
			if fPlayer.x>0 then
				SavioWrite.Delete()
				State("DONE")
				else
				MyState="Ayarlar"
				Changer.Texts[7].SetText("")
				Changer.Texts[8].SetText("")
				Changer.Texts[9].SetText("")
				MenuOptions(6)
			end
			elseif ChoiseMatter=="Diff" then
			if fPlayer.x>0 then
				globalstage="0"
				MyTimer=-1
				MyState="CHANGING"
				else
				MyState="Ayarlar"
				Changer.Texts[7].SetText("")
				Changer.Texts[8].SetText("")
				Changer.Texts[9].SetText("")
				MenuOptions(InState)
			end
		end
	end
	elseif MyState=="DownFight" then
	if Input.Right>0 and Input.Left==0 then
		Player.Move(2,0,true)
		elseif Input.Right==0 and Input.Left>0 then
		Player.Move(-2,0,true)
	end
	if Input.Up>0 and Input.Down==0 then
		Player.Move(0,2,true)
		elseif Input.Up==0 and Input.Down>0 then
		Player.Move(0,-2,true)
	end
	if Player.absx>632 then
		Player.MoveToAbs(632,Player.absy,true)
	end
	if Player.absx<8 then
		Player.MoveToAbs(8,Player.absy,true)
	end
	if Player.absy>82 then
		Player.MoveToAbs(Player.absx,82,true)
	end
	if Player.absy<8 then
		Player.MoveToAbs(Player.absx,8,true)
	end
	if PlayerHasFlirted==0  then
		if alltimer%6==0 then
			if not GetGlobal("curse") then
				else
				SetGlobal("curse",GetGlobal("curse")+1)
				if GetGlobal("curse")==MaxHP-1 then
					Possess()
					Player.hp=1
				end
			end
		end
		else
		if alltimer%12==0 then
			if not GetGlobal("curse") then
				else
				SetGlobal("curse",GetGlobal("curse")+1)
				if GetGlobal("curse")==MaxHP-1 then
					Possess()
					Player.hp=1
				end
			end
		end
	end
	local button=0
	--lastbutton=0
	for i=1,4 do
		local b=buttons[i]
		--48
		if b.x+52>Player.absx and b.x-52<Player.absx and Player.absy>7 and Player.absy<43 then
			button=i
		end
	end
	if lastbutton==button then
		else
		if button>0 then
			Audio.PlaySound("menumove")
		end
		lastbutton=button
		RedoBut(lastbutton)
	end
	if Input.Confirm==1 and lastbutton>0 then
		DoAction(lastbutton)
		MyState="NONE"
	end
	elseif MyState=="ToLostKidChoice" then
	if Input.Left==1 and fPlayer2.absx!=100 then
		fPlayer2.MoveToAbs(100,390)
		ChoiceText1.color={1,0.1,0.2}
		ChoiceText2.color={0.25,0,0.25}
		Audio.PlaySound("OverMenuMove")
		elseif Input.Right==1 and fPlayer2.absx!=400 then
		fPlayer2.MoveToAbs(400,390)
		ChoiceText1.color={0.25,0,0.25}
		ChoiceText2.color={1,0.1,0.2}
		Audio.PlaySound("OverMenuMove")
	end
	if Input.Confirm==1 and (fPlayer2.absx==100 or fPlayer2.absx==400) then
		local dial={}
		if fPlayer2.absx>320 then
			if lang=="rus" then
				if dubbing==true then
					dial={"[noskip][func:face,yes][next] ","[effect:twitch,1][font:overworld][color:ffffff][func:DUB,prolog/4][func:normal1][w:5]*Просто[waitall:2]...[w:3][waitall:1] хотела убедиться.", "[func:Peachy]*[waitall:6]...", "[func:DUB,prolog/5][w:4]*Позволь задать тебе один \nвопрос.", "[func:normal][func:DUB,prolog/6][w:4][speed:1.2]*Ты уверен,[w:3] что [speed:1.3]ты \nвыше последствий?","[func:Peachy][func:DUB,prolog/7][w:4]*Что любые твои [w:2][waitall:2]деяния[waitall:5]...","[func:normal][noskip][func:DUB,prolog/8][w:2]*Останутся [w:2]безнаказанными?[w:30][func:ph1][func:face,no][next] "}
					else
					dial={"[noskip][func:face,yes][next] ","[effect:twitch,1][font:overworld][color:ffffff][func:DUB,prolog/4][func:normal1]*Просто[waitall:4][w:3]...[waitall:1][w:3] хотела убедиться.", "[func:Peachy]*[waitall:4][w:3]...", "[func:DUB,prolog/5]*Позволь задать тебе один \nвопрос.", "[func:normal][func:DUB,prolog/6]*Ты уверен,[w:3] что ты \nвыше последствий?","[func:Peachy][func:DUB,prolog/7]*Что любые твои деяния[waitall:4][w:3]..","[func:normal][noskip][func:DUB,prolog/8]*Останутся безнаказанными?[w:30][func:ph1][func:face,no][next] "}
				end
				else
				dial={"[noskip][func:face,yes][next] ","[func:DUB,prolog/1][effect:twitch,1][font:overworld][color:ffffff][func:DUB,prolog/4][func:normal1]*[w:2]Sadece [w:15]emin [w:1]olmak[w:1] istedim[w:1].", "[func:Peachy]*[waitall:6]...", "[func:DUB,prolog/5]*Bir şey[w:10] sormama [w:3]izin ver[w:5].", "[func:DUB,prolog/6][func:normal]*[w:2]Kaderinden [w:2]üstün,[w:5] olduğuna [speed:1.5]\ne [w:2]mi [w:2][speed:1][w:2]n [w:1]mi[w:1]si[w:1]n[w:4]?","[func:DUB,prolog/7][func:Peachy]*[w:3]Yaptığın [w:1]şeyler[waitall:3]...","[func:DUB,prolog/8][func:normal][noskip]*Cezasız [w:10]kal[w:1]am[w:1][waitall:3]az.[w:30][func:ph1][func:face,no][next] "}
			end
			dial=EveryDial(dial,"[effect:twitch,1][font:overworld][color:ffffff]","[novoice][noskip]")
			else
			dial={"[noskip][func:face,yes][func:Surprise1][waitall:4][w:3]..[func:JUMP].[func:face,no][func:Vietnam][next] ","[next] "}
			dial=EveryDial(dial,"[effect:twitch,1][font:overworld][color:ffffff]","")
		end
		enemies[5].SetVar("currentdialogue",dial)
		fPlayer2.Remove()
		Box.Remove()
		ChoiceText1.Remove()
		ChoiceText2.Remove()
		State("ENEMYDIALOGUE")
		Audio.PlaySound("OverMenuConf")
		MyState="NONE"
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
if glitchedmercy==0 then
	else
	local t=glitchedmercy
	if t==1 then
		enemies[1].SetVar("dodge",false)
		Cover=CreateProjectileAbs("overworld/cover",320,240,"Top")
		Cover.sprite.color32={39,0,54,0}
		elseif t>1 and t<31 then
		Cover.sprite.alpha=math.sin(t*math.pi/60)
		elseif t==31 then
		State("NONE")
		fighting=true
		RedoBut(1)
		evadelevel=6
		forcedfight=true
		deadlyhit=true
		charalegs.x=maxright
		enemies[1].Call("Bubble")
		SetGlobal("evade",0)
		elseif t>1030 and t<1091 then
		Cover.sprite.alpha=math.sin((t-970)*math.pi/120)
	end
		
	glitchedmercy=glitchedmercy+1
	if t==1300 then
		glitchedmercy=0
		Reminder=true
	end
end
if GlobalSaveTimer>0 then
	local t=GlobalSaveTimer
	if t<180 then
		NewAudio.SetVolume("menu",math.cos(t*math.pi/360))
		elseif t==180 then
		SetMusic("none")
	end
	if t>120 and globalstage=="7" and t<240 then
		NewAudio.SetVolume("Hits",1-math.cos((t-120)*math.pi/240))
		elseif t==240 and globalstage=="7" then
		NewAudio.SetVolume("Hits",1)
		GlobalSaveTimer=-1
		local dial=""
		if lang=="rus" then
			dial="[noskip][font:overworld][novoice][w:75][waitall:6][w:6]...[waitall:2][w:4]но впредь вам некуда было вернуться."
			else
			dial="[noskip][font:overworld][novoice][w:75][waitall:6][w:6]...[waitall:2][w:4]Fakat artık geri dönemezsin."
		end
		local t=CreateText(dial,{80,140},480,"Top",-1)
		t.HideBubble()
		t.progressmode="none"
	end
	if t==1 then
		GlobalCover=CreateProjectileAbs("overworld/beforebattle",320,240,"Top")
		GlobalCover.sprite.alpha=0
		elseif t<121 then
		GlobalCover.sprite.alpha=math.sin(t*math.pi/240)
		elseif t==121 then
		for i=1,4 do
			OverButtons[i].Remove()
			OverText[i].Remove()
		end
		GlobalChoicePlayer.Remove()
		GlobalChoiceCover.Remove()
		GlobalChoiceText1.Remove()
		GlobalChoiceText2.Remove()
		GlobalChoiceText3.Remove()
		fPlayer.Remove()
		RedoBut(0)
		Player.MoveTo(0,0,true)
		NAME.Remove()
		OverBac.Remove()
		if globalstage=="7" then
			NewAudio.PlayMusic("Hits","wind",true,1)
			NewAudio.SetVolume("Hits",0)
		end
		elseif t>240 and t<361 then
		GlobalCover.sprite.alpha=math.sin((t-120)*math.pi/240)
		elseif t==390 then
		State("ENEMYDIALOGUE")
	end
	GlobalSaveTimer=GlobalSaveTimer+1
end
if logotimer==true then
	else
	logotimer=logotimer+1
	encountertext = "[novoice]"
	if logotimer>-60 and logotimer<1 then
		if logotimer==-59 then
			COVER=CreateProjectileAbs("overworld/beforebattle",320,240,"Top")	
		end
		NewAudio.SetVolume("menu",1-math.cos(math.pi*logotimer/120))
		local alpha=math.sin(math.pi*(logotimer+60)/120)
		OverBac.sprite.SendToTop()
		COVER.sprite.alpha=alpha
	end
	if logotimer==1 then
		InMenuTime=0
		MyState="NONE"
		OverBac.Remove()
		NAME.Remove()
		if globalstage=="0" or globalstage=="5" then
			else
			GlobalChoicePlayer.Remove()
			GlobalChoiceCover.Remove()
			GlobalChoiceText1.Remove()
			GlobalChoiceText2.Remove()
			GlobalChoiceText3.Remove()
			if globalstage=="-1" then
				globalstage="0"
				deaths=0
				WriteSavio()
			end
		end
		FullIntro()
		for i=1,4 do
			OverText[i].Remove()
			OverButtons[i].Remove()
		end
		COVER.Remove()
		local words={"CANON  [alpha:00]DEĞİL","    DEĞİL"}
		if lang=="rus" then
			words={"НЕ [alpha:00]КАНОН","   КАНОН"}
		end
		NotCanon1=CreateText({"[novoice][instant][font:overworld]"..words[1]},{260,220},480,"Over",-1)
		NotCanon1.MoveTo(320-NotCanon1.GetTextWidth(),220)
		NotCanon1.Scale(2,2)
		NotCanon1.HideBubble()
		NotCanon1.progressmode="none"
		NotCanon1.color={1,0,0}
		NotCanon1.alpha=0
		NotCanon2=CreateText({"[novoice][instant][font:overworld]"..words[2]},{NotCanon1.x,220},480,"Over",-1)
		NotCanon2.Scale(2,2)
		NotCanon2.HideBubble()
		NotCanon2.progressmode="none"
		NotCanon2.color={1,1,1}
		NotCanon2.alpha=0
		overworldfonebattle.sprite.alpha=1
		overworldfonebattle.sprite.SendToTop()
		overworldigb.sprite.SendToTop()
		overworldigb.sprite.alpha=0
		Audio.PlaySound("mus_churchbell")
		State("NONE")
		elseif logotimer<241 and logotimer>1  then
		local sin=math.sin(logotimer*math.pi/240)
		NotCanon1.alpha=sin
		NotCanon2.alpha=sin
		overworldigb.sprite.alpha=0
		elseif logotimer<481 and logotimer>1 then
		overworldigb.sprite.alpha=math.sin((logotimer-240)*math.pi/240)
		elseif logotimer==481 then
		overworldigb.sprite.alpha=0
		elseif  logotimer<842 and logotimer>1 then
		overworldfonebattle.sprite.alpha=math.cos((logotimer-480)*math.pi/720)
		elseif logotimer==900 then
		NotCanon1.Remove()
		NotCanon2.Remove()
		overworldfonebattle.sprite.alpha=0
		State("ENEMYDIALOGUE")
		overworldface.sprite.alpha=1
		SetMusic("prolog")
		logotimer=true
	end
end
if epilog == true then
	if endtimer==0 then
		nextwaves = {"dummy"}
		cover=CreateProjectileAbs("overworld/beforebattle",320,240,"BelowBullet")
		cover.sprite.alpha=0
		fone1=CreateProjectileAbs("overworld/fone1",320,240,"Top")
		fone4=CreateProjectileAbs("overworld/fonetop",320,240,"Top")
		fone2=CreateProjectileAbs("overworld/fone2",320,240,"Top")
		fone3=CreateProjectileAbs("overworld/fone3",320,240,"Top")
		chara=CreateProjectileAbs("overworld/dead_chara",521,85.5,"Top")
		chara.sprite.Scale(2.5,2.5)
		frisk=CreateProjectileAbs("empty",440,85.5,"Top")
		frisk.sprite.Set("overworld/frisk")
		frisk.sprite.Scale(2.5,2.5)
		chara.sprite.alpha=0
		fone1.sprite.alpha=0
		fone2.sprite.alpha=0
		fone3.sprite.alpha=0
		fone4.sprite.alpha=0
		frisk.sprite.alpha=0
		over=CreateProjectileAbs("overworld/beforebattle",320,240,"Top")
		over.sprite.alpha=0
		fPlayer=CreateProjectile("ut-heart",frisk.x,frisk.y)
		fPlayer.sprite.color={1,0,1}
		fPlayer.sprite.alpha=0
		frisk.sprite.Scale(2.5,2.5)
		elseif endtimer<61 then
		over.sprite.alpha=endtimer/60
		elseif endtimer==61 then
		State("NONE")
		fone1.sprite.alpha=1
		fone2.sprite.alpha=1
		fone3.sprite.alpha=1
		fone4.sprite.alpha=1
		frisk.sprite.alpha=1
		cover.sprite.alpha=1
		chara.sprite.alpha=1
		fPlayer.sprite.alpha=1
		elseif endtimer>120 and endtimer<181 then
		over.sprite.alpha=(180-endtimer)/60
		elseif endtimer>240 and endtimer<300 then
		local rang=2*math.sin((endtimer-240)*math.pi/60)
		local x=rang*math.sin((endtimer-240)*10)
		frisk.MoveToAbs(440+x,85.5)
		elseif endtimer>330 and endtimer<411 then
		frisk.Move(2,0)
		local t=endtimer-330
		if t==1 then
			frisk.sprite.Set("overworld/friskstep")
			frisk.sprite.Scale(2.5,2.5)
			elseif t==27 then
			frisk.sprite.Set("overworld/frisk")
			frisk.sprite.Scale(2.5,2.5)
			elseif t==53 then
			frisk.sprite.Set("overworld/friskstep")
			frisk.sprite.Scale(2.5,2.5)
			elseif t==80 then
			frisk.sprite.Set("overworld/frisk")
			frisk.sprite.Scale(2.5,2.5)
		end
		elseif endtimer==440 then
		fPlayer.MoveTo(frisk.x,frisk.y)
		elseif endtimer>440 and endtimer<500 then
		local alpha=math.cos((endtimer-440)*math.pi/120)
		fone1.sprite.alpha=alpha
		fone2.sprite.alpha=alpha
		fone3.sprite.alpha=alpha
		fone4.sprite.alpha=alpha
		frisk.sprite.alpha=alpha
		chara.sprite.alpha=alpha
		elseif endtimer==560 then
		fPlayer.sprite.color={0.5,0.25,1}
		Audio.PlaySound("ding")
		MakeDing("ut-heart",{fPlayer.absx,fPlayer.absy},{0.5,0.25,1})
		elseif endtimer>620 and endtimer<680 then
		fPlayer.Move(2,0)
		elseif endtimer==740 then
		Titr1.phase=1
		Titr1.timer=-92
		elseif endtimer==900 then
		frisk.Remove()
		fone1.Remove()
		fone2.Remove()
		fone3.Remove()
		fone4.Remove()
		chara.Remove()
		cover.Remove()
		endtimer=0
		epilog=false
		--[[elseif endtimer>109 and endtimer<149 then
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
		elseif endtimer>699 and endtimer<820 then
		blackfone.sprite.alpha=math.sin((endtimer-699)*math.pi/240)
		elseif endtimer==940 then
		fone1.sprite.color={0,0,0}
		fone2.Remove()
		fone3.Remove()
		fone4.sprite.color={0,0,0}
		enemies[1].Call("SetActive",false)
		enemies[2].Call("SetActive",false)
		enemies[5].Call("SetActive",true)
		local dial=""
		--dial={"[noskip][waitall:2][effect:twitch,1][font:sans][color:ffffff]Привет.","[waitall:2][noskip][color:ffffff]Я не ждал сегодня посетителей.","[waitall:2][noskip][color:ffffff]...","[waitall:2][noskip][color:ffffff]Твоё выражение лица...","[waitall:2][noskip][color:ffffff]Хмм...","[waitall:2][noskip][color:ffffff]Ты довольно странный монстр.","[waitall:2][color:ffffff][noskip]Чем я могу помо[func:slash][next] "}
		dial={"[noskip][speed:0.75][font:sans]Привет.[w:12][next] ","[speed:0.75][noskip]Я не ждал сегодня посетителей.[w:5][next] ","[speed:0.75][waitall:2][novoice][noskip][color:ffffff]...[w:5][next] ","[noskip]Твоё выражение лица[waitall:2][novoice]...[w:5][next] ","[noskip][color:ffffff]Ты довольно странный монст-[func:slash][next] "}
		--enemies[5].SetVar("currentdialogue",{"[noskip][waitall:2][effect:twitch,1][font:sans][waitall:2][color:ffffff][noskip]Чем я могу помо[func:slash][next] "})
		epilog=false
		dial=EveryDial(dial,"[font:sans][noskip][speed:0.5]")
		enemies[5].SetVar("currentdialogue",dial)
		endtimer=-1
		State("ENEMYDIALOGUE")]]
	end
	endtimer=endtimer+1
end
if GetGlobal("Playerisdead")==true then
	cursefade=6000
	curse.alpha=0
	IsCursed=false
	cursetime=0
	RedoBut(0)
	CharaIsRaging=false
	SetGlobal("Playerisdead",false)
	Placestompx=Player.absx
	Placestompy=Player.absy
	itemamount=12
	Player.hp=92
	SetMusic("none")
	--deathfone=CreateProjectileAbs("overworld/beforebattle",320,240)
	--deathfone.sprite.alpha=1
	deaths=deaths+1
	alldeaths=alldeaths+1
	WriteSavio()
	if wons==1 then
		if phase==1 then
			if lang=="rus" then
				comm="Последний актер на сцене!"
				else
				comm="Son aktör sahnede!"
			end
			else
			phase=1.5
			if lang=="eng" then
				comm="Demek zor yolu seçti[waitall:4][w:3]...[waitall:1][w:3] \nTamam,[w:3] babalık."
				else
				comm="Значит,[w:3] она хочет сыграть \rпо-взрослому[waitall:4][w:3]...[waitall:1][w:3] \nХорошо,[w:3] папик."
			end
		end
	end
	deathtimer=0
end

if IsCursed==false and cursefade<MAXFADE then
	cursefade=cursefade+1
	if cursefade==1 then
		curse.SetVar("y",curse.y)
	end
	if cursefade<40 then
		curse.y=curse.GetVar("y")+60*math.sin(cursefade*math.pi/80)
		local alpha=(curse.y*2-67)/67
		local much=math.sin(cursefade*math.pi/80)
		curse.color={136*(1+much)/256,0,27*(1+much)/256}
		elseif cursefade==120 then
		curse.alpha=0
		cursetime=0
		else
		curse.y=curse.GetVar("y")+60-180*(1-math.cos((cursefade-40)*math.pi/160))
		curse.alpha=math.sqrt(1-math.sin((cursefade-40)*math.pi/160))
		local much=2-1.5*math.sin((cursefade-40)*math.pi/160)
		curse.color={136*(1+much)/256,0,27*(1+much)/256}
	end
	elseif IsCursed==true and (cursetime==0 or cursefade>0) then
	curse.alpha=1
	curse.color={136/256,0,27/256}
	cursefade=0
	curse.x=535
	curse.y=67
	cursetime=1
	curse.Scale(0,0)
	NewAudio.PlaySound("blip","cursesound",false,1/60)
	
	MakeDing("system/curse",{535,70})
	Audio.PlaySound("ding")
	elseif IsCursed==true and cursetime>0 then
	if cursetime<31 then
		NewAudio.PlaySound("blip","cursesound",false,(cursetime+1)/60)
		cursetime=cursetime+1
		curse.alpha=math.sin(cursetime*math.pi/60)
		if cursetime>0 and cursetime<31 then
			local much=math.sin((cursetime-0)*math.pi/30)
			curse.color={136*(1+much)/256,0,27*(1+much)/256}
		end
		local extr=6-5*math.sqrt(math.sin(cursetime*math.pi/60))
		curse.Scale(extr,extr)
		else
		curse.y=67+CurseTime(1)
		local alpha=(curse.y*2-67)/67
		curse.alpha=alpha*alpha
	end
end
if not GetGlobal("choicen") or GetGlobal("choicen")==false then
	elseif GetGlobal("choicen")==true then
	if choicer==1 then
		choice1.color={1,1,0}
		choice2.color={1,1,1}
		elseif choicer==2 then
		choice2.color={1,1,0}
		choice1.color={1,1,1}
	end
	if Input.Left==1 then
		fPlayer.MoveToAbs(146,308)
		choicer=1
	end
	if Input.Right==1 then
		fPlayer.MoveToAbs(434,308)
		choicer=2
	end
	if Input.Confirm==1 then
		for i=1,5 do
			enemies[i].Call("SetActive",false)
		end
		local dial=""
		if choicer==2 then
			if HaveKilledChara==false then
				if lang=="rus" then
					dial={"[waitall:4][w:3]...","[waitall:4][w:3]...[waitall:2][w:3][func:MTT,calm]Конечно.[w:9] [func:MTT,okey]Выбор твой.","[waitall:4][w:3]...[waitall:2][w:3]в конце концов,[w:6] [func:MTT,NotNew]ты такой же идиот,[w:6] как и он.","[func:MTT,Thought]И почему я думал,[w:6] что ты будешь другим,[w:6] дорогуша?","[func:MTT,NothingNew]Какая теперь разница.","[func:MTT,NotNew]Я боюсь,[w:6] [func:MTT,Afraid]что твоего отказа не было в сценарии.","[func:MTT,NotPlaying]А актеры,[w:6] что играют не по сценарию,[w:6] [func:MTT,punishment]должны быть наказаны.","[func:MTT,Afraid]Ничего личного.[w:9] [func:MTT,Bisiness]Просто бизнес.","[func:MTT,NotPersonal]Хотя,[w:6] кого я обманываю?\n[w:15][func:MTT,saw1][waitall:3][func:SetMusic,none][w:10][func:Mttsaw][w:10][color:8040ff]Это личное.[w:6][next] ","[func:MTT,EYE][func:PlayerGetsKilled][color:ff00ff][waitall:1]Так возвращайся же к нулю,[w:3] актёр![w:6000] "}
					else
					dial={"[waitall:4][w:3]...","[waitall:4][w:3]...[waitall:2][w:3][func:MTT,calm]Tabiki.[w:9] [func:MTT,okey]İş sana düştü.","[waitall:4][w:3]...[waitall:2][w:3]en sonunda,[w:6] [func:MTT,NotNew]onun gibi bir zavallısın.","[func:MTT,Thought]Neden farklı olacağını düşündüm ki,[w:6] tatlım?","[func:MTT,NothingNew]Artık bir fark yok.","[func:MTT,NotNew]Korkarım ki,[w:6][func:MTT,Afraid] bunu reddetmen senaryoda yok.","[func:MTT,NotPlaying]Ve senaryoya uymayan [func:MTT,punishment]oyuncular cezalandırılmalı.","[func:MTT,Afraid]Kişisel değil.[w:9] \n[func:MTT,Bisiness]Sadece iş.","[func:MTT,NotPersonal]Oh,[w:6] kime yalan söylüyorum ki?[w:15][waitall:3][color:8040ff][func:MTT,saw1][func:SetMusic,none][w:10][func:Mttsaw][w:10] \nBU KİŞİSEL.[w:6][next] ","[func:MTT,EYE][func:PlayerGetsKilled][color:ff00ff][waitall:1]Kariyerin bitti,[w:3] aktör![w:6000] "}
				end
				else
				if lang=="rus" then
					dial={"[waitall:4][w:3]...[waitall:2][w:3][func:MTT,calm]Хм.","[func:MTT,Thought]Полагаю,[w:9] [func:MTT,NothingNew]мы вновь скоро встретимся.","[func:MTT,NotPlaying]И всё-таки мне интересно[waitall:4][w:3]...","[func:MTT,punishment]Что ты нашел в ней?[w:9] [func:MTT,Just]Она же просто самоуверенная истеричка.","[func:MTT,Afraid]Полагаю,[w:6] тебе просто нравится смотреть за её страданиями,[w:6] ха?","[func:MTT,NotPersonal]Хе-хе[waitall:4][w:3]...[waitall:2][w:3] [func:MTT,Bisiness]До встречи[waitall:4][w:3]...[waitall:2][w:3][func:MTT,saw1][func:SetMusic,none][w:10][func:Mttsaw] [waitall:4][color:8040ff]актёр.[w:6][next] ","[func:MTT,EYE][func:PlayerGetsKilled][w:6000] "}
					else
					dial={"[waitall:4][w:3]...[waitall:2][w:3][func:MTT,calm]Hm.","[func:MTT,Thought]Sanırım,[w:9] [func:MTT,NothingNew]tekrar görüşeceğiz.","[func:MTT,NotPlaying]Fakat hala düşünüyorum[waitall:4][w:3]...","[func:MTT,punishment]Onda ne buldun?[w:9] [func:MTT,Just]O sadece iğrenç bir figüran.","[func:MTT,Afraid]Sanırım,[w:6] onun acı çekmesini seviyorsun,[w:6] ha?","[func:MTT,NotPersonal]He-he[waitall:4][w:3]...[waitall:2][w:3] [func:MTT,Bisiness]Yakında görüşürüz[waitall:4][w:3]...[waitall:2][w:3][func:MTT,saw1][func:SetMusic,none][w:10][func:Mttsaw][color:8040ff] [waitall:4]akör.[w:6][next] ","[func:MTT,EYE][func:PlayerGetsKilled][w:6000] "}
				end
			end
			for i=1,#dial do
				dial[i]="[font:mtt][waitall:2][w:3][effect:twitch,1][noskip][color:ffffff]"..dial[i]
			end
			HaveKilledChara=false
			WriteSavio()
			Mett=CreateText(dial,{80,420},480,"Top",-1)
			Mett.progressmode="manual"
			Mett.HideBubble()
			choice1.Remove()
			choice2.Remove()
			fPlayer.Remove()
			SetGlobal ("choicen",false)
			elseif choicer==1 then
			if HaveKilledChara==false then
				if lang=="rus" then
					dial={"Отлично[waitall:4][w:3]...","[func:MTT,calm]Я никогда в тебе не сомневался.","Мы будем вечно вместе,[w:6] правда?[w:9]\n[func:MTT,okey]Ты ведь не предашь меня,[w:6] как тот глупец?","Я[waitall:4][w:3]...[func:MTT,calm][waitall:2][w:3] Так рад.[w:9]\n[func:MTT,proposal]Пойдем со мной.","Впереди у нас[waitall:4][w:3]...[waitall:2][w:3][color:ff20a0]целая [func:EVERYTHINGEVERYWHERE][w:6]вечность.[w:180]"}
					else
					dial={"Perfect[waitall:4][w:3]...","[func:MTT,calm]Sana her zaman inandım.","Sonsuza kadar beraber olacağız,[w:6] değil mi?[w:9] [func:MTT,okey]O zavallı gibi bana ihanet etmeyecek misin?","Ben[waitall:4][w:3]...[waitall:2][w:3] [func:MTT,calm]Çok mutluuym.[w:9] \n[func:MTT,proposal]Benimle gel.","Burda[waitall:4][w:3]...[waitall:2][w:3] [color:ff20a0]her şey [func:EVERYTHINGEVERYWHERE][w:6]her yerde.[w:180]"}
				end
				else
				if lang=="rus" then
					dial={"[func:MTT,proposal]Отлично[waitall:4][w:3]...","[func:MTT,calm]Я знал,[w:6] что рано или поздно ты поймешь[waitall:4][w:3]...","[func:MTT,NotNew]Она не заслуживает твоего внимания.","Она не заслуживает [waitall:3]ничего[w:3].","Ты же[waitall:4][w:3]...[waitall:2][w:3] [func:MTT,calm]Должен блистать.","[func:MTT,proposal]Пойдём,[w:6] дорогуша[waitall:4][w:3]...[waitall:2][w:3] [color:ff20a0]У нас много дел.[w:30][func:EVERYTHINGEVERYWHERE][w:6000]"}
					else
					dial={"[func:MTT,proposal]Harika[waitall:4][w:3]...","[func:MTT,calm]Eninde sonunda geleceğini biliyordum.","[func:MTT,NotNew]O seni haketmiyor.",",O bir şey haketmiyor.","Ve sen[waitall:4][w:3]...[waitall:2][w:3] [func:MTT,calm]yıldız olmalısın.","[func:MTT,proposal]Hadi ama, tatım[waitall:4][w:3]...[waitall:2][w:3] Yapcak çok şeyimiz var.[w:30][func:EVERYTHINGEVERYWHERE][w:6000] "}
				end
			end
			for i=1,#dial do
				dial[i]="[font:mtt][waitall:2][w:3][effect:twitch,1][noskip][color:ffffff]"..dial[i]
			end
			Mett=CreateText(dial,{80,420},480,"Top",-1)
			Mett.progressmode="manual"
			Mett.HideBubble()
			choice1.Remove()
			choice2.Remove()
			fPlayer.Remove()
			SetGlobal ("choicen",false)
		end
	end
	elseif GetGlobal("choicen")==1 then
	local yea="YES"
	local noa="NO"
	if lang=="rus" then
		yea="ДА"
		noa="НЕТ"
	end
	choice1=CreateText("[font:overworld][instant][noskip][novoice]"..yea,{176,300},580,"Top",-1)
	choice1.progressmode="none"
	choice1.HideBubble()
	choice2=CreateText("[font:overworld][instant][noskip][novoice]"..noa,{464,300},480,"Top",-1)
	choice2.progressmode="none"
	choice2.HideBubble()
	fPlayer=CreateProjectileAbs("ut-heart",320,308,"Top")
	fPlayer.sprite.color={1,0,1}
	SetGlobal("choicen",true)
	choicer=0
	fPlayer.sprite.SendToTop()
end
if not GetGlobal("MTT") then
	elseif GetGlobal("MTT")=="SAW" then
	sawtime=sawtime+1
	if sawtime%3==0 then
		if currentspr=="1.2" then
			mtt.sprite.Set("1.2/MTT/saw"..(((sawtime/3)%2)+1))
			else
			mtt.sprite.Set("MTT/saw"..(((sawtime/3)%2)+1))
		end
	end
	mtt.sprite.Scale(3,3)
	else
	if currentspr=="1.2" then
		mtt.sprite.Set("1.2/MTT/"..GetGlobal("MTT"))
	end
end
if deathtimer==false then
	elseif deathtimer==true then
	State("ENEMYDIALOGUE")
	deathtimer=false
	elseif deathtimer<3 then
	if deathtimer==1 then
		deathfone=CreateProjectileAbs("overworld/beforebattle",320,240)
	end
	if deathtimer==2 then
		for i=1,#blooddrop do
			blooddrop[i].Set("empty")
		end
		if wons==0 then
			if phase==1 then
				if prog<27 then
					enemies[1].Call("SendToCenter")
					enemies[1].SetVar("dodge",true)
					enemies[1].SetVar("block",false)
					evadelevel=1
					prog=0
					else
					lgsx=maxleft
					SetGlobal("evasion",2)
					enemies[1].SetVar("dodge",true)
					enemies[1].SetVar("block",false)
					evadelevel=2
					prog=27
					enemies[1].Call("HandleAttack")
				end
				elseif phase==1.5 then
				enemies[1].Call("SendToCenter")
				prog=43
				enemies[1].SetVar("dodge",false)
				enemies[1].SetVar("block",true)
				ghostsnow={"Asriel_Sprite"}
				evadelevel=6
				elseif phase==2 then
				enemies[1].Call("SendToCenter")
				prog=51
				enemies[1].SetVar("dodge",false)
				enemies[1].SetVar("block",false)
				evadelevel=6
			end
			else
			prog=0
		end
		blooddrop={}
		enemies[4].Call("Recharge")
		enemies[1].SetVar("weak",false)
		enemies[1].SetVar("def",30)
		if diff<3 then
			if lang=="rus" then
				enemies[1].SetVar("commands",{"ПРОВЕРИТЬ", "МОЛИТВА"})
				else
				enemies[1].SetVar("commands",{"GÖZLE", "DUA ET"})
			end
			else
			if lang=="rus" then
				enemies[1].SetVar("commands",{"ПРОВЕРИТЬ"})
				else
				enemies[1].SetVar("commands",{"GÖZLE"})
			end
		end
		SetGlobal("charaisdead",0)
		SetGlobal("cursed",0)
		Player_ATK=38
		charasoul.alpha=0
		charasoul.Set(currentspr.."/chara/chara_soul1")
		SetGlobal("curse",0)
		SetGlobal("burn",0)
		State("NONE")
		if wons==0 then
			if phase==1 then
				nextwaves ={"phase1/nicetomeetya"}
				else
				nextwaves ={"phase1.5/easy"}
			end
		end
		SetGlobal("evasion",0)
		SetGlobal("timing",false)
		if phase==1 then
			enemies[1].SetVar("hp",1500)
			elseif phase==1.5 then
			enemies[1].SetVar("hp",1499)
			elseif phase==2 then
			enemies[1].SetVar("hp",1499)
		end
		enemies[2].Call("SetActive",false)
		enemies[1].Call("SetActive",true)
		if phase==1 then
	       		SetGlobal("pray",0)
			elseif phase==1.5 then
	       		SetGlobal("pray",4)
		end
		if wons==0 then
			if phase==1 then
				SetGlobal("facial_expression",23)
				else
				SetGlobal("facial_expression",6)
			end
		end
		Wounded(1501,1501,1501)
		if wons==1 then
			SetGlobal("facial_expression",6)
		end
		BackSprites(currentspr)
		if currentspr=="1.2" then
			phone=CreateProjectileAbs("system/lilo/phone",320,160)
			else
			phone=CreateProjectileAbs("system/black/phone",320,160)
		end
		fdeath=CreateProjectileAbs("ut-heart",Placestompx,Placestompy,"Top")
		fdeath.sprite.color=Player.sprite.color
		Player.MoveTo(0,0,true)
		ReadyGlobalSave(globalstage)
		if ShowDeathCounter then
			local text1="[instant][font:overworld][effect:none][novoice] = "..deaths-1
			local text2="[instant][font:overworld][effect:none][novoice] = "..deaths
			if alldeaths!=deaths then
				text1=text1.."  ("..(alldeaths-1)..")"
				text2=text2.."  ("..alldeaths..")"
			end
			DeathsText=CreateText({text1,text2},{0,0},480,"Top",-1)
			DeathsText.progressmode="none"
			DeathsText.color={0.5,0.25,1}
			DeathsText.Scale(2,2)
			DeathsText.HideBubble()
			DeathsText.MoveToAbs(Placestompx+12,Placestompy+3-DeathsText.GetTextHeight())
		end
	end
	deathtimer=deathtimer+1
	elseif deathtimer<120 then
	if Achiventor.Time==0 then
		deathtimer=deathtimer+1
	end
	if deathtimer==50 then
		if phase==1.5 and Achivements[9]=="0" then
			GotAchivement(9)
		end
	end
	if deathtimer==45 then
		fdeath.sprite.Set("ut-heart-broken")
	end
	if deathtimer==40 then
		Audio.PlaySound("heartbeatbreaker")
	end
	if deathtimer==83 then
		Audio.PlaySound("heartsplosion")
	end
	if deathtimer==90 then
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
			if ShowDeathCounter then
				DeathsText.NextLine()
			end
	end
	elseif deathtimer<150 then
	deathtimer=deathtimer+1
	elseif deathtimer<210 then
	deathtimer=deathtimer+1
	
	deathfone.sprite.alpha=1-(deathtimer-150)/60
	if ShowDeathCounter then
		DeathsText.alpha=1-(deathtimer-150)/60
	end
	elseif deathtimer==210 then
	if ShowDeathCounter then
		DeathsText.Remove()
	end
	deathtimer=true
end
if true then
	local time=MettaHead.GetVar("time")
	if time>-10 then
		if time>-1 then
			MettaHead.alpha=math.cos(time*math.pi/60)
		end
		time=time+1
		if time==0 then
			Misc.ShakeScreen(30,60,true)
		end
		if time==31 then
			time=-11
		end
		MettaHead.SetVar("time",time)
	end
	if time<-10 then
		MettaHead.SetVar("time",time+1)
		if time==-11 then
			MettaHead.alpha=0
			else
			MettaHead.alpha=1
		end
	end
end
if systemfight then
	if Possessed then
		if PossessedTime>0 then
			local time=PossessedTime
			if time==31 then
				Player.MoveToAbs(48,25,true)
				Player.sprite.alpha=1
				RedoBut(1)
				Audio.PlaySound("menumove")
				elseif time==90 then
				fighting=true
				Audio.PlaySound("menuconfirm")
				forcedfight=true
				local rand=math.random(2)
				nextwaves={"phase child/"..math.random(7)}
				if enemies[1].GetVar("LostChildHopes")==false then
					rand=1
					enemies[1].SetVar("LostChildHopes",true)
					local dial={}
					if lang=="rus" then
						dial={ "[func:LostKidFace,shocked,+]Ч-[w:9]что?!-",  "[func:LostKidFace,shocked2,+][func:SAVEMUSIC]Я увернулась,[w:6] пусть \nи не хотела,[w:6] но[waitall:4][w:3]...[waitall:1][w:3]",  "[func:LostKidFace,shocked3,+]Твой взгляд[waitall:4][w:3]...[waitall:1][w:3] \nУ меня сработал \nинстинкт \nсамосохранения[waitall:4][w:3]...[waitall:1][w:3]", "[func:LostKidFace,base_close,-]По какой-то \nпричине[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,gloomy,+] Этот \nвзгляд меня \nвымораживает[waitall:4][w:3]...[waitall:1][w:3]",  "[func:LostKidFace,base_left,+]Я даже не увидела \nтвой удар[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,confused,+] \nЧто это было?", "[func:LostKidFace,base_close,-][waitall:4][w:3]...[waitall:1][w:3]", "[func:LostKidFace,hope_base,+]Кажется[waitall:4][w:3]...[waitall:1][w:3] Я поняла.",  "[func:LostKidFace,hope_cheers,+]В дело вмешался \nкукловод.[w:9] \nМне льстит,[w:6] что мне \nоказана такая честь.",  "[func:LostKidFace,hope_close,-]Партнёр[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,hope_determined,+] \nНе смей \nподдаваться!",  "[func:LostKidFace,hope_question,+]Если ты все ещё \nвнутри и \nотказываешься меня \nубивать[waitall:4][w:3]...[waitall:1][w:3]",  "[func:LostKidFace,hope_smile,+]Я думаю,[w:6] я могу \nдать тебе шанс.",  "[func:LostKidFace,hope_cheers,+]Вдвоем мы \nсправимся.[w:9] \nПросто не \nпереставай бороться \nс ним!","[func:LostKidFace,hope_base,+][next] "}
						else
						dial={"[func:LostKidFace,shocked,+]N-Ne?-", "[func:LostKidFace,shocked2,+][func:SAVEMUSIC]İstemesem \nde yana çekildim,[w:3] fakat[waitall:4][w:3]...", "[func:LostKidFace,shocked3,+]Fakat[waitall:4][w:3]...[waitall:1][w:3] \nBenim yerime \nrefleksimdi o[waitall:4][w:3]...", "[func:LostKidFace,base_close,-]Nedense[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,gloomy,+]\nŞu an korkuyu \niliklerimde \nhissediyorum[waitall:4][w:3]...", "[func:LostKidFace,base_left,+]Slashini görmedim \nbile[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,confused,+]\nO da neydi?", "[func:LostKidFace,base_close,-][waitall:4][w:3]...", "[func:LostKidFace,hope_base,+]Sanırım[waitall:4][w:3]...[waitall:1][w:3] Anladım.", "[func:LostKidFace,hope_cheers,+]Kuklacı oyuna \nkatıldı.[w:6] Ve beni \nkullanmaya \nçalışıyor.", "[func:LostKidFace,hope_close,-]Partner[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,hope_determined,+]Henüz \npes edemezsin!", "[func:LostKidFace,hope_question,+]Eğer hala ordaysan \nve beni ö ldürmek istemiyorsan[waitall:4][w:3]...", "[func:LostKidFace,hope_smile,+]Sanırım sana ikinci \nbir şans verebilirim.", "[func:LostKidFace,hope_cheers,+]Beraber onu \nyeneceğiz.[w:6] Sadece \nkontrolü \nkaybetme!","[func:LostKidFace,hope_base,+][next] "}
					end
					for i=1,#dial do
						dial[i]="[noskip][effect:none]"..dial[i].."[w:20][next] "
					end
					enemies[1].SetVar("currentdialogue",dial)
					elseif rand==1 then
					local dials={}
					if lang=="rus" then
						dials={"Это[waitall:4][w:3]...[waitall:1][w:3] Было близко","Почему же я не вижу \nудары[waitall:4][w:3]?..[waitall:1][w:3]","От тебя исходит \nужасающая аура[waitall:4][w:3]...[waitall:1][w:3] \nНоги сами \nдвижутся."}
						else
						dials={"That[waitall:4][w:3]...[waitall:1][w:3] Bu yakındı.","Neden slashler \ngörmüyorum[waitall:4][w:3]?..[waitall:1][w:3]","Etrafında korkunç \nbir aura görüyorum[waitall:4][w:3]...[waitall:1][w:3] \nBacaklarım kendi \nkendine hareket ediyor."}
					end
					dial=dials[math.random(#dials)]
					dial={dial}
					dial[#dial+1]="[next] "
					enemies[1].SetVar("currentdialogue",dial)
					else
					local dials={}
					enemies[1].Call("LostKidFace",{"shocked","+"})
					if lang=="rus" then
						dials={{"Кгх[waitall:4][w:3]...[waitall:1][w:3]","Я[waitall:4][w:3]...[waitall:1][w:3] Я в порядке, \nпартнёр[waitall:4][w:3]...[waitall:1][w:3] \nНе переживай"},{"Это[waitall:4][w:3]...[waitall:1][w:3]","Это просто \nцарапина[waitall:4][w:3]...[waitall:1][w:3] \nБлять[waitall:4][w:3]...[waitall:1][w:3] Ргх"},{"Ха[waitall:4][w:3]...[waitall:1][w:3] Ха[waitall:4][w:3]...[waitall:1][w:3]","Дышать[waitall:4][w:3]...[waitall:1][w:3] \nРовно[waitall:4][w:3]...[waitall:1][w:3]","Уф."},{"Эта боль ничто, \nправда[waitall:4][w:3]...[waitall:1][w:3]","Твою мать, но как же \nбольно[waitall:4][w:3]...[waitall:1][w:3]"}}
						else
						dials={{"Ugh[waitall:4][w:3]...[waitall:1][w:3] ","I[waitall:4][w:3]...[waitall:1][w:3] Ben iyiyim, \npartner[waitall:4][w:3]...[waitall:1][w:3] \nEndişelenme"},{"Bu[waitall:4][w:3]...[waitall:1][w:3]","Bu bir \nçöp[waitall:4][w:3]...[waitall:1][w:3] \nHassiktir[waitall:4][w:3]...[waitall:1][w:3] Rgh."},{"Ha[waitall:4][w:3]...[waitall:1][w:3] Ha[waitall:4][w:3]...[waitall:1][w:3]","Nefes al[waitall:4][w:3]...[waitall:1][w:3] \nSakince[waitall:4][w:3]...[waitall:1][w:3]","Huff."},{"Bu acı bir hiçg, \nCiddiyim[waitall:4][w:3]...[waitall:1][w:3]","Fakat, ugh, bu birazcık \nacıtıyor[waitall:4][w:3]...[waitall:1][w:3]"}}
					end
					local dial=dials[math.random(#dials)]
					dial[#dial+1]="[noskip][func:LostKidFace,hope_base,+][next] "
					enemies[1].SetVar("currentdialogue",dial)
				end
				if rand==1 then
					evadelevel=2
					enemies[1].SetVar("dodge",true)
					else
					evadelevel=6
					enemies[1].SetVar("dodge",false)
				end
				PossessedTime=-1
			end
			PossessedTime=PossessedTime+1
		end
	end
end
if IsTalk==true then
	if voicetime<60 then
		voicetime=voicetime+2
		if voicetime>60 then
			voicetime=60
		end
	end
	if NewAudio.Exists(curmusic) then
		NewAudio.SetVolume(curmusic,1-0.80*math.sin(voicetime*math.pi/120))
	end
	else
	if voicetime>0 then
		voicetime=voicetime-1
		if NewAudio.Exists(curmusic) then
			NewAudio.SetVolume(curmusic,1-0.80*math.sin(voicetime*math.pi/120))
		end
	end
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
num1.Set("system/"..color.."/number/"..math.floor(Player.hp/10))
num2.Set("system/"..color.."/number/"..Player.hp%10)
num3.Set("system/"..color.."/number/"..math.floor(MaxHP/10))
num4.Set("system/"..color.."/number/"..MaxHP%10)
if not GetGlobal("burn") then
	elseif GetGlobal("burn")>0 then
	local burn=GetGlobal("burn")
	br.Set("burn/1")
	if burn>Player.hp-1 then
		SetGlobal("burn",Player.hp-1)
		burn=Player.hp-1
	end
	br.Scale(burn*109/92,1)
	if burn>0 then
		burntime=burntime+1
		num1.color={1,0.5,0.15234375}
		num2.color={1,0.5,0.15234375}
		num3.color={1,0.5,0.15234375}
		num4.color={1,0.5,0.15234375}
		system.color={1,0.5,0.15234375}
		br.MoveTo(276+(109/92)*Player.hp-burn/184*109,70)
	 	if burntime%180==0 and burn-burn%1<3 then 
			Player.hp=Player.hp-1
			burntime=burntime-150
			SetGlobal("burn",burn-1)
			elseif burntime%(100/(burn-burn%1)-100/(burn-burn%1)%1)==0 then
			Player.hp=Player.hp-1
			burntime=burntime-(100/(burn-burn%1)-100/(burn-burn%1)%1)
			SetGlobal("burn",burn-1)
		end
		else
		burntime=0
		num1.color={1,1,1}
		num2.color={1,1,1}
		num3.color={1,1,1}
		num4.color={1,1,1}
		system.color={1,1,1}
	end
	elseif GetGlobal("curse")==0 then
	num1.color={1,1,1}
	num2.color={1,1,1}
	num3.color={1,1,1}
	num4.color={1,1,1}
	system.color={1,1,1}
	burntime=0
	br.Set("burn/0")
end
if sleep==true then
	nextwaves={"nonestatetwo"}
end
if knifereload>0 and Achiventor.Time==0 then	
	knifereload=knifereload-1
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
		WasHitted(30)
		if diff==4 then
			GotAchivement(10)
		end
			
		for i=1,15 do
			DoBlood(1)
		end
	end
end
if GetGlobal("charaisdead")==12 then
		SetGlobal("charaisdead", 13)
		local dial={}
		if lang=="rus" then
			--enemies[1].SetVar("currentdialogue", rusout)
			if dubbing==true then
				dial=rusout
				else
				dial=rusoutn
			end
			elseif lang=="eng" then
			if dubbing==true then
				dial=engout
				else
				dial=engoutn
			end
		end
		for i=1,#dial do
			if i<#dial-1 then
				if dubbing==false then
					dial[i]="[effect:none][noskip]"..dial[i]
					else
					dial[i]="[effect:none][noskip][novoice]"..dial[i]
				end
				else
				if dubbing==false then
					dial[i]="[effect:shake][noskip][color:808080]"..dial[i]
					else
					dial[i]="[effect:shake][noskip][color:808080][novoice]"..dial[i]
				end
			end
		end
		
		enemies[1].SetVar("currentdialogue", dial)
		State("ENEMYDIALOGUE")
end
if Input.Confirm==1 and Player.absx>274 and Player.absx<387 and Player.absy<86 and Player.absy>54 and GetGlobal("charaisdead")>0 and knifereload==0 and knifestage<4  then
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
		pageblank.sprite.Set(lang.."/Battle/"..page)
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
		pageblank.sprite.Set(lang.."/Battle/"..page)
	end
	if Input.Cancel==1 then
		if itemamount>4 then
			pageblank.Remove()
		end
		Selecting=false
		enemies[4].Call("SetActive",false)
		enemies[1].Call("SetActive",true)
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
if mercymenu==false then
	elseif mercymenu==true then
	State("ENEMYSELECT")
	if Input.Confirm==1 then
		enemies[3].Call("SetActive",false)
		HandleSpare()
		mercymenu=false
	end
	if Input.Cancel==1 then
		mercymenu=false
		enemies[3].Call("SetActive",false)
		enemies[1].Call("SetActive",true)
	end
end
if not GetGlobal("fightbegin") then
	elseif GetGlobal("fightbegin")==true then
	if not enctimer then
		SetGlobal("facial_expression",19)
		if wons==1 then
			enemies[1].Call("LostKidFace",{"base","+"})
		end
		enctimer=0
		overworldface.Remove()
		SetMusic("none")
		introinprogress=false
		savex=fPlayer.x
		savey=fPlayer.y
		elseif enctimer==true then
		else
		enctimer=enctimer+1
		if enctimer<23 and enctimer%7==1 then
			Audio.PlaySound("BeginBattle2")
			if enctimer==8 or enctimer==22 then
				overworldfonebattle.sprite.alpha=1
				fPlayer.sprite.SendToTop()
				fPlayer.sprite.alpha=1
				overworldfrisk.sprite.SendToBottom()
				overworldchara.sprite.SendToBottom()
				overworldfone1.sprite.SendToBottom()
				overworldfone2.SendToBottom()
				elseif enctimer==15 then
				overworldfonebattle.sprite.alpha=0
				fPlayer.sprite.SendToBottom()
				fPlayer.sprite.alpha=0
				overworldfone1.sprite.SendToTop()
				overworldfone2.SendToTop()
				overworldfrisk.sprite.SendToTop()
				overworldchara.sprite.SendToTop()
			end
		end
		if enctimer==30 then
			overworldfone1.Remove()
			overworldfone2.Remove()
			overworldfone3.Remove()
			overworldfonetop.Remove()
			overworldfrisk.Remove()
			overworldchara.Remove()
		end
		if enctimer==30 then
			Audio.PlaySound("BeginBattle3")
		end
		if enctimer>30 and enctimer<119 then
			fPlayer.sprite.SendToTop()
			fPlayer.sprite.alpha=1
		end
		if enctimer>30 and enctimer<76 then
			local Old=0.5+0.5*math.cos((enctimer-30)*math.pi/45)
			fPlayer.MoveTo(savex*Old,savey*Old,true)
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
					comm="Последний актер на сцене!"
					else
					comm="Son aktör sahnede!"
				end
				if lang=="rus" then
					if dubbing==true then
						dial={"[noskip][func:DUB,prolog/17][w:3]На [w:1]улице [w:1]такой \nзамечательный день.","[noskip][func:DUB,prolog/18][w:1]Я чувствую запах \nкрови, \nбурлящей в моих[w:3] \nвенах.","[noskip][func:DUB,prolog/19][w:1]И даже если все мои \n[w:1]близкие [w:2]мертвы[waitall:5]...","[noskip][func:DUB,prolog/20][w:1]Мне всё ещё [w:1]есть \n[w:1]за что бороться.","[func:Peachy][noskip][func:DUB,prolog/21][w:5]Знаешь,[w:20] [func:normal]я[w:5] сочинила \nдля тебя [w:1]стих.","[noskip][func:Peachy][func:DUB,prolog/22][w:1]Он [waitall:2]начинается [waitall:1][w:3]вот \nтак:","[noskip][waitall:2][func:DUB,prolog/23][w:1][waitall:1]Чу[w:1]де[w:1]сн[w:1]ый[w:1] де[w:1]нёк[w:1] \nпо[w:1]дх[w:1]од[w:1]ит[w:1] к[w:1] ко[w:1]нцу[waitall:4][w:3]...","[noskip][func:DUB,prolog/24][waitall:2]И птички[waitall:1] [waitall:2]поют,[waitall:1][w:2]\n[waitall:2]им [waitall:1]ст[w:1]ра[w:1]х[w:2] не[w:1] к[w:1] лицу[waitall:4][w:3]...","[noskip][func:DUB,prolog/25][w:5]И [w:2]чувс[w:1]твуя[w:1] си[w:1]лу[w:1],\nч[w:1]то[w:1] тв[w:1]ое[w:1]й [w:1]не[w:1] б[w:1]ыл[w:1]а[waitall:4][w:3]...","[noskip][func:TakeKnife][func:head][effect:none][novoice][waitall:3][color:ff0000][func:DUB,prolog/26][w:4][waitall:1]СЕЙ[w:1]ЧАС[w:1] [waitall:1]ВЫ[w:1]ПЬЕ[w:1]ШЬ \n[waitall:2]ЧАШУ ИЗ БОЛИ\nДО [waitall:4][func:Devil,night]ДНА![w:10][next] "}
						else
						dial={"[noskip][func:DUB,prolog/17]На улице такой \nзамечательный день.","[noskip][func:DUB,prolog/18]Я чувствую запах \nкрови,[w:3] \nбурлящей в моих \nвенах.","[noskip][func:DUB,prolog/19]И даже если все мои \nблизкие мертвы[waitall:4][w:3]...","[noskip][func:DUB,prolog/20]Мне всё ещё есть \nза что бороться.","[func:Peachy][noskip][func:DUB,prolog/21]Знаешь,[w:12] [func:normal]я сочинила \nдля тебя стих.","[noskip][func:Peachy][func:DUB,prolog/22]Он начинается вот \nтак:","[noskip][waitall:2][func:DUB,prolog/23]Чудесный денёк \nподходит к концу[waitall:4][w:3]...","[noskip][func:DUB,prolog/24][waitall:2]И птички поют,[w:6]\nим страх не к лицу[waitall:4][w:3]...","[noskip][func:DUB,prolog/25]И чувствуя силу,[w:6]\nчто твоей не была[waitall:4][w:3]...","[noskip][func:TakeKnife][func:head][effect:none][novoice][color:ff0000][func:DUB,prolog/26]СЕЙЧАС ВЫПЬЕШЬ \n[waitall:2]ЧАШУ ИЗ БОЛИ\nДО [waitall:4][func:Devil,night]ДНА![w:10][next] "}
					end
					if quick==true then
						dial={"[noskip][func:TakeKnife][func:head][effect:none][novoice][waitall:3][color:ff0000][func:DUB,prolog/26][w:4][waitall:1]СЕЙ[w:1]ЧАС[w:1] [waitall:1]ВЫ[w:1]ПЬЕ[w:1]ШЬ \n[waitall:2]ЧАШУ ИЗ БОЛИ\nДО [waitall:4][func:Devil,night]ДНА![w:10][next] "}
					end
					elseif lang=="eng" then
					if quick==true then
						dial={"[noskip][func:TakeKnife][func:head][effect:none][novoice][waitall:5]ДО [color:ff0000][func:Devil,night]ДНА![w:10][next] "}
						else
						dial={"[func:DUB,prolog/17][noskip]Bugün çok canlı \nbir [w:1]gün.","[func:DUB,prolog/18][noskip]Kanımın kaynadığını [waitall:2]\nhissedebiliyorum.","[func:DUB,prolog/19][noskip]Dostlarım artık \nyok olmuş [w:6]olsa bile[waitall:5]...","[func:DUB,prolog/20][noskip]Hala [waitall:2]sana karşı\n[waitall:1][w:7]çıkmak [speed:1.5]için bir[speed:1]\nnedenim [w:1]var.","[func:DUB,prolog/21][func:Peachy][noskip]Neredeyse \nunutuyordum,[w:15] [func:normal]\nSana bir şiir yazdım.","[func:DUB,prolog/22][noskip][func:Peachy][w:3]Şöyle [w:10]başlıyor \n[w:6]...","[func:DUB,prolog/23][noskip]Ha[w:1]ri[w:1]ka [w:1]bir gün[w:4] \ndaha bitiyor[waitall:4][w:3]...","[func:DUB,prolog/24][noskip]Kuşlar [w:4]hala \ncıvıldıyor,[w:5]\ntehlikeyi [w:1]göz ardı \nederek[waitall:4][w:3]...","[func:DUB,prolog/25][noskip]Ve sende bile \nolmayan \ngücü[w:7] \nhissediyorlar[waitall:4][w:3]...","[func:DUB,prolog/26][noskip][func:TakeKnife][func:head][effect:none][novoice][color:ff0000]HER [w:1]HARE[w:2]KE[w:1]TİN İÇİN [w:2]\nACI [w:1]ÇEK[w:1]MEYE[w:2]\n[waitall:2]HAZ[func:Devil,night]IR[w:5]LAN![w:20][next] "}
					end
				end
				dial=EveryDial(dial,"[effect:twitch,1][noskip]","[novoice]")
				globalstage="1"
				if wons==1 then
					nextwaves={"nothing"}
					globalstage="6"
					if lang=="rus" then
						dial={"[func:LostKidFace,base_up,+][waitall:4][w:3]...[waitall:1][w:3]Я даже от страха \nсмерти забыла свою \nречь[waitall:4][w:3]...","[func:LostKidFace,base_left,+]Что-то там о пыли,[w:3] \nдне[waitall:4][w:3]...","[func:LostKidFace,base_close,-]Какая разница.","[func:LostKidFace,base,+]Слушай,[w:3] это \nочевидно, что я не \nсправлюсь,[w:3] раз уже \nоднажды проиграла.","[func:LostKidFace,confused,+]Это убийственная \nбессмыслица.[w:6] \nБуквально.","[func:LostKidFace,base_close,-]Поэтому вместо боя \nдавай поговорим.","[func:LostKidFace,base_left,+]Ну,[w:3] я буду говорить,[w:3] \nа ты уклоняться от \nнелепых потуг,[w:3] \nкоторые называют \nатаками.","[func:Achivement][func:SetMusic,lost][next] "}
						comm="Занятно.[w:6]\nНесколько сюжетных поворотов моему шоу не помешают."
						else
						dial={"[func:LostKidFace,base_up,+][waitall:4][w:3]...[waitall:1][w:3]Uhm... \nAslında hiç \nrepliğimi unutmamıştım[waitall:4][w:3]...","[func:LostKidFace,base_left,+]Toz ve güneş ile \nalakalıydı[waitall:4][w:3]...","[func:LostKidFace,base_close,-]Her neyse.","[func:LostKidFace,base,+]Baksana,[w:3] zaten bir kere \nöldükten sonra \ntekrar sağ çıkamayacağım \nçok belli.","[func:LostKidFace,confused,+]Bu bir \nkısır döngü.[w:6] \nCidden.","[func:LostKidFace,base_close,-]Birazcık \nsohbet edelim.","[func:LostKidFace,base_left,+]Kısaca,[w:3] seninle konuşurken \no atak denilen \nmantıksız \nşeylerden \nkaçacaksın.","[func:Achivement][func:SetMusic,lost][next] "}
						comm="İlginç.[w:6] \nBazı ters köşeler gösteriye katkı sağlayacaktır."
					end
					enemies[1].SetVar("dodge",false)
					enemies[1].SetVar("block",false)
					deadlyhit=true
					evadelevel=6
					FightGoes=false
					if Achivements[4]=="0" then
						dial[#dial]="[noskip][instant][novoice]"..dial[#dial-1].."[instant:stop][func:Achivement][w:90][func:SetMusic,lost][next] "
					end
					dial=EveryDial(dial,"[effect:none][noskip]","")
				end
				WriteSavio()
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
if GetGlobal("charaisdead")==9 and sleep==true then
	SetGlobal("charaisdead",10)
	useknife=CreateProjectile("system/useknife"..lang,0,0)
end
if not GetGlobal("charaisdead") then
	elseif GetGlobal("charaisdead")<7 then
	if Player.hp>MaxHP then
		Player.hp=MaxHP
	end
	hppoint.x=276+109*(Player.hp/MaxHP)/2
	hppoint.Scale(109*Player.hp/MaxHP,1)	
	br.SendToTop()
	cr.SendToTop()
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
		overworldfrisk.sprite.Scale(2.5,2.5)
		overworldface.sprite.alpha=0
		elseif introtimer==true then
		else introtimer=introtimer+1
		if introtimer<21 then
			overworldfrisk.Move(2,0)
		end
		if introtimer==21 then
			overworldfrisk.sprite.Set("overworld/frisk")
			overworldfrisk.sprite.Scale(2.5,2.5)
		end
		if introtimer==80 then
			local dial=""
			if lang=="rus" then
				if dubbing==true then
					dial={"[next] ","[func:face,yes][font:overworld][effect:twitch,1][func:NoMercy1][color:ffffff][func:DUB,prolog/9]*[waitall:5]...[waitall:3] Ясно.", "[func:DUB,prolog/10][w:4]*[effect:twitch,1][waitall:2]Хех[waitall:5]...[waitall:1][w:3]\n[func:Danger]Даже смешно [waitall:2]отчасти.", "[func:NoMercy1][waitall:5]...","[func:DUB,prolog/11][w:3]*Я не буду утруждать \nсебя [w:1]раз[w:1]ъяс[w:1]нен[w:1]ия[w:1]ми[waitall:1] терминов.","[noskip][func:DUB,prolog/12][w:6][waitall:1]*На [w:2]самом [w:2]деле,[w:10] ты и \nтак [w:1]их знаешь[waitall:5]...[waitall:1]\n[w:12][func:Danger1][waitall:1]Не [w:1]так [w:1]ли?=)[w:50][func:ph2][func:face,no][next] "}
					else
					dial={"[next] ","[func:face,yes][font:overworld][effect:twitch,1][func:NoMercy1][color:ffffff][func:DUB,prolog/9]*[waitall:4][w:3]... Ясно.", "[func:DUB,prolog/10]*[effect:twitch,1]Хех[waitall:4][w:3]...[waitall:1][w:3]\n[func:Danger]Даже смешно отчасти.", "[func:NoMercy1][waitall:4][w:3]...","[func:DUB,prolog/11]*Я не буду утруждать \nсебя разъяснениями терминов.","[noskip][func:DUB,prolog/12]*На самом деле,[w:3] ты и \nтак их знаешь[waitall:4][w:3]...[waitall:1]\n[w:12][func:Danger1]Не так ли?=)[w:50][func:ph2][func:face,no][next] "}
				end
				elseif lang=="eng" then
				dial={"[next] ","[func:DUB,prolog/9][func:face,yes][font:overworld][effect:twitch,1][func:NoMercy1][color:ffffff]*[waitall:5]...[waitall:1] Oh, [w:8][waitall:2]anlıyorum.", "[func:DUB,prolog/10][effect:twitch,1]*Heh[waitall:5]...[waitall:1][w:5]\n[func:Danger]Bu [w:12]bir [w:1]şekilde [w:1]komik[w:4].", "[func:NoMercy1][waitall:5]...","[func:DUB,prolog/11]*[w:5]Sana terbiye kurallarını \nöğreterek kendimi \nyormayacağım.","[func:DUB,prolog/12][noskip]*[w:1]Zaten öğrenemezsin[waitall:5]...[waitall:1]\n[w:14][func:Danger1]Değil [w:3]mi? =)[w:50][func:ph2][func:face,no][next] "}
			end
			dial=EveryDial(dial,"[noskip][font:overworld][effect:twitch,1][color:ffffff]","[novoice]")
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
		overworldfrisk.sprite.Scale(2.5,2.5)
		overworldface.sprite.alpha=0
		elseif introtimer==false then
		else introtimer=introtimer+1
		if introtimer<21 then
			overworldfrisk.Move(2,0)
		end
		if introtimer==21 then
			overworldfrisk.sprite.Set("overworld/frisk")
			overworldfrisk.sprite.Scale(2.5,2.5)
		end
		if introtimer==80 then
			local dial=""
			if lang=="rus" then
				if dubbing==true then
					dial={"[func:face,yes][next] ","[effect:twitch,1][font:overworld][color:ffffff][func:NoMercy1][func:DUB,prolog/13][w:10]*вздох*","[func:NoMercy1][func:DUB,prolog/14][w:9]*Вечно тянуть момент \nневозможно.","[func:DUB,prolog/15][w:3]*И раз [w:1]мой мир обречён \n[w:2]опять [w:2]исчезнуть[waitall:5]...","[func:NoMercy1][func:DUB,prolog/16][w:2]*Я хотя бы попробую \nзаставить исчезнуть [w:5]\n[color:ff0000][waitall:2]тебя[color:ffffff].","[func:fightbegin][func:face,no][next] "}
					else
					dial={"[func:face,yes][next] ","[effect:twitch,1][font:overworld][color:ffffff][func:NoMercy1][func:DUB,prolog/13][waitall:2]*вздох*","[func:NoMercy1][func:DUB,prolog/14]*Вечно тянуть момент \nневозможно.","[func:DUB,prolog/15][w:3]*И раз мой мир обречён \nопять исчезнуть[waitall:4][w:3]...","[func:NoMercy1][func:DUB,prolog/16]*Я хотя бы попробую \nзаставить исчезнуть [w:3]\n[color:ff0000][waitall:2]тебя[color:ffffff].","[func:fightbegin][func:face,no][next] "}
				end
				elseif lang=="eng" then
				dial={"[func:face,yes][next] ","[func:DUB,prolog/13][effect:twitch,1][font:overworld][color:ffffff][func:NoMercy1][w:9][waitall:2]*hüff*","[func:DUB,prolog/14][func:NoMercy1]*[w:9]Hiç bir şey [w:1]sonsuza kadar \n[w:1]sü[w:1]re[w:1]mez[w:2].","[func:DUB,prolog/15]*Ve dünyamın \nka[w:1]de[w:1]ri [w:9]toz olmak [w:1]ise[waitall:5]...","[func:DUB,prolog/16][func:NoMercy1]*[w:4]En azından [speed:1.25][color:ff0000][waitall:2]SENİ[speed:1][color:ffffff]\ntoz etmeyi [w:12]deneyeceğim[waitall:1][w:14].","[func:fightbegin][func:face,no][next] ","[func:fightbegin][func:face,no][next] "}
			end
			dial=EveryDial(dial,"[noskip][font:overworld][effect:twitch,1][color:ffffff]","[novoice]")
			enemies[5].SetVar("currentdialogue",dial)
			SetGlobal("phase1",0)
			State("ENEMYDIALOGUE")
		end
	end
end
if not GetGlobal("curse") then
	elseif GetGlobal("curse")>0 then
	if GetGlobal("curse")>Player.hp and systemfight==false then
		SetGlobal("curse",Player.hp)
	end
	cr.Scale(GetGlobal("curse")*109/MaxHP,1)
	cr.alpha=1
	local c=GetGlobal("curse")
	if systemfight==true then
		if Possessed==true then
			system.color = cr.color
       			num1.color = cr.color
	       		num2.color = cr.color
       			num3.color = cr.color
		       	num4.color = cr.color
			else
			system.color={1,1,1}
			num1.color={1,1,1}
			num2.color={1,1,1}
			num3.color={1,1,1}
			num4.color={1,1,1}
			local free=MaxHP-Player.hp
			if c>free and Player.hp>1 then
				Player.hp=Player.hp-1
			end
		end
		else
		system.color = {123/256,0,27/256}
       		num1.color = {123/256,0,27/256}
	       	num2.color = {123/256,0,27/256}
       		num3.color = {123/256,0,27/256}
	       	num4.color = {123/256,0,27/256}
	end
	system.alpha=1
	num1.alpha=1
	num2.alpha=1
	local x=54.5-(109/MaxHP)*(c/2+cursedinteger*(MaxHP-Player.hp))
	cr.MoveTo(330.5+x,70)
	elseif GetGlobal("curse")==0 and GetGlobal("burn")==0 then
        system.color = {1,1,1}
        num1.color = {1,1,1}
        num2.color = {1,1,1}
        num3.color = {1,1,1}
        num4.color = {1,1,1}
	cr.alpha=0
end

alltimer = alltimer+1 --да, мы долго к этому шли
if GetGlobal("judge") then
	if systemfight==false then
		if GetGlobal("curse")==Player.hp then
			if cursedtime==0 then
				State("NONE")
				cursedtime=1
				placestompx=Player.x
				healthstomp=Player.hp
				else cursedtime=cursedtime+1
			end
			Player.MoveTo(placestompx+(1+cursedtime/18)*math.sin(cursedtime*math.pi/6),Player.y,true)
			if cursedtime%12==0 then
				Audio.PlaySound("hurtsound")
			end
			if cursedtime%6==0 then
				if cursedtime<180 then
					local h=math.floor(healthstomp*(180-cursedtime)/180)
					if h<1 then
						h=1
					end
					Player.hp=h
					SetGlobal("curse",h)
					else Player.hp=1
					SetGlobal("judge",false)
					cursedtime=0
					SetGlobal("curse",0)
					SetGlobal("Playerisdead",true)
				end
			end
			elseif GetGlobal("curse")>0 then
			cursedtime=cursedtime+1
			if cursedtime>40 then
				SetGlobal("curse",0)
				cr.Scale(0,1)
				cr.alpha=1
				cursedtime=0
				SetGlobal("judge",false)
				else cr.alpha=1-0.025*cursedtime
			end
			else SetGlobal("judge",false)
		end
		else
		if Possessed and PossessedTime==0 then
			SetGlobal("curse",MaxHP-Player.hp)
			PossessedTime=31
			State("NONE")
			elseif Possessed==false and MyState=="NONE" then
			State("NONE")
			if ButtonUsed==1 then
				Player.MoveToAbs(48,25,true)
				elseif ButtonUsed==2 then
				Player.MoveToAbs(202,25,true)
				elseif ButtonUsed==3 then
				Player.MoveToAbs(361,25,true)
				elseif ButtonUsed==4 then
				Player.MoveToAbs(515,25,true)
				else
				Player.MoveToAbs(320,25,true)
			end
			MyState="DownFight"
			SetGlobal("curse",0)
		end
		SetGlobal("judge",false)
	end
end
	if(Player.absy == 25) and GetCurrentState()=="ACTIONSELECT" then -- Сердечко игрока в нижнем ряду с кнопками.\
		fightstage = 0
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
			--[[if systemfight==false then
				Player.MoveTo(Player.x-3,Player.y,true)
			end
			if mercypoint==4 then
				Player.MoveTo(Player.x-3,Player.y,true)
			end]]
			SetGlobal("button",2)
		end
		if lastbutton==3 and Input.Confirm==1 and enemies[4].GetVar("used")==false and systemfight==false and (GetGlobal("charaisdead")<2 or wons>0) then
			if CharaIsRaging==true then
				if MenuBullets==true then
					MenuBullets=false
					ButtonsTime=30
					
					else
					State("NONE")
				end
				else
				page=1
				enemies[4].Call("Firstpage")
				enemies[1].Call("SetActive",false)
				enemies[2].Call("SetActive",false)
				enemies[4].Call("SetActive",true)
				Selecting=true
				if itemamount>4 then
					pageblank=CreateProjectile(lang.."/Battle/1",90,-35)
				end
				State("ACTMENU")
			end
		end
		RedoBut(lastbutton)
	end
	if not quittimer then
		AnimateChara()
	end
	if Input.Menu == 1   then
		--[[
			mtt=CreateProjectileAbs("empty",320,222,"Top")
			mtt.sprite.Scale(3,3)
			mtt.sprite.Set("1.2/MTT/calm")
			mtt.sprite.alpha=1
			local dialy={"[waitall:4][w:3]...[waitall:2][w:3][func:MTT,calm]Хм.","[func:MTT,Thought]Полагаю,[w:9] [func:MTT,NothingNew]мы вновь скоро встретимся.","[func:MTT,NotPlaying]И всё-таки мне интересно[waitall:4][w:3]...","[func:MTT,punishment]Что ты нашел в ней?[w:9] [func:MTT,Just]Она же просто самоуверенная истеричка.","[func:MTT,Afraid]Полагаю,[w:6] тебе просто нравится смотреть за её страданиями,[w:6] ха?","[func:MTT,NotPersonal]Хе-хе[waitall:4][w:3]...[waitall:2][w:3] [func:MTT,Bisiness]До встречи[waitall:4][w:3]...[waitall:2][w:3][func:MTT,saw1][func:SetMusic,none][w:10][func:Mttsaw] [func:MTT,Adraid][waitall:4]актёр."}
			dialy=EveryDial(dialy,"[font:mtt][waitall:2][w:3][effect:twitch,1][noskip][color:ffffff]","")
			Mett=CreateText(dialy,{80,420},480,"Top",-1)
			Mett.progressmode="manual"
			Mett.HideBubble()]]
		
		--MettaName=true
		--comm="[func:state,NONE][color:8040ff][noskip]Прошу,[w:6] [waitall:2][func:Shake]ХВАТИТ![w:15][func:ENOUGH]"
		--Achivements[9]="0"
		--GotAchivement(9)
		--PlayerHasPlayedThisGame=true
		--WriteSavio()
		--DoAllPellets()
		--LostMercy=22
		--ToHappyEnd=1
		--ToHappyTitrs()
		--NewAudio.SetPlayTime("CaP",130)
		--Evrywhere=1
		--wons=1
		--FallingKnife.timer=1
		--epilog=true
		--enemies[1].Call("OnDeath")
		--Quiting()
		--SetGlobal("charaisdead", 12)
		--State("NONE")
		--MettaLost=0
		--SetMusic("titres")
		--PlaysIntro=true
		--prog=60
		--enemies[1].SetVar("dodge",false)
		--evadelevel=6
		--MettaName=true
		--SetGlobal("progress",prog)
		--enemies[1].Call("WON")
		--rus=enemies[1].GetVar("currentdialogue")
		--systemfight=true
		--NewAudio.PlaySound("Hits","healsound",false)
		--NewAudio.Stop("Hits")
		--cr.color={0.5,0.25,1}
		--cursedinteger=0
		--epilog=true
		--State("NONE")
		--BattleDialog("[noskip][waitall:1]Ты победил![w:10]\nТы получил 0 М и 50000 ОП\nТвой УР вырос![func:Level20][w:1800]")
		--State("NONE")
		--State("ENEMYDIALOGUE")
		--State("NONE")
		--globalstage="4"
		--prog=60
		--LostMercy=22
		--Titr1.phase=1
		--MyState="NONE"
		--Titr1.timer=-92
		--wons=1
		--Titr1.Buggy=CreateProjectileAbs("empty",320,240,"Top")
		--State("ACTIONSELECT")
		--deadlyhit=true
	end
if fighting==true then
	fighttimer=fighttimer+1
	if misstime==0 and slashtime<8870  then
		else
		if healthtime>0 then
			healthtime=healthtime-1
		end
	end
	local ch=chainsaw
	if fighttimer==1 then
		firsthp=enemies[1].GetVar("hp")
	end
	if misstime==1 then
		local miss=CreateProjectileAbs("system/MISS"..lang,centerlegs+charalegs.x,120)
		table.insert(damages,miss)
	end
	if fiststime%2==1  then
		if fiststime==1  then
			table.insert(pointers,pointer)
			pointer=CreateProjectile("system/pointer",-273,0)
			pointer.SetVar("time",0)
			fightspeed=8
			elseif fiststime==3 then
			table.insert(pointers,pointer)
			pointer=CreateProjectile("system/pointer",273,0)
			pointer.SetVar("time",0)
			fightspeed=12
		end
		fiststime=fiststime+1
		if fiststime==6 then
			table.insert(pointers,pointer)
			slashtime=8800
			canattack=false
		end
	end
	if enemies[1].GetVar("dodge")==false and enemies[1].GetVar("block")==false then
		Wounded(enemies[1].GetVar("hp"),firsthp)
	end
	enemyhp.x=-81+81/1500*enemies[1].GetVar("hp")
	enemynohp.SendToTop()
	enemyhp.SendToTop()
	enemyhp.Scale(162*(enemies[1].GetVar("hp"))/1500,1)
	enemynohp.x=2*distance2*math.sin(timestamp2*math.pi/6)+centerlegs+charalegs.x
	if healthtime<21 then
		local alp=math.sin(math.pi*healthtime/40)
		enemyhp.alpha=alp
		enemynohp.alpha=alp
	end
	if slashtime>0 then
		slashtime=slashtime+1
		if pointer.isactive and ch then
			local time=pointer.GetVar("time")+1
			pointer.SetVar("time",time)
			if time%20==0 then
				pointer.sprite.Set("system/pointer1")
				elseif time%20==10 then
				pointer.sprite.Set("system/pointer")
			end
		end
	end
	for i=1,#fists do
		local s=fists[i]
		if s.isactive then
			local time=s.GetVar("time")+1
			s.SetVar("time",time)
			if s.GetVar("type")=="fists" then
				if time%3==0 and time<34 then
					s.sprite.Set("fists/"..time/3)
					s.sprite.Scale(2.5,2.5)
				end
				if time==27 then
					DealDamage(s.GetVar("damage"))
				end
				if time==38 then
					s.Remove()
				end
				else
				if time==1 then
					if enemies[1].GetVar("dodge")==true then
						if GetGlobal("evasion")==0 then
							s.sprite.rotation=19+math.random(11)
							elseif GetGlobal("evasion")==2 then
							s.sprite.rotation=-(19+math.random(11))
						end
						else
						s.sprite.rotation=math.random(41)-21
					end
					s.sprite.Scale(2,2)
				end
				if time==60 then
					slashtime=8870
				end
				if time%10==0 and time<70 then
					s.sprite.Set("chainsaw/"..time/10)
					if time==64 then
						s.SetVar("top",{s.x-s.sprite.width*s.sprite.xscale/2*math.sin(s.sprite.rotation*math.pi/180),s.y+s.sprite.height*s.sprite.yscale/2*math.cos(s.sprite.rotation*math.pi/180),s.sprite.width})
					end
					s.SetVar("NowBegin",3)
					s.SetVar("NowDamage",0)
					s.SetVar("firsthp",enemies[1].GetVar("hp"))
					elseif time==58 or time==59 then
					local tim=s.GetVar("times")
					local dams=s.GetVar("damages")
					if s.GetVar("CharaIsDead")==true then
						local moment=s.GetVar("NowBegin")+1
						s.SetVar("NowBegin",moment)
						SetGlobal("facial_expression", 51)
						if moment%4==0 and moment<41 then
							local amm=moment/4
							local shows=s.GetVar("numbery")
							shows[11-amm].sprite.Set("system/damage/9")
							shows[10+amm].sprite.Set("system/damage/9")
							enemies[1].SetVar("hp",0)
							Wounded(0)
							WasHitted(1)
							healthtime=120
							enemyhp.alpha=1
							enemynohp.alpha=1
						end
						if moment==4 then
							standtime=0
							standnow=5
							standnew=5
						end
						Audio.PlaySound("hit")
						if moment<43 then
							s.SetVar("time",57)
							else
							local shows=s.GetVar("numbery")
							for i=1,#shows do
								table.insert(damages,shows[i])
							end
							s.SetVar("time",59)
						end
						elseif s.GetVar("isdamage")==false then
						s.SetVar("time",59)
						if prog==42 then
							SetGlobal("facial_expression", 62)
							DealDamage(1,false,"special1")
							else
							DealDamage(0,s.GetVar("why"))
						end
						elseif s.GetVar("CharaIsDead")==false then
						local nowdamage=s.GetVar("nowdamage")
						if tim%2==0 then
							nowdamage=nowdamage+dams[tim/2]
						end
						if tim%4==0 then
							if wons==0 or s.GetVar("bloods") then
								DoBlood(1)
							end
						end
						tim=tim-1
						s.SetVar("times",tim)
						local shows=s.GetVar("numbery")
						if tim>0 then
							s.SetVar("time",58)
						end
						local numbers=s.GetVar("numbers")
						if time==59 then
							timer1=0
						end
						if time==58 then
							SetGlobal("facial_expression", 51)
							standtime=0
							standnow=5
							standnew=5
							for i=1,#shows do
								table.insert(damages,shows[i])
								shows[i].SetVar("time",-tim-1)
							end
						end
						local newhp=s.GetVar("firsthp")-nowdamage
						if newhp<0 then
							newhp=0
						end
						healthtime=120
						enemyhp.alpha=1
						enemynohp.alpha=1
						enemies[1].SetVar("hp",newhp)
						Chainsaw(shows,nowdamage)
						s.SetVar("nowdamage",nowdamage)
						if tim%3==0 then
							Audio.PlaySound("hit")
						end
						if tim%4==0 then
							WasHitted(1)	
						end
					end
					elseif time==70 then
					s.Remove()
				end
			end
		end
	end

	if misstime>0 then
		misstime=misstime+1
	end
	if dodgetime>0 then
		dodgetime=dodgetime+1
		if TimeEvade(dodgetime)==true then
			if GetGlobal("evasion")>-1 then
				SetGlobal("evasion",GetGlobal("evasion")+1)
				dodgetime=0
				if prog==26 and wons==0 then
					SetGlobal("facial_expression",45)
				end
			end
		end
	end
	if fighttimer==1 then
		numbers=0
		target=1
		notarget=2
		if prog>43 or (prog==5 and wons==1) then
			slash_x=5
		end
		fightspeed=5
		targeting=CreateProjectile("system/target",0,0)
		pointer=CreateProjectile("system/pointer",279,0)
		pointer.SetVar("time",0)
	end
	if pointer.isactive and canattack==true then
		if ch==true or fiststime==0 or fiststime==4 then
			pointer.Move(-fightspeed,0)
			elseif fiststime==2 then
			pointer.Move(fightspeed,0)
		end
	end
	if (pointer.x<-274 or pointer.x>274) and pointer.isactive and fighttimer>1 then
		if misstime==0 and fiststime==0 then
			misstime=1
			canattack=false
			elseif fiststime>0 then
			slashtime=8870
		end
		fightspeed=0
		pointer.Remove()
	end
	if pointer.isactive and pointer.x>-fightspeed-1 and pointer.x<fightspeed+1 and slashtime==0 and forcedfight==true and canattack==true  then
		pointer.MoveTo(0,0)
		chainsaw=true
		if glitchedmercy>0 then
			glitchedmercy=1000
		end
		if wons==1 and prog==35 then
			DoSlash(10,fiststime)
			else
			DoSlash(1,fiststime)
		end
		dodgetime=1
		canattack=false
		if curmusic=="spare" or prog==26 then
			SlowingDown=true
		end
	end
	for i=1,#pointers do
		if pointers[i].isactive then
			if not pointers[i].GetVar("time") then
				pointers[i].SetVar("time",0)
			end
			local time=pointers[i].GetVar("time")+1
			pointers[i].SetVar("time",time)
			if time<60 then
				pointers[i].sprite.Scale(1+2*math.sin(time*math.pi/120),1+2*math.sin(time*math.pi/120))
				pointers[i].sprite.alpha=1-math.sin(time*math.pi/120)
				else
				pointers[i].Remove()
			end
		end
	end
	if Input.Confirm==1 and fighttimer>1 and slashtime==0 and misstime==0 and forcedfight==false and canattack==true then
		if curmusic=="spare" then
			SlowingDown=true
		end
		if wons==1 and prog==35 then
			DoSlash(10,fiststime)
			else
			DoSlash(10,fiststime)
		end
		if ch==true then
			canattack=false
			elseif fisttimes==4 then
			canattack=false
			fiststime=fiststime+1
			else
			fiststime=fiststime+1
		end
		if ch==true then
			dodgetime=1
			--slashtime=8750
		end
	end
	if TimeEvade(slashtime)==true and enemies[1].GetVar("dodge")==true then
		SetGlobal("evasion",GetGlobal("evasion")+1)
	end
	if slashtime>8999 or misstime>139 then
		if slashtime==9000 and glitchedmercy==0 and systemfight==false then
			prog=prog+1
			attacked=true 
			SetGlobal("progress",prog)
			if (prog<44 and wons==0) or (wons==1 and prog<6) then
				enemies[1].Call("HandleAttack")
				elseif ( prog==44 and wons==0 ) or ( wons==1 and prog==6 ) then
				enemies[1].Call("HandleAttack")
				else
				enemies[1].Call("HandleAttack")
			end
			elseif slashtime==9000 and systemfight==true and enemies[1].GetVar("hp")==0 then
			SetMusic("none")
			if lang=="rus" then
				BattleDialog("[noskip][color:8040ff][waitall:4][w:3]...[waitall:1][w:3]Я же говорил.[w:6]\nУ тебя нет ни шанса,[w:3] дорогуша.[w:60][func:LostHadLost]")
				else
				BattleDialog("[noskip][color:8040ff][waitall:4][w:3]...[waitall:1][w:3]Dediğim gibi.[w:6]\nBir şansın yoktu,[w:3] tatlım.[w:60][func:LostHadLost]")
			end
		end
		if misstime==140 and wons==1 and enemies[1].GetVar("LostGotMissed")==false then
			enemies[1].SetVar("LostGotMissed",true)
			if lang=="rus" then
				enemies[1].SetVar("currentdialogue",{"[effect:none][waitall:4][w:3]...[waitall:1][w:3]Это какая-то \nшутка,[w:6] которую я \nне понимаю?","[next] "})
				else
				enemies[1].SetVar("currentdialogue",{"[effect:none][waitall:4][w:3]...[waitall:1][w:3]Is this some \njoke,[w:6] that I don`t \nunderstand?","[next] "})
			end
			elseif misstime==140 and wons==1 then
			enemies[1].SetVar("currentdialogue","[next] ")
		end
		if evadelevel==5 then
			truedamage=1
		end
		canattack=true
		fighting=false
		fighttimer=0
		fightspeed=0
		slashtime=0
		misstime=0
		dodgetime=0
		pointers={}
		numbers=0
		healthtime=0
		fiststime=0
		pointer.Remove()
		if enemies[1].GetVar("hp")>2 and glitchedmercy==0 then
			State("ENEMYDIALOGUE")
		end
		if glitchedmercy==0 then
			targeting.Remove()
			else
			targeting.sprite.color={0,0,0}
		end
		fists={}
	end
end
for i=1,#damages do
	local number=damages[i]
	if number.isactive then
		if not number.GetVar("time") then
			number.SetVar("time",-1)
		end
		local time=number.GetVar("time")+1
		number.SetVar("time",time)
		if time>0 then
			number.MoveTo(number.x,120+75*math.sin(time*math.pi/100))
			else
			number.MoveTo(number.x,120+25*math.sin(time*math.pi/90))
		end
		if time==110 then
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
			local y=b.GetVar("speedy")
			local time=b.GetVar("time")+0.5
			if y==false then
				else
				b.x=b.x+x
				b.y=b.y+y
				b.SetVar("speedy",y-0.15)
			end
			if (b.y-0.5*b.yscale)<246 and not(y==false) then
				b.SetVar("speedy",false)
				b.SetVar("sy",b.yscale)
				b.SetVar("sx",b.xscale)
				b.SetVar("size",b.xscale*b.yscale)
				b.SetVar("speedy",false)
				b.y=244+b.yscale/2
			end
			if b.GetVar("speedy")==false then
				if b.yscale>2 then
					local sy=b.yscale-b.yscale/16
					if sy<2 then
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
					local newsx=sx+b.alpha*b.alpha*b.alpha*sx/8
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

if QuietMusic==true then
	QuietMusicTime=QuietMusicTime+1
	if QuietMusicTime==1 then
		lowmusicvolume=NewAudio.GetVolume(curmusic)
	end
	NewAudio.SetVolume(curmusic,lowmusicvolume*math.cos(QuietMusicTime*math.pi/420))
	if QuietMusicTime==210 then
		NewAudio.SetVolume(curmusic,1)
		SetMusic("none")
		QuietMusicTime=0
		QuietMusic=false
	end
end
if lowmusic==false then
	else 
	lowmusic=lowmusic+1
	if lowmusic==1 then
		lowmusicvolume=NewAudio.GetVolume(curmusic)
	end
	NewAudio.SetVolume(curmusic,lowmusicvolume*math.cos(lowmusic*math.pi/360))
	if lowmusic==180 then
		lowmusic=false
		SetMusic("none")
	end
end



end

function DoSlash(special,side)
	local type="fists"
	if chainsaw==true then
		type="chainsaw"
	end
	local where=charalegs.x+centerlegs
	if enemies[1].GetVar("dodge")==false then
		if systemfight==true then
			if GetGlobal("evasion")<2 then
				where=320
				else
				where=220
			end
			else
			where=320
		end
		else
		if GetGlobal("evasion")<2 then
			where=320
			else
			where=220
		end
	end
	if SuddenStrike==true then
		where=220
	end
	local slash=CreateProjectileAbs(type.."/0",where,320)
	slash.SetVar("type",type)
	slash.SetVar("time",0)
	table.insert(fists,slash)
	if wons==0 and prog>42 and prog<47 then
		for i=1,#ghostsnow do
			local str=currentspr.."/"
			if currentspr=="1.1.6" then
				str="1.1.7/"
			end
			local ghost=CreateProjectile(str..ghostsnow[i],320,200,"BelowPlayer")
			if str=="1.1.7/" then
				ghost.sprite.Scale(2,2)
			end
			ghost.sprite.SendToTop()
			ghost.SetVar("time",-30)
			ghost.SetVar("movi",-30)
			ghost.SetVar("stime",0)
			ghost.sprite.alpha=0
			table.insert(ghostsappeared,ghost)
		end
		ghostsnow={}
	end
	if chainsaw==true then
		slash.sprite.rotation=math.random(61)-31
		local times=1+44*math.cos(pointer.x*math.pi/(273*2))
		if systemfight==true then
			times=45
		end
		local damages={}
		local totaldamage=0
		for i=1,times do
			if systemfight==true then
				damages[i]=8
				else
				damages[i]=3+math.random(5)
			end
			totaldamage=totaldamage+damages[i]
		end
		local dam=totaldamage
		local numbers=0
		while (dam>0) do
			numbers=numbers+1
			dam=math.floor(dam/10)
		end
		local isdamage=true
		local why=false
		if enemies[1].GetVar("dodge")==true or enemies[1].GetVar("block")==true then
			isdamage=false
			if enemies[1].GetVar("dodge")==true then
				why="dodge"
				else
				why="block"
			end
		end
		if deadlyhit==true then
			why=false
			isdamage=true
			numbers=20
			slash.SetVar("CharaIsDead",true)
			slash.SetVar("AmmountOfNines",num)
			else
			slash.SetVar("CharaIsDead",false)
		end
		slash.SetVar("blood",special*2)
		slash.SetVar("shows",false)
		slash.SetVar("isdamage",isdamage)
		slash.SetVar("why",why)
		slash.SetVar("nowdamage",0)
		if wons==1 then
			local hp=enemies[1].GetVar("hp")
			local bloods=false
			if GotHits==0 and hp==1500 then
				bloods=true
				GotHits=1
				elseif GotHits==1 and hp==1140 then
				GotHits=2
				bloods=true
				elseif GotHits==2 and hp==780 then
				GotHits=3
				bloods=true
				elseif GotHits==3 and hp==420 then
				GotHits=4
				bloods=true
				elseif hp==60 then
				bloods=true
			end
			slash.SetVar("blooods",bloods)
		end
		if isdamage==true then
			local outgo={}
			if deadlyhit==true then
				numbers=20
			end
			local x=14.5+numbers*14.5+centerlegs+charalegs.x-320
			if SuddenStrike then
				x=x-100
				SuddenStrike=false
			end
			for i=1,numbers do
				local x1=x-29*i
				local number=CreateProjectile("empty",x1,140)
				number.sprite.color={1,0,0}
				number.sprite.SendToTop()
				outgo[i]=number
			end
			deadlyhit=false
			slash.SetVar("numbery",outgo)
		end
		slash.SetVar("times",#damages*2)
		slash.SetVar("damages",damages)
		slash.SetVar("numbers",numbers)
		if curmusic=="spare" and NewAudio.isStopped(curmusic)==false then
			else
			Audio.PlaySound("slice")
		end
		else
		Audio.PlaySound("slice2")
		slash.sprite.Scale(3,3)
		if side==0 or side==4 then
			slash.sprite.rotation=-90--31+math.random(61)
			else
			slash.sprite.rotation=90--31+math.random(61)
		end
		local firstdamage=0
		if pointer.x>0 then
			firstdamage=math.floor(Player_ATK*((273- pointer.x)/273)-3+math.random(5))
			else firstdamage=math.floor(Player_ATK*((273 + pointer.x)/273)-3+math.random(5))
		end
		firstdamage=firstdamage-enemies[1].GetVar("def")
		if enemies[1].GetVar("dodge")==true or enemies[1].GetVar("block")==true or firstdamage<0 then
			firstdamage=0
		end
		slash.SetVar("damage",math.floor(firstdamage))
	end
end
function DealDamage(enddamage,missy,extra)
	if missy=="dodge" or missy=="block" then
		enddamage=0
	end
	if  missy=="block"  then
		local number=CreateProjectileAbs("system/BLOCK"..lang,centerlegs+charalegs.x,140)
		table.insert(damages,number)
		Audio.PlaySound("hit")
		WasHitted(4)	
		elseif missy=="dodge" then
		local number=CreateProjectileAbs("system/MISS"..lang,centerlegs+charalegs.x,140)
		table.insert(damages,number)
		else
		if diff<3 then
			Player.Heal(enddamage)
		end
		local numberofblood=0
		local dam=enddamage
		while (dam>0 and numberofblood<50) do
			numberofblood=numberofblood+1
			dam=dam-2*numberofblood
		end
		enemies[1].SetVar("hp",enemies[1].GetVar("hp")-enddamage)
		healthtime=120
		enemyhp.alpha=1
		enemynohp.alpha=1
		if enemies[1].GetVar("hp")<0 then
			enemies[1].SetVar("hp",0)
		end
		dam=enddamage
		DamageNumbersNew(enddamage)
		for i=1,numberofblood do		
			DoBlood(extra)
		end
		Audio.PlaySound("hit")
		WasHitted(4)	
	end
	if extra=="special1" then
		blood.Set(currentspr.."/chara/check_blood")
		enemyhp.alpha=1
		enemynohp.alpha=1
	end
end


function DamageNumbersNew(number)
		local calcdamage=math.floor(number)
		local numbers=0
		if calcdamage>0 then
			while(calcdamage>0) do
				calcdamage=(calcdamage/10-(calcdamage/10)%1)
				numbers=numbers+1
			end
		end
		local enddamage=math.floor(number)
		for i=1,numbers do
			local number=CreateProjectile("system/damage/"..enddamage%10,19.5+numbers*14.5-29*i+centerlegs+charalegs.x-320,140)
			enddamage=(enddamage/10-(enddamage/10)%1)
			number.sprite.SendToTop()
			number.sprite.color={1,0,0}
			table.insert(damages,number)
		end
end

function Chainsaw(ingo,newdamage)
	local num=newdamage
	local amm=0
	while num>0 do
		num=math.floor(num/10)
		amm=amm+1
	end
	num=newdamage
	--Audio.PlaySound("hit")
	for i=1,amm do
		ingo[i].sprite.Set("system/damage/"..num%10)
		num=math.floor(num/10)
	end
end
		

function HandleSpare()
	local health = enemies[1].GetVar("hp")
	local bleeding = health -40
	enemies[4].Call("SetActive",false)
	enemies[3].Call("SetActive",false)
	enemies[1].Call("SetActive",true)
	if prog==26 and wons==0  then
		SetMusic("none")
		
		mercy=mercy+1
		enemies[1].Call("SetActive",true)
		local t={}
		if mercy==1 then
			if lang=="rus" then
				comm="[waitall:4][w:3]...[waitall:1][w:3]Это что,[w:3] какой-то эксперимент,[w:3] актёр?"
				t={"[func:closedyesend]Я так и знала-[w:6]\n[func:head4]Погоди[waitall:4][w:3]...","[func:QuietMusic][func:Suprise1][func:SetMusic,star]Ты пощадил меня[waitall:4][w:3]?..[waitall:1][w:3]\n[func:head4]В смысле[waitall:4][w:3]...","Я не понимаю,[w:3]\nпочему[waitall:4][w:3]...[waitall:1][w:3]\n[func:thoughtsleft]Почему именно я?","[func:sad]Тебе нравится\nсмотреть,[w:3] как я\nстрадаю?[w:9] [func:head4]Или что?","[func:Look][next] "}
				else
				comm="[waitall:4][w:3]...[waitall:1][w:3]Bu bir tarz deney mi,[w:3] aktör?"
				t={"[func:closedyesend]Beklediğim gib-[w:6][func:head4]\nBekle[waitall:4][w:3]...","[func:QuietMusic][func:Suprise1][func:SetMusic,star]Beni bağışladın mı[waitall:4][w:3]?..[waitall:1][w:3] [func:head4]\nNeden[waitall:4][w:3]...","Anlamıyorum,[w:3] neden[waitall:4][w:3]...[waitall:1][w:3] [func:thoughtsleft]\nNeden ben?","[func:sad]Acı çekişimi izlemek \nzevk mi veriyor?[w:12] [func:head4]\n...","[func:Look][next] "}
			end
			elseif mercy==2 then
			if lang=="rus" then
				comm="Я начинаю беспокоиться.[w:6] [color:8040ff]\nТы же не думаешь меня предать?"
				t={"[func:head4]И опять[waitall:4][w:3]...[waitall:1][w:3]","Никогда не думала,[w:3]\n[func:sad]что буду надеяться\nна то,[w:3] что ты\nударишь.","[func:head4]Знаешь,[w:3] это же был\nриторический\nвопрос[waitall:4][w:3]...[waitall:1][w:3]","[func:Suprise1][speed:0.75]В чем мне резон\nщадить тебя?[w:8] [func:head]\nЯ же сказала,[w:4]\nя не дура,[w:4]\nчтобы верить тебе."}
				else
				comm="Sinirlenmeye başlıyorum.[w:6] [color:8040ff]\nBana ihanet etmeye mi karar verdin?"
				t={"[func:head4]Ve yine[waitall:4][w:3]...","Asla [func:sad]bana \nvurman için bekleyeceğimi \ndüşünmezdim.","[func:head4]Biliyorsun,[w:3] Merhamet \nhakkında \nkonuşmuştum[waitall:4][w:3]...","[func:Suprise1][speed:0.[w:6]75]Neden seni \nbağışlamam gereksin?[w:6][w:8][func:head] \nDaha önce dediğim gibi,[w:3] \nSana inanacak bir \nzavallı değilim."}
			end
			elseif mercy==3 then
			if lang=="rus" then
				comm="[speed:0.75][color:8040ff]Даже не смей, дорогуша..."
				t={"[func:head4]Хватит[waitall:4][w:3]...","Серьезно,[w:6] [func:Look]хватит.[w:12]\n[func:sad]Это уже действует\nмне на нервы.","[func:head4]Если бы ты\n[speed:0.75][w:3]действительно[speed:1][w:3]\nхотел что-то\nизменить,[w:3] [func:Suprise1]тебя бы\nздесь не было\nсейчас!","[func:NoMercy1]Я знаю, как это\nбывает.[w:6] [func:Think]Ты щадишь\nменя,[w:3] а я убиваю\nтебя.","[func:NoMercy1]А в конце концов[w:3]\nвсё возвращается на\nкруги своя,[w:3][speed:0.75] ничего\nне меняя[waitall:4][w:3]...","[func:head4]Тот,[w:3] кто стоит над\nнами всеми,[w:3] не\nпозволит тебе\nсоскочить,[w:3] [func:Suprise1]ты же\nпонимаешь это?","[func:head4]Зачем давать мне\nложную надежду,[w:3]\nпартнёр[waitall:4][w:3]...","[waitall:4][w:3]...[waitall:1][w:3][func:sad]Если это все ещё\nты,[w:3] конечно же[waitall:4][w:3]...","[func:Look][next] "}
				else
				comm="[speed:0.75][color:8040ff]Sakın cürret etme aşkım..."
				t={"[func:head4]Git[waitall:4][w:3]...","Ciddiyim,[w:3] [func:Look]git artık.[w:6] [func:sad]\nÇoktan \nyoruldum bile.","[func:head4]Cidden [speed:0.[w:6]75][w:3]bir şeyi[speed:1][w:3] değiştirmek \nistiyorsan,[w:3] [func:Suprise1]\nşu an burda \nolmamalısın!","[func:NoMercy1]Nasıl çalıştığını biliyorujm.[w:6] [func:Think]\nBeni bağışlıyorsun ve \nsonra seni öldürüyorum.","[func:NoMercy1]Ve en sonunda \nhiç bir şey \ndeğişmiyor[waitall:4][w:3]...","[func:head4]Bu \ngerçekleşmeyece,[w:3] [func:Suprise1]bunu \nbiliyor musun?","[func:head4]Neden bana umut \nveriyorsun,[w:3] \npartner[waitall:4][w:3]?..","[waitall:4][w:3]...[waitall:1][w:3][func:sad]Eğer konuşan \nsen olsaydın,[w:3] tabiki[waitall:4][w:3]...","[func:Look][next] "}
			end
			elseif mercy==4 then
			if lang=="rus" then
				comm="[color:8040ff]Послушай[waitall:4][w:3]...[waitall:1][w:3] Ещё один раз[waitall:4][w:3]...[waitall:1][w:3] \nИ я заставлю тебя пожалеть.[w:6]"
				t={"[func:Peachy]Хорошо.","[func:mercy]Я вижу в твоих\nглазах смирение и\nрешительность.","[func:sad]Как бы странно это\nни звучало[waitall:4][w:3]...","[func:mercy]Я хочу дать тебе\nшанс.[w:6] [func:Peachy]Но меня нельзя\nзадобрить просто\nпощадой.","[func:mercy]Нужно сделать\nчто-то большее.[w:6]\nОсвободить меня от\nэтого цикла смертей.","[func:Peachy]Этот мир обречен,[w:3]\nдаже если я отпущу\nтебя с миром.[w:6]\nПоэтому я здесь.","Чтобы дать этому\nмиру шанс[waitall:4][w:3]...[waitall:1][w:3]\n[func:head4]Один из нас должен\nумереть.","[func:Suprise1]Понимаешь?","[func:head4]Я даю тебе\nпоследний шанс.[w:6]\nЯ вижу тебя\nнасквозь.[w:9]\nТвои намерения.","[func:Suprise1]Я знаю,[w:3] чего ты\nхочешь достичь.","[func:QuietMusic][func:head4]Так что просто\nпродолжай\nсражаться.","[func:NoMercy1]Третьего нам не\nдано."}
				else
				comm="[color:8040ff]Dinle[waitall:4][w:3]...[waitall:1][w:3] Bunu bir kere daha[w:3]yaparsan[waitall:1][w:3] \nbunu yaptığına pişman ederim.[w:6]"
				t={"[func:Peachy]Pekala.","[func:mercy]Özlerinde \nkararlılığını \ngörüyorum.","[func:sad]Garip olsa da[waitall:4][w:3]...","[func:mercy]Sana bir şans \nvermek istiyorum.[w:6] [func:Peachy]Fakat sadece \nbeni bağışlayarak \ndüzelemezsin.","[func:mercy]Daha büyük bir \nşey yapmalısın.[w:6] \nBeni bu soykırım \nselselesinde bırak.","[func:Peachy]Sen bir savaş \nolmadan ölsen bile \nbu dünya \nyok olacak.[w:6] \nİşte bu yüzden burayadayım.","Bu dünyaya yeni \nbir umut olmak için[waitall:4][w:3]...[waitall:1][w:3] [func:head4]Birimiz \nölmeli.","[func:Suprise1]Anladın?","[func:head4]Sana son bir \nşans veriyorum.[w:6] Yaptıklarını \nbiliyorum.[w:6] \nHer öldürüşün.","[func:Suprise1]Ne yapmaya \nçalıştığını biliyorum.","[func:QuietMusic][func:head4]Kısava savaşmaya \ndevam et.","[func:NoMercy1]Bunun ortası \nyok."}
			end
			elseif mercy==5 then
			glitchedmercy=1
			if lang=="rus" then
				t={"[func:head4]Кх[waitall:4][w:3]...","Знаешь,[w:3] [func:sad]это было \nбольнее,[w:3] чем я \nрассчитывала[waitall:4][w:3]...","[func:head4][waitall:4][w:3]...","[func:NoMercy1]Хе-хе[waitall:4][w:3]...[waitall:1][w:3] [func:head]Ха-ха!","Я же говорила,[w:3] что \nвижу тебя насквозь!","Я знала,[w:3] что ты \nатакуешь.[w:6] Что тот,[w:3] \nкто дергает за \nниточки,[w:3] не даст \nмне уйти!","Я обыграла тебя,[w:3] \nчертов клоун за \nкулисами!","[func:NoMercy1]Сила моей Души \nзапечатана твоей \nРешительностью.","Но если моя Душа \nсломается,[w:3] то,[w:3] что \nхранится внутри \nнеё,[w:3] взорвется.","[func:head]Остатки магии \nуничтожат тебя.[w:6] \nТы умрешь прямо \nсейчас.","[noskip][func:NoMercy1]Извини,[w:3] партнёр[waitall:4][w:3]...[waitall:1][w:3] \n[func:ShowSoul]Это будет больно,[w:3] \nно поверь[waitall:4][w:3]...","[noskip][func:Bad][speed:0.5]Это того стоит.","[func:head][func:CrashSoul]"}
				else
				t={"[func:head4]Agh[waitall:4][w:3]...","Biliyorsun[waitall:4][w:3]...[waitall:1][w:3] [func:sad]düşündüğümden \nfazla \nacıttı[waitall:4][w:3]...","[func:head4][waitall:4][w:3]...","[func:NoMercy1]He-he[waitall:4][w:3]...[waitall:1][w:3] [func:head]Ha-ha!","Dediğim gibi,[w:3] Seni \nbiliyorum!","Savaşcağını \nbiliyordum.[w:6] İpleri çeken \nkişi benim \nolmama izin \nvermeyecek!","Seni yeneceğim,[w:3] \nPerde arkasındaki \nkuklacı!","[func:NoMercy1]Ruhum senin \nKararlılığından \nkitlendi.[w:6] \nFakat o kırılırsa,[w:3] \niçindeki bir \nşey patlayacak.","[func:head]Sihrimden kalanlar \nseni yok \nedecek.[w:6] \nŞu an acı \nçekeceksin.","[noskip][func:NoMercy1]Üzgünüm,[w:3] partner[waitall:4][w:3]...[waitall:1][w:3] [func:ShowSoul]\nBu acıtacak,[w:3] fakat \ninan bana[waitall:4][w:3]...","[noskip][func:Bad][speed:0.[w:6]5]Bu tüm acıya \ndeğecek.","[func:head][func:CrashSoul]"}
			end
			nextwaves={"pisdez"}
		end
		t=EveryDial(t,"[noskip][effect:none]","")
		enemies[1].SetVar("currentdialogue",t)
		if mercy<5 then
			State("ENEMYDIALOGUE")
			else
			State("NONE")
		end
		elseif wons==0 and prog<26 then
		if lang=="rus" then
			BattleDialog("Вы пытаетесь пощадить Чару[waitall:4][w:3]...\n[color:8040ff][w:6]...[waitall:1][w:3]Хватит играть не по сценарию,[w:3] дорогуша.[w:6]\nНе строй из себя героя.")
			else
			BattleDialog("Charayı bağşlamnayı denedin[waitall:4][w:3]...\n[color:8040ff][w:6]...[waitall:1][w:3]Kahramanı oynama,[w:3] tatlım.[w:6]\nBu senaryomda yok,[w:3] ve biliyor musun?")
		end
		GotToSpareChara[1]="1"
		elseif wons==0 and prog>26 and enemies[1].GetVar("hp")>1498 then
		if lang=="rus" then
			BattleDialog("[color:8040ff]Ты упустил возможность,[w:3] дорогуша.[w:6]\nТеперь она непреклонна.[w:6] \nХватит отвлекаться от шоу.")
			else
			BattleDialog("[color:8040ff]Bir şansı kaçırdın,[w:3] tatlım.[w:6]\nŞimdi o daha da katı.[w:6] \nŞovumuzu bozmayı bırak lütfen.")
		end
		GotToSpareChara[2]="1"
		elseif wons==0 and enemies[1].GetVar("hp")<1499 then
		if lang=="rus" then
			BattleDialog("[color:8040ff]Милосердие [w:4]- это роскошь,[w:3] а мы люди бедные.[w:6]\nДавай не разбрасываться ей направо и налево.")
			else
			BattleDialog("[color:8040ff]Merhamet bizim için bir lüks.[w:6]\nVaktini boşa harcama.")
		end
		GotToSpareChara[3]="1"
		elseif wons==1 then
		LostMercy=LostMercy+1
		enemies[1].Call("MercyLostChild",LostMercy)
		State("ENEMYDIALOGUE")
	end
	WriteSavio()
	if GotToSpareChara[1]=="1" and GotToSpareChara[2]=="1" and GotToSpareChara[3]=="1" then
		GotAchivement(11)
	end
end

function HandleItem(ItemID)
    BattleDialog({"Вы выбрали " .. ItemID .. "...\nНо он бесполезен."})
end
	
function TimeEvade(time)
	local timing=-10
	if evadelevel==1 then
		timing=10
		elseif evadelevel==2 then
		timing=15
		elseif evadelevel==3 then
		timing=20
		elseif evadelevel==4 then
		timing=30
		elseif evadelevel==5 then
		timing=45
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

function DoBlood(ingo)
	if blooding==true then
		local b=#blooddrop+1
		if #blooddrop+1>#bloodforever then
			local blood=CreateSprite("empty","BelowArena")
			blood.x=0
			blood.y=0
			table.insert(bloodforever,blood)
		end
		if b==0 then
			else
			bloodforever[b].Set("blood")
			if ingo=="special1" then
				bloodforever[b].x=charatorso.x+charalegs.x+charahead.x+firstbloodx
				bloodforever[b].y=charatorso.y+charalegs.y+charahead.y+firstbloody
				else
				bloodforever[b].x=charatorso.x+charalegs.x+woundx+(math.random(woundrandx)-woundrandx/2)
				bloodforever[b].y=charatorso.y+charalegs.y+woundy+(math.random(woundrandy)-woundrandy/2)
			end
			bloodforever[b].SetVar("done",false)
			bloodforever[b].SetVar("time",0)
			local speed=1+0.125*(math.random(25)-1)
			local ugol=-70+math.random(250)
			if dam==1 and enemies[1].GetVar("hp")==1500 then
				bloodforever[b].SetVar("speedx",speed*math.cos(ugol*math.pi/180))
				else
				bloodforever[b].SetVar("speedx",speed*math.cos(ugol*math.pi/180))
			end
			bloodforever[b].SetVar("speedy",speed*math.sin(ugol*math.pi/180))
			bloodforever[b].alpha=0.8
			bloodforever[b].Scale(2+2*math.random(4),2+2*math.random(4))
			table.insert(blooddrop,bloodforever[b])
		end
	end
end



function GiveSprite(ingo)
	BoneFriend = CreateProjectile(ingo,0,500,"BelowArena")
	BoneFriend.sprite.alpha=0
	BoneFriend.sprite.SendToBottom()
end

function Sound(ingo)
	Audio.PlaySound(ingo)
end
function ChangeMusic()
	if DidChange==false then
		local max1=NewAudio.GetTotalTime("night")
		local max2=NewAudio.GetTotalTime("wound")
		local time=NewAudio.GetPlayTime("night")
		time=time/max1*max2
		SetMusic("wound")
		NewAudio.SetPlayTime("wound",time)
		DidChange=true
		else
		local max1=NewAudio.GetTotalTime("night")
		local max2=NewAudio.GetTotalTime("wound")
		local time=NewAudio.GetPlayTime("wound")
		time=time/max2*max1
		SetMusic("night")
		DidChange=false
		NewAudio.SetPlayTime("night",time)
	end
end

function FadingChara()
	if lang=="rus" then
		text={"[waitall:4][w:3]...[speed:0.75][w:3]Наконец-то ты свободен.[w:30][next] ","[speed:0.75][w:3]Свободен от оков этой силы,[w:4] что захватила над тобой контроль.[w:30][next] ","[speed:0.75][w:3]Что не дала тебе свернуть с кривой дорожки.[w:30][next] ","[speed:0.75][w:3]Это не значит,[w:4] что я простила тебя.[w:16]\nВ конце концов,[w:4] это ты начал эту резню[waitall:4][w:3]...[speed:0.5][w:3]\n[color:ff0000]не так ли?[w:30][next] ","[speed:0.75][w:3]Но я умею быть милосердной.[w:8] Ты человек.[w:8] \nИ веры в тебя нет[waitall:4][w:3]...[speed:0.75][w:3][w:30][next] ","[speed:0.75][w:3]Но Азриэль говорил,[w:4] что чем больше силы в человеке,[w:4] \nтем меньше он понимает,[w:4] сколько в нем опасности.[w:30][next] ","[speed:0.75][w:3]Поэтому к людям нужно относиться,[w:4] как к равным.[w:8] \nНаучить их смирению.[w:8] \nНаучить их дружбе.[w:30][next] ","[speed:0.75][w:3]Твоя Душа вновь стала нашим светом во тьме Подземелья.[w:30][next] ","[speed:0.75][w:3]Благодаря тому,[w:4] что ты послушал меня.[w:8] Послушал Азриэля.[w:30][next] ","[speed:0.75][w:3]Так что[waitall:4][w:3]...[speed:0.75][w:3] Не подведи нас снова.[func:Quiet][w:20]\n[color:ff0000][speed:0.5]Партнёр.[w:60][next] "}
		--text={"[speed:0.75][w:3]Так что[waitall:4][w:3]...[speed:0.75][w:3] Не подведи нас снова.[func:Quiet][w:20]\n[color:ff0000][speed:0.5]Партнёр.[w:60][next] "}
		else
		text={"[waitall:4][w:3]...[speed:0.75][w:3]Sonunda özgürsün.[w:6]","Seni ele geçiren o zincirlerden.[w:6]","Geri dönmene izin vermeyen zincirlerden.[w:6]","Bu seni bağışladım anlamına gelmiyor.[w:6] En sonunda,[w:3] bu kargaşayı başlatan sensin[waitall:4][w:3]...[waitall:0.75][w:3] [color:ff0000]\ndeğil mi?","Fakat merhamet gösterebilirim.[w:6] Sen bir insansın.[w:6] Ve hala türümüzde umut yok[waitall:4][w:3]...[waitall:0.75][w:3]","Fakat asriel bana insanların yok ettikleri kadar da güçlü olmadıklarından bahsetti","İşte bu yüzden onların canavarlarla eşit muamele görmesi lazım.[w:6] onlara insanlığı öğretmek için,[w:3] onlara arkadaşlığı öğretmek için.[w:6]","Ruhun bir kere daha bu boşluktaki ışık oldu.[w:6]","Çünkü beni dinledin.[w:12] \nAsrieli'i dinledin.[w:6]","Yani[waitall:4][w:3]...[speed:0.75][w:3] Bizi tekrar pişman etme.[func:Quiet][w:20] \nPartner.[w:60][next] "}
	end
	for i=1,#text do
		text[i]="[color:ffffff][noskip][font:overworld][effect:none][novoice][speed:0.75]"..text[i]
	end
	CHARA=CreateText(text,{80,180},480,"Top",-1)
	CHARA.HideBubble()
end
function ShadowTarget()
	shadowtarget=1
end

function RaiseFade()
	if FadedChara==2 then
		fPlayer.MoveToAbs(202,25,true)
		Audio.PlaySound("menumove")
		RedoBut(2)
		elseif FadedChara==3 then
		fPlayer.MoveToAbs(361,25,true)
		RedoBut(3)
		Audio.PlaySound("menumove")
		elseif FadedChara==4 then
		fPlayer.MoveToAbs(515,25,true)
		RedoBut(4)
		Audio.PlaySound("menumove")
		elseif FadedChara==5 then
		fPlayer.MoveToAbs(65,192,true)
		RedoBut(5)
		Audio.PlaySound("menuconfirm")
		elseif FadedChara==6 then
		fPlayer.MoveToAbs(515,25,true)
		RedoBut(4)
		Audio.PlaySound("menuconfirm")
		elseif FadedChara==7 then
		AllDark=1
		State("NONE")
	end
	FadedChara=FadedChara+1
end

function MovePlayerToTheSpot()
	fPlayer=CreateProjectileAbs("ut-heart",48,25,"Top")
	fPlayer.sprite.color={1,0,0}
	RedoBut(1)
end

function FuckingEndGame()
	Misc.DestroyWindow()
end
function Quiet()
	QuietMusic=true
end
function Shake()
	Misc.ShakeScreen(60,60,true)
	if Pellets==true then
		for i=1,#PELLETS do
			PELLETS[i].SetVar("Bang",true)
		end
		DoesPellets=false
	end
end
function Shake1()
	Misc.ShakeScreen(15,10,true)
end

function Possess()
	MyState="NONE"
	MettaHead.SetVar("time",-9)
	Audio.PlaySound("mus_f_newlaugh")
	Possessed=true
	PossessedTime=1
	State("NONE")
end
function DoAction(ingo)
	local lv=(MaxHP-16)/4
	ButtonUsed=ingo
	if ingo==1 then
		local dial={}
		PlayerWasHurted=4
		if PlayerHurtedHimself==0 then
			enemies[1].Call("LostKidFace",{"shocked","+"})
			if lang=="rus" then
				BattleDialogue("[func:Shake][func:Sound,hurtsound][func:Sound,hurtsound][color:8040ff]Ай![w:6] У нас общее тело![w:6] Хватит себя бить,[w:3] идиот![w:6] Тебе это мало чем поможет!")
				dial={"[func:LostKidFace,shocked,+]А?![w:6] З-зачем ты себя \nбьешь?!","[func:LostKidFace,shocked2,+][waitall:4][w:3]...[waitall:1][w:3]Значит,[w:3] боль \nзаглушает его?","[func:LostKidFace,base_close,-]Ладно[waitall:4][w:3]...[waitall:1][w:3] Только \nаккуратнее.[w:6] [func:LostKidFace,sobbing_thinking,+]\nПожалуйста.[w:6]"}
				else
				BattleDialog("[func:Shake][func:Sound,hurtsound][func:Sound,hurtsound][color:8040ff]Ouch![w:6] We share this body![w:6] So stop beating yourself up,[w:3] you idiot![w:6] \nThis won't help you![w:6]")
				dial={"[func:LostKidFace,shocked,+]Ah?![w:6] Neden kendine \nvuruyorsun?!","[func:LostKidFace,shocked2,+][waitall:4][w:3]...[waitall:1][w:3]Acı onu bi süreliğine\nbayılttı mı?","[func:LostKidFace,base_close,-]Tamam[waitall:4][w:3]...[waitall:1][w:3] Fakat \ndaha saygılı ol.[w:6] [func:LostKidFace,sobbing_thinking,+]\nLütfen.[w:6]"}
			end
			PlayerHurtedHimself=1
			else
			if lang=="rus" then
				BattleDialogue(GiveRandom({"[func:Shake1][func:Sound,hurtsound][func:Sound,hurtsound][color:8040ff]А ты настырный,[w:3] раз продолжаешь себя избивать,[w:3] чтобы меня остановить[waitall:4][w:3]...","[func:Shake1][func:Sound,hurtsound][func:Sound,hurtsound][color:8040ff]Я так долго выбирал тебе лак,[w:3] дорогуша,[w:3] чтобы сейчас ты ломал себе ногти?!","[func:Shake1][func:Sound,hurtsound][func:Sound,hurtsound][color:8040ff]Ты не думал,[w:3] каково Чаре смотреть,[w:3] как ты ломаешь себе руки?[w:6]\nПостыдился бы при людях[waitall:4][w:3]...","[func:Shake1][func:Sound,hurtsound][func:Sound,hurtsound][color:8040ff]Мне плевать,[w:3] если ты откусишь себе язык.[w:3]\nКостно*язычие* не мой конек.","[func:Shake1][func:Sound,hurtsound][func:Sound,hurtsound][color:8040ff]Рви волосы сколько тебе угодно.[w:6]\nТолько не все.[w:6]\nЯ ими слишком дорожу"}))
				dial=GiveRandom({{"[func:LostKidFace,sobbing_smile,+]Я верю в тебя,[w:3] \nпартнёр[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,sobbing_thinking,+]\nНе сдавайся,[w:3] прошу \nтебя[waitall:4][w:3]...[waitall:1][w:3]"},{"[func:LostKidFace,sobbing_close,-]Как бы глубоки ни \nбыли твои раны[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,sobbing_smile,+]\nЯ рядом.[w:6] \nВерь в меня.[w:6]"},{"[func:LostKidFace,sobbing_close,-]Я знаю,[w:3] что это \nбольно[waitall:4][w:3]...[waitall:1][w:3] \nНо,[w:3] пожалуйста,[w:3] [func:LostKidFace,sobbing_thinking,+]\nдержись,[w:3] партнёр[waitall:4][w:3]...[waitall:1][w:3]"},{"[func:LostKidFace,sobbing,+]Раньше твои \nстрадания были бы \nприятны,[w:3] но сейчас[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,sobbing_thinking,+]\nЭто ужасное \nзрелище[waitall:4][w:3]...[waitall:1][w:3]"},{"[func:LostKidFace,sobbing_thinking,+]Я-я ведь просила \nаккуратнее[waitall:4][w:3]...[waitall:1][w:3]"},{"[func:LostKidFace,shocked3,+]Ауч[waitall:4][w:3]...[waitall:1][w:3] Должно быть \nэто больно[waitall:4][w:3]...[waitall:1][w:3]"}})
				else
				BattleDialog({"[func:Shake1][func:Sound,hurtsound][func:Sound,hurtsound][color:8040ff]Çok inatçısın,[w:3] hala beni durdurmak için kendini yırtıyorsun[waitall:4][w:3]...[waitall:1][w:3]","[func:Shake1][func:Sound,hurtsound][func:Sound,hurtsound][color:8040ff]Birkaç parmağın daha kırılırsa testeremi tutamam.[w:6] \nBenimle oynama[waitall:4][w:3]...[waitall:1][w:3]","[func:Shake1][func:Sound,hurtsound][func:Sound,hurtsound][color:8040ff]Dilini ısırırsan umrunda olmaz.[w:6] \nZaten bu konularda kötüyüm.[w:6]","[func:Shake1][func:Sound,hurtsound][func:Sound,hurtsound][color:8040ff]Seni güzelleştirirken çok zaman harcadım,[w:3] tarlım,[w:3] ve şimdi kendini heba mı ediyorsun?![w:6]","[func:Shake1][func:Sound,hurtsound][func:Sound,hurtsound][color:8040ff]İstediğini yap.[w:6] \nFakat birazdan dur.[w:6] Daha fazla rezillik istemiyorum.[w:6]","[func:Shake1][func:Sound,hurtsound][func:Sound,hurtsound][color:8040ff]Sen kollarını kırarken charanın ne hissedeceğini düşünmedin mi? Yazık[waitall:4][w:3]...[waitall:1][w:3]"})
				dial=GiveRandom({{"[func:LostKidFace,sobbing_smile,+]Hala sana inanıyorum,[w:3] \npartner[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,sobbing_thinking,+]\nSakın yenilme,[w:3] Sana \nyalvarıyorum[waitall:4][w:3]...[waitall:1][w:3]"},{"[func:LostKidFace,sobbing_close,-]Yaraların \nen karanlık çukur kadar \nderin olsa da[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,sobbing_smile,+]\nHer zaman yanında \nolacağım.[w:6] \nBana g,ven.[w:6]"},{"[func:LostKidFace,sobbing_close,-]Biliyorum acıtıyor[waitall:4][w:3]...[waitall:1][w:3] \nFakat,[w:3] yalvarıyorum,[w:3] [func:LostKidFace,sobbing_thinking,+]\ndayan,[w:3] partner[waitall:4][w:3]...[waitall:1][w:3]"},{"[func:LostKidFace,sobbing,+]Az önce işkencen \niyi olabilirdi \nFakat,[w:3] şimdi[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,sobbing_thinking,+]\nBu dehşet verici[waitall:4][w:3]...[waitall:1][w:3]"},{"[func:LostKidFace,sobbing_thinking,+]S-sana daha \nkiar olmanı,[w:3] \nistemiştim, değil mi?[waitall:4][w:3]...[waitall:1][w:3]"},{"[func:LostKidFace,shocked3,+]Ah[waitall:4][w:3]...[waitall:1][w:3] Bu acıtıyor olmalı[waitall:4][w:3]...[waitall:1][w:3]"}})
			end
		end
		dial[#dial+1]="[noskip][func:LostKidFace,hope_base,+][next] "
		for i=1,#dial do
			dial[i]="[noskip]"..dial[i]
		end
		enemies[1].SetVar("currentdialogue",dial)
		elseif ingo==2 then
		PlayerFlirtCount=PlayerFlirtCount+1
		local dial={}
		if PlayerFlirtCount==1 then
			if lang=="rus" then
				BattleDialog("[color:8040ff]Ты флиртуешь,[w:3] пока призрак захватывает твое тело,[w:3] потому что тебя это заводит?[w:6] Я просто понять не могу.")
				dial={"[func:LostKidFace,flirt1,+]Т.[w:6].[w:6]Ты что?[w:6] Зачем ты \nхвалишь мои волосы \nв такой момент??[w:6] \nНапряжение тебе \nмозг расплавило \nили что???"}
				else
				BattleDialog("[color:8040ff]Bir hayalet vücudunu ele geçirirken flört mü ediyorsun?[w:6] Çünkü başka bir sebep görmüyorum.[w:6]")
				dial={"[func:LostKidFace,flirt1,+]S[waitall:4][w:3]...[waitall:1][w:3]Sen ne?[w:6] Neden durduk yere \nsaçımı \növüyorsun??[w:6] \nBu sava \nbeynini falan mı \neritti???"}
			end
			elseif PlayerFlirtCount==2 then
			if lang=="rus" then 
				dial={"[func:LostKidFace,flirt2,-]Ну прекрати![w:6] Мне \nнеловко![w:6] Мне надо \nсосредоточиться,[w:3] а \nты отвлекаешь меня \nвсякими[waitall:4][w:3]...[waitall:1][w:3] всякими[waitall:4][w:3]...[waitall:1][w:3] \nМгх!"}
				BattleDialog("[color:8040ff]Серьезно,[w:3] хватит.[w:6]\nЭто нелепо.[w:6]\nИ даже глупо.")
				else
				dial={"[func:LostKidFace,flirt2,-]Bunu boşver![w:6] Zaten \ngarip hissediyorum![w:6] \nOdaklanmam lazım,[w:3] ve \nbeni bir şekilde \nrahatsız \nedi[waitall:4][w:3]...[waitall:1][w:3]yor[waitall:4][w:3]...[waitall:1][w:3] Mphf!"}
				BattleDialog("[color:8040ff]Yani,[w:3] dur.[w:6] \nBu çok saçma.[w:6]")
			end
			elseif PlayerFlirtCount==3 then
			if lang=="rus" then
				dial={"[func:LostKidFace,flirt3,+]Т-ты идиот,[w:3] \nпартнёр[waitall:4][w:3]...[waitall:1][w:3] Нельзя \nтакое говорить \nдевушке,[w:3] когда они \nне наедине[waitall:4][w:3]...[waitall:1][w:3]","Только если ты не \nхочешь[waitall:4][w:3]...[waitall:1][w:3] Боже[waitall:4][w:3]...[waitall:1][w:3] \nИзврат.[w:6]"}
				else
				dial={"[func:LostKidFace,flirt3,+]S-Sen bir salaksın,[w:3] \npartner[waitall:4][w:3]...[waitall:1][w:3] \nYalnız değilken \nbir kıza böyle \nşeyler söylememelisin[waitall:4][w:3]...[waitall:1][w:3]","Fakat istiyorsan \n[waitall:4][w:3]...[waitall:1][w:3] Allahım[waitall:4][w:3]...[waitall:1][w:3] Seni sapık."}
			end
			elseif PlayerFlirtCount==4 then
			if lang=="rus" then
				dial={"[func:LostKidFace,flirt4,+]Д-да,[w:3] я знаю,[w:3] что \nпальто отпад.[w:6] \nАзриэль помогал его \nвыбрать среди того \nхлама[waitall:4][w:3]...[waitall:1][w:3] \nЯ им очень дорожу[waitall:4][w:3]...[waitall:1][w:3]"}
				else
				dial={"[func:LostKidFace,flirt4,+]E-evet,[w:3] bu ceketin \ngüzel olduğunu biliyorum.[w:6] \nAsriel bunu Şelale'deki \nçöplükten \nçıkarmama yardım \netti[waitall:4][w:3]...[waitall:1][w:3] \nHehe[waitall:4][w:3]...[waitall:1][w:3]"}
			end
			elseif PlayerFlirtCount==5 then
			if lang=="rus" then
				dial={"[func:LostKidFace,flirt5,+]Н-ну ладно[waitall:4][w:3]...[waitall:1][w:3] Раз ты \nнастаиваешь,[w:3] можем \nнемного расколоть \nмежду нами лёд[waitall:4][w:3]...[waitall:1][w:3] \nХе-хе[waitall:4][w:3]...[waitall:1][w:3]"}
				else
				dial={"[func:LostKidFace,flirt5,+]T-Tamam[waitall:4][w:3]...[waitall:1][w:3] İstiyor \nisen,[w:3] aramızdaki \nbuzları \neritebiliriz[waitall:4][w:3]...[waitall:1][w:3] \nHe-he[waitall:4][w:3]...[waitall:1][w:3]"}
			end
			elseif PlayerFlirtCount>5 then
			if lang=="rus" then
				dial=GiveRandom({{"[func:LostKidFace,flirt5,+]Неплохо,[w:3] но я \nзнаю лучше.[w:6] \nТы был бы отличным \nтроном.[w:6] \nДля такой королевы,[w:3] \nкак я,[w:3] хе-хе[waitall:4][w:3]...[waitall:1][w:3]"},{"[func:LostKidFace,flirt5,+]Ты мне,[w:3] кажется,[w:3] \nкого-то напоминаешь,[w:3] \nпартнёр[waitall:4][w:3]...[waitall:1][w:3] \nДа,[w:3] точно,[w:3] мою \nбудущую любовь всей \nжизни,[w:3] хе-хе[waitall:4][w:3]...[waitall:1][w:3]"},{"[func:LostKidFace,flirt5,+]Партнёр,[w:3] ты прямо \nкак магнит.[w:6] Меня \nтак и тянет к тебе,[w:3] \nхе-хе[waitall:4][w:3]...[waitall:1][w:3]"},{"[func:LostKidFace,flirt5,+]Я вижу,[w:3] твои колени \nничем не заняты.[w:6] \nМогу ли я на них \nприсесть?"},{"[func:LostKidFace,flirt5,+]Напомни,[w:3] \nпожалуйста,[w:3] чем ты \nсегодня вечером \nзанят? \nНу,[w:3] не считая меня,[w:3] \nхе-хе[waitall:4][w:3]...[waitall:1][w:3]"},{"[func:LostKidFace,flirt5,+]Партнёр,[w:3] ты не \nустал? Ты каждый \nдень пробегаешь в \nмоих мыслях,[w:3] хе-хе[waitall:4][w:3]...[waitall:1][w:3]"}})
				else
				dial=GiveRandom({{"[func:LostKidFace,flirt5,+]İyi,[w:3] fakat daha iyisini \nbiliyorum.[w:6] \nİyi bir taht \nolabilirsin.[w:6] \nBenim gibi bir kraliçe için,[w:3] \nhe-he[waitall:4][w:3]...[waitall:1][w:3]"},{"[func:LostKidFace,flirt5,+]Tanıdık görünüyorsun,[w:3] \npartner[waitall:4][w:3]...[waitall:1][w:3] \nOh,[w:3] doğru,[w:3] hayatımın \naşkı gibi \ngörünüyorsun,[w:3] he-he[waitall:4][w:3]...[waitall:1][w:3]"},{"[func:LostKidFace,flirt5,+]Partner,[w:3] bir \nmıknatıs gibisin.[w:6] \nSeni uzağa \nitemiyorum,[w:3] he-he[waitall:4][w:3]...[waitall:1][w:3]"},{"[func:LostKidFace,flirt5,+]Görüyorum,[w:3] kucağın \nboş gibi.[w:6] \nOturabilir miyim?"},{"[func:LostKidFace,flirt5,+]Hatırlat beni,[w:3] lütfen,[w:3] \nbu akşam \nboş musun? Beni \nsayma,[w:3] tabiki,[w:3] \nhe-he[waitall:4][w:3]...[waitall:1][w:3]"},{"[func:LostKidFace,flirt5,+]Partner,[w:3] yorulmuyor \nmusun? \nHer zaman \naklımı çeliyorsun,[w:3] \nhe-he[waitall:4][w:3]...[waitall:1][w:3]"}})
			end
		end
		if PlayerFlirtCount>2 then
			if lang=="rus" then
				local randoms={"[color:8040ff]Под моим началом ты был лучшим любовником[waitall:4][w:3]...[waitall:1][w:3]\nА сейчас без слез не взглянешь.","[color:8040ff]Я позволяю тебе этот абсурд только потому,[w:3] что люблю сопливые драмы.","[color:8040ff]Твои слова меня тронули[waitall:4][w:3]...[waitall:1][w:3]\nБудь моим,[w:3] сэмпай?[w:18]\nПфха,[w:3] видел бы ты себя сейчас со стороны."}
				if enemies[1].GetVar("hp")<1500 then
					table.insert(randoms,"[color:8040ff]Даже Чара со вспоротым животом не понимает,[w:3] зачем ты флиртуешь с ней сейчас.")
				end
				BattleDialog(GiveRandom(randoms))
				else
				local randoms={"[color:8040ff]Benimle en iyi sevgiliydin[waitall:4][w:3]...[waitall:1][w:3] \nArtık hareketlerini kınıyorum","[color:8040ff]Drama sevdiğim için bu saçmalığa izin verecxeğim",{"[color:8040ff]Kırıldım[waitall:4][w:3]...[waitall:1][w:3] \nBenim olur musun,[w:3] senpai?","[color:8040ff]Pffha,[w:3] kendini görmeliydin!"}}
				if enemies[1].GetVar("hp")<1500 then
					table.insert(randoms,"[color:8040ff]Chara bile neden flört ettiğini anlamıyor gibi.[w:6]")
				end
				BattleDialog(GiveRandom(randoms))
			end
		end
		dial[#dial+1]="[noskip][func:LostKidFace,hope_base,+][next] "
		for i=1,#dial do
			dial[i]="[noskip]"..dial[i]
		end
		enemies[1].SetVar("currentdialogue",dial)
		PlayerHasFlirted=4
		elseif ingo==3 then
		local dial={}
		if PlayerHasItems==5 then
			PlayerHasItems=4
			if enemies[1].GetVar("hp")<1500 then
				enemies[1].SetVar("hp",enemies[1].GetVar("hp")+360)
			end
			if lang=="rus" then
				BattleDialog("[color:8040ff]Ты поделился чаем с Чарой.[func:Sound,healsound][w:6]\nНе очень горячий?[w:3] Жаль")	
				dial={"[func:LostKidFace,1feed1,+][waitall:4][w:3]...[waitall:1][w:3]Ты хочешь \nнапоить меня чаем[waitall:4][w:3]?..[waitall:1][w:3]","В смысле[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,1feed2,+] Эм[waitall:4][w:3]...[waitall:1][w:3]","Л-ладно[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,1feed3,+] *глоть*[w:6][func:CheckWound][w:6] \nВкусно[waitall:4][w:3]...[waitall:1][w:3]"}
				else
				BattleDialog("[color:8040ff]You shared a cup of tea with Chara.[w:6] \nIsn't it hot?[w:6] \nToo bad.[w:6]")
				dial={"[func:LostKidFace,1feed1,+][waitall:4][w:3]...[waitall:1][w:3]Bana çay mı vermek \nistiyorsun[waitall:4][w:3]?..[waitall:1][w:3]","Yani[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,1feed2,+]Uhm[waitall:4][w:3]...[waitall:1][w:3]","T-tamam[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,1feed3,+]*glüp*[w:6][func:CheckWound][w:6] \nGüzel[waitall:4][w:3]...[waitall:1][w:3]"}
			end
			elseif PlayerHasItems==4 then
			PlayerHasItems=3
			if enemies[1].GetVar("hp")<1500 then
				enemies[1].SetVar("hp",enemies[1].GetVar("hp")+360)
			end
			if lang=="rus" then
				BattleDialog("[color:8040ff]Вы с Чарой перекусили пончиками.[func:Sound,healsound][w:6]\nОтвратно,[w:3] что вы не подавились пауком.")	
				dial={"[func:LostKidFace,foodfeed1,+][waitall:4][w:3]...[waitall:1][w:3]А-а-м.[w:6][w:6][func:CheckWound][w:6] ","[func:LostKidFace,foodfeed2,+] Знаешь,[w:3] в горло не \nлезут пончики \nМаффет от \nвоспоминаний о \nПаукексе[waitall:4][w:3]...[waitall:1][w:3] \nНо ладно.[w:6]"}
				else
				BattleDialog("[color:8040ff]You bite a piece of Spider donut with Chara.[w:6] \nSadly,[w:3] you didn't choke by spider.[w:6]")
				dial={"[func:LostKidFace,foodfeed1,+][waitall:4][w:3]...[waitall:1][w:3]A-a-m[w:6][func:CheckWound][w:6] ","[func:LostKidFace,foodfeed2,+]Biliyorsun,[w:3] Spiderdonut'ları \ndüşünürken Muffet'ın \ndonutlarını yemek \nzor[waitall:4][w:3]...[waitall:1][w:3] \nFakat sorun yok.[w:6]"}
			end
			elseif PlayerHasItems==3 then
			PlayerHasItems=2
			if enemies[1].GetVar("hp")<1500 then
				enemies[1].SetVar("hp",enemies[1].GetVar("hp")+360)
			end
			if lang=="rus" then
				BattleDialog("[color:8040ff]Ты покормил Чару лазаньей.[func:Sound,healsound][w:6]\nСтоп,[w:3] она что,[w:3] Тамагочи?")	
				dial={"[func:LostKidFace,foodfeed1,+][waitall:4][w:3]...[waitall:1][w:3]*сёрб*[w:6][func:CheckWound][w:6] ","[func:LostKidFace,foodfeed2,+]Паста Папайруса[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,sobbing_close,-] \nБудто[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,sobbing_smile_close2,-] вернулась \nдомой[waitall:4][w:3]...[waitall:1][w:3] \nМгх.[w:6]"}
				else
				BattleDialog("[color:8040ff]You feed Chara with lasagna.[w:6] \nWait,[w:3] is she a Tamagotchi,[w:3] by any chance?")
				dial={"[func:LostKidFace,foodfeed1,+][waitall:4][w:3]...[waitall:1][w:3] *Şlürp*[w:6][func:CheckWound][w:6] ","[func:LostKidFace,foodfeed2,+]Papyrus'un makarnası[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,sobbing_close,-]Şey gibi \nhissettirdi[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,sobbing_smile_close2,-]Eve geri \ndönmüşüm gibi[waitall:4][w:3]...[waitall:1][w:3] \nMgh.[w:6]"}
			end
			elseif PlayerHasItems==2 then
			PlayerHasItems=1
			if enemies[1].GetVar("hp")<1500 then
				enemies[1].SetVar("hp",enemies[1].GetVar("hp")+360)
			end
			if lang=="rus" then
				BattleDialog({"[color:8040ff]Ты покормил Чару святой водой[func:Sound,healsound][waitall:4][w:3]...[w:6]\n...[waitall:4][w:3]\nЭто было странно.","[color:8040ff]У тебя больше нет еды.[w:6]\nМогу предложить кинуть в нее снеговика."})	
				dial={"[func:LostKidFace,drinkfeed1,+][waitall:4][w:3]...[waitall:1][w:3] *глоть*[w:6][func:CheckWound][w:6] ","[func:LostKidFace,drinkfeed2,+]Фуф[waitall:4][w:3]...[waitall:1][w:3] Сложно \nсказать,[w:3] насколько \nэто неправильно \nчувствуется[waitall:4][w:3]...[waitall:1][w:3]"}
				else
				BattleDialog({"[color:8040ff]You feed Chara with holy water[waitall:4][w:3]...[w:6]\n...[waitall:1][w:3]That was weird.[w:6]","[color:8040ff][w:3]You have no food left.[w:6]\nI can advice to give her your snowman piece.[w:6]"})
				dial={"[func:LostKidFace,drinkfeed1,+][waitall:4][w:3]...[waitall:1][w:3]*glüp*[w:6][func:CheckWound][w:6] ","[func:LostKidFace,drinkfeed2,+]Huff[waitall:4][w:3]...[waitall:1][w:3] Bunun ne \ngarip hissettirdiğini \nsöyleyemem[waitall:4][w:3]...[waitall:1][w:3]"}
			end
			elseif PlayerHasItems==1 then
			if enemies[1].GetVar("hp")<1500 then
				enemies[1].SetVar("hp",enemies[1].GetVar("hp")+360)
			end
			if diff>1 then
				if lang=="rus" then
					BattleDialog({"[color:8040ff][waitall:4][w:3]...[waitall:1][w:3]Ты все-таки кинул снеговика.[w:30]\nВау[waitall:4][w:3]...[waitall:1][w:3] Я поражен.","[color:8040ff]У тебя больше нет предметов.[w:6] И пироги из ниоткуда не появятся,[w:3] это я тебе обещаю."})
					dial={"[func:LostKidFace,snowfeed1,+][waitall:4][w:3]...[waitall:1][w:3]А-а-ам","[func:LostKidFace,snowfeed2,+] !!!","[func:LostKidFace,snowfeed4,+]К-какого?[w:6]![w:6].[w:6].[w:6] Партнёр,[w:3] \nты издева-[func:LostKidFace,snowfeed3,+][func:CheckWound][w:6]  \nО[waitall:4][w:3]...[waitall:1][w:3] Оно всё-таки \nлечит[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,snowfeed4,+]Но как мне стереть \nэту белую[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,snowfeed5,+] \nмокрую[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,snowfeed3,+]снег[waitall:4][w:3]?..[waitall:1][w:3]"}
					else
					BattleDialog({"[color:8040ff][noskip]ONA bir kardan adam parçası verdin.[w:6]\nVay[waitall:4][w:3]...[waitall:1][w:3] Etkilendim","[color:8040ff][noskip]Yiyeceğin kalmadı.[w:6] \nVe hiçlikten bir turta çıkmayacak,[w:3] Bahse girerim.[w:6]"})
					dial={"[func:LostKidFace,snowfeed1,+][waitall:4][w:3]...[waitall:1][w:3]А-а-m","[func:LostKidFace,snowfeed2,+]!!!","[func:LostKidFace,snowfeed4,+]N-ne?[w:6]![w:6].[w:6].[w:6] Partner,[w:3] \nbu bir şa-[func:LostKidFace,snowfeed3,+][func:CheckWound][w:6] \nOh[waitall:4][w:3]...[waitall:1][w:3] Cidden iyileştirdi[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,snowfeed4,+]Fakat bu \nyapışkan \nbeyaz[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,snowfeed5,+]\nkarı[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,snowfeed3,+]nasıl[waitall:4][w:3]temizleyeceğim[waitall:1][w:3]"}
				end
				elseif diff==1 then
				if lang=="rus" then
					dial={"[func:LostKidFace,snowfeed1,+][waitall:4][w:3]...[waitall:1][w:3]А-а-ам","[func:LostKidFace,snowfeed2,+] !!!","[func:LostKidFace,snowfeed4,+]К-какого?[w:6]![w:6].[w:6].[w:6] Партнёр,[w:3] \nты издева-[func:LostKidFace,snowfeed3,+][func:CheckWound][w:6]  \nО[waitall:4][w:3]...[waitall:1][w:3] Оно всё-таки \nлечит[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,snowfeed4,+]Но как мне стереть \nэту белую[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,snowfeed5,+] \nмокрую[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,snowfeed3,+]снег[waitall:4][w:3]?..[waitall:1][w:3]"}
					BattleDialog({"[color:8040ff][waitall:4][w:3]...[waitall:1][w:3]Ты все-таки кинул снеговика.[w:30]\nВау[waitall:4][w:3]...[waitall:1][w:3] Я поражен.","[color:8040ff]У тебя больше нет предметов.[w:6] И пироги из ниоткуда не появятся,[w:3] это я тебе обещаю.","[noskip][color:8040ff][waitall:4][w:3]...[waitall:1][w:3]Чтобы я сдох[waitall:4][w:3]...[waitall:1][w:3]\nТут куча пирогов за колонной[waitall:4][w:3]..."})
					else
					BattleDialog({"[color:8040ff][noskip]ONA bir kardan adam parçası verdin.[w:6]\nVay[waitall:4][w:3]...[waitall:1][w:3] Etkilendim","[color:8040ff][noskip]Yiyeceğin kalmadı.[w:6] \nVe hiçlikten bir turta çıkmayacak,[w:3] Bahse girerim.[w:6]"})
					dial={"[func:LostKidFace,snowfeed1,+][waitall:4][w:3]...[waitall:1][w:3]А-а-m","[func:LostKidFace,snowfeed2,+]!!!","[func:LostKidFace,snowfeed4,+]N-ne?[w:6]![w:6].[w:6].[w:6] Partner,[w:3] \nbu bir şa-[func:LostKidFace,snowfeed3,+][func:CheckWound][w:6] \nOh[waitall:4][w:3]...[waitall:1][w:3] Cidden iyileştirdi[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,snowfeed4,+]Fakat bu \nyapışkan \nbeyaz[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,snowfeed5,+]\nkarı[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,snowfeed3,+]nasıl[waitall:4][w:3]temizleyeceğim[waitall:1][w:3]"}
				end
			end
			PlayerHasItems=0
			elseif PlayerHasItems==0 then
			if diff==1 then
				if lang=="rus" then
					BattleDialog("[color:8040ff]Вы кормите Чару пирогом из-за колонны[waitall:4][w:3]...[waitall:1][w:3]\nНет,[w:3] серьезно,[w:3] откуда они там[waitall:4]?.." )
					dial={"[func:LostKidFace,foodfeed1,+][waitall:4][w:3]...[waitall:1][w:3]*хрум*[w:6][func:CheckWound][w:6] ","[func:LostKidFace,foodfeed2,+]Неужели Азриэль \nпрятал все свои \nпироги от гнева \nмамы здесь[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,flirt3,+]Иначе откуда их \nздесь столько[waitall:4][w:3]...[waitall:1][w:3]"}
					else
					BattleDialog({"[color:8040ff]Charaya bir turta verdin[waitall:4][w:3]...[waitall:1][w:3]","[color:8040ff][w:3]Hayır,[w:3] Yani,[w:3] sende ondan var mıydı[waitall:4][w:3]?.."})
					dial={"[func:LostKidFace,foodfeed1,+][waitall:4][w:3]...[waitall:1][w:3]*ham*[w:6][func:CheckWound][w:6] ","[func:LostKidFace,foodfeed2,+]Asriel cidden \nbu turtaları \nannemden mi gizledi[waitall:4][w:3]?..[waitall:1][w:3]","[func:LostKidFace,flirt3,+]Hayır ise,[w:3] Neden burda \nbu kadar çok \nolduğunu \nanlamadım[waitall:4][w:3]...[waitall:1][w:3]"}
				end
				if enemies[1].GetVar("hp")<1500 then
					enemies[1].SetVar("hp",enemies[1].GetVar("hp")+360)
				end
				else
				if lang=="rus" then
					BattleDialog("[color:8040ff]Я же сказал,[w:3] нет у тебя предметов.")	
					dial={"[func:LostKidFace,flirt3,+]Партнёр,[w:3] не трать \nход на то,[w:3] чтобы в \nочередной раз \nглянуть в карманы,[w:3] \nпожалуйста[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,hope_cheers,+]Я сильная,[w:3] я \nсправлюсь.[w:6]"}
					else
					BattleDialog("Dediğim gibi,[w:3] yemeğin kalmadı.[w:6]")
					dial={"[func:LostKidFace,flirt3,+]Partner,[w:3] ceplerini \nkontrol ederek \nvaktini \nboşa harcama,[w:1] lütfen[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,hope_cheers,+]Güçlüyüm,[w:3] Bunu \nkaldırabilirim.[w:6]"}
				end
			end
		end
		dial[#dial+1]="[noskip][func:LostKidFace,hope_base,+][next] "
		for i=1,#dial do
			dial[i]="[noskip]"..dial[i]
		end
		enemies[1].SetVar("currentdialogue",dial)
		elseif ingo==4 then
		local dial={}
		if SparedFirstTime==0 then
			SparedFirstTime=1
			if lang=="rus" then
				BattleDialog("[color:8040ff]Значит вы теперь на одной стороне[waitall:4][w:3]...[waitall:1][w:3]\nНу,[w:3] ваше право.")
				dial={"[func:LostKidFace,hope_question,+]Твоя душа[waitall:4][w:3]...[waitall:1][w:3] \nрезонирует,[w:3] когда \nты щадишь меня[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,hope_close,-]Я чувствую это[waitall:4][w:3]...[waitall:1][w:3]","[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,hope_determined,+]Не сдавайся![w:6] \nМы справимся![w:6]"}
				else
				BattleDialog("[color:8040ff]Demek onunla aynı taraftansın[waitall:4][w:3]...[waitall:1][w:3] \nPekala,[w:3] Karşı gelmeyeceğim.")
				dial={"[func:LostKidFace,hope_question,+]Ruhun[waitall:4][w:3]...[waitall:1][w:3] \nbeni bağışlayınca \nparlıyor[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,hope_close,-]Hissediyorum[waitall:4][w:3]...[waitall:1][w:3]","[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,hope_determined,+]Dayan![w:6] \nBunu başarabiliriz![w:6]"}
			end
			elseif Player.lv>9 then
			if lang=="rus" then
				BattleDialog(GiveRandom({"[color:8040ff]Чем чаще ты пропускаешь ход,[w:3] тем легче становится моя работа.","[color:8040ff]Ты не сможешь никого спасти,[w:3] если сам в смертельной опасности.","[color:8040ff]Занятно,[w:3] как бесцельна была твоя пощада раньше и как она твое спасение сейчас.","[color:8040ff]Прекрати барахтаться [w:3]- так будет проще нам обоим","[color:8040ff]Когда я покончу с тобой,[w:3] она [w:3]- следующая.[w:6] Не тешь себя надеждами,[w:3] если что[waitall:4][w:3]...","[color:8040ff]Твое милосердие однажды привело тебя ко мне.[w:6] С чего бы ты вдруг изменил решение?"}))
				dial=GiveRandom({{"[func:LostKidFace,hope_cheers,+]Прошу,[w:3] сохраняй \nрешимость![w:6] [func:LostKidFace,hope_smile,+] \nНе дай этому \nпоглотить тебя![w:6]"},{"[func:LostKidFace,hope_close,-]Мы зашли так \nдалеко[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,hope_cheers,+] вместе.[w:6] [func:LostKidFace,hope_smile,+] \nНе смей меня \nбросать снова,[w:3] \nпартнёр![w:6]"},{"[func:LostKidFace,hope_smile,+]Когда я наконец \nсмогла тебя понять[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,hope_sobbing,+]\nЯ не хочу снова \nпотерять тебя![w:6]"},{"[func:LostKidFace,hope_close,-]Помни[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,hope_cheers,+] Мы все на \nтвоей стороне![w:6][func:LostKidFace,hope_sobbing,+] \nТы не одинок![w:6]"}})
				else
				dial=GiveRandom({{"[func:LostKidFace,hope_cheers,+]Lütfen,[w:3] azimli \nkal![w:6] [func:LostKidFace,hope_smile,+]\nOnun tekrar seni \nele geçirmesine izin verme![w:6]"},{"[func:LostKidFace,hope_close,-]Çok uzağa geldik[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,hope_cheers,+]\nberaber.[w:6] [func:LostKidFace,hope_smile,+]\nBeni sakın \nbırakma,[w:3] \npartner![w:6]"},{"[func:LostKidFace,hope_smile,+]Seni sonunda \nanlıyorum[waitall:4][w:3]...[waitall:1][w:3][func:LostKidFace,hope_sobbing,+]\nSeni tekrar \nkaybedemem![w:6]"},{"[func:LostKidFace,hope_close,-]Hatırla[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,hope_cheers,+]Seni \ndestekliyoruz![w:6] [func:LostKidFace,hope_sobbing,+]\nYalnız değilsin![w:6]"}})
				BattleDialog(GiveRandom({"[color:8040ff]Ne kadar sıra atlarsan,[w:3] işim o kadar kolaylaşır.","[color:8040ff]Kendini kurtaramazsan başkasını kurtarmazsın.","[color:8040ff]İlginç,[w:3] Merhamet artık tek çıkış yolumuz,[w:3] değil mi?","[color:8040ff]Dayanmayı bırak - bunu ikimiz için de kolaylaştır.[w:6]","[color:8040ff]Seni alt edince,[w:3] sırada o olacak.[w:6] Umutlanma,[w:3] bu arada.[w:6]","[color:8040ff]Merhametin beni sana yönlendirdi.[w:6] Neden şimdi fikrini değiştiriyorsun?"}))
			end
			else
			if lang=="rus" then
				BattleDialog(GiveRandom({"[color:8040ff]Ты упёртый.[w:6] Но я не могу позволить вам меня одолеть.","[color:8040ff]Не думал,[w:3] что мы окажемся на равных.[w:6] И всё же[waitall:4][w:3]...[waitall:1][w:3]\nВы проиграете.[w:6] Я знаю.","[color:8040ff]Столько Решимости потрачено и всё это будет напрасно,[w:3] когда я растопчу твою личность","[color:8040ff]Чем ближе ты к единице,[w:3] тем проще мне тебя захватить.[w:6] Задумайся о своих шансах."}))
				dial=GiveRandom({{"[func:LostKidFace,hope_close,-]Мы почти сделали \nэто[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,hope_determined,+] \nБудет трудно,[w:3] [func:LostKidFace,hope_cheers,+] но я \nверю в тебя.[w:6] [func:LostKidFace,hope_sobbing,+] \nКак Азриэль верил в \nтебя[waitall:4][w:3]...[waitall:1][w:3]"},{"[func:LostKidFace,hope_cheers,+]Ты был как часть \nмоей семьи для \nродителей[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,hope_sobbing,+] \nЯ уверенa,[w:3] они \nгордились бы тобой \nсейчас![w:6]"},{"[func:LostKidFace,hope_close,-]Король и Папайрус \nсмогли тебя принять \nв прошлом[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,hope_cheers,+] Смогут \nи сейчас.[w:6] [func:LostKidFace,hope_sobbing,+] Ты им как \nбрат,[w:3] который \nобъединяет их[waitall:4][w:3]...[waitall:1][w:3]"},{"[func:LostKidFace,hope_determined,+]Андайн и Альфис \nценили твою \nстойкость![w:6] \nНе дай их словам \nбыть напрасными,[w:3] \nпартнёр![w:6]"},{"[func:LostKidFace,hope_close,-]Я[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,hope_cheers,+] Партнёр,[w:3] я не \nмогу представить \nсвой <дом> без \nтебя[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,hope_sobbing,+]Давай исполним мою \nмечту вместе[waitall:4][w:3]...[waitall:1][w:3] \nНе сдавайся[waitall:4][w:3]...[waitall:1][w:3]"}})
				else
				BattleDialog(GiveRandom({"[color:8040ff]Çok inatçısın.[w:6] Ama ben de öyle kolay pes etmem.[w:6]","[color:8040ff]Benle eşit olmanı düşünemem.[w:6] Fakat yine[waitall:4][w:3]...[waitall:1][w:3] Sonunda kaybedeceksin.[w:6] \nBiliyorum.[w:6]","[color:8040ff]Kişiliğini yok edersem büyük bir oranda Kararlılık boşa gider.[w:6]","[color:8040ff]Ne kadar 1 LV'e yaklaşırsan,[w:3] seni ele geçirme şansım artar.[w:6] Seçeneklerini düşün.[w:6] "}))
				dial=GiveRandom({{"[func:LostKidFace,hope_close,-]Bir sona \nyakınız[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,hope_determined,+]\nBu zor olucak,[w:3] [func:LostKidFace,hope_cheers,+]fakat \nsana inanıyorum.[w:6] [func:LostKidFace,hope_sobbing,+]\nAsriel gibi.[w:6]"},{"[func:LostKidFace,hope_cheers,+]Toriel ve Asgore'a \nbir aile \ngibiydin[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,hope_sobbing,+]\nEminim,[w:3] burda olsalardı \nsana \ngurulanırlardı![w:6]"},{"[func:LostKidFace,hope_close,-]Kral ve Papyrus \nseni kabul \nederdi[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,hope_cheers,+]Seni \ndesteklerdiler.[w:6] ","[func:LostKidFace,hope_sobbing,+]Seni \nkendi kardeşleri \ngibi gördüler[waitall:4][w:3]...[waitall:1][w:3]"},{"[func:LostKidFace,hope_determined,+]Undyne ve Alphys \nkararlılığını \ntebrik etti![w:6] \nOnları \npişman etme,[w:3] \npartner![w:6]"},{"[func:LostKidFace,hope_close,-]B[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,hope_cheers,+]Ben \n <home>imi sensin \ndüşünemem[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,hope_sobbing,+]Hayalimi \ngerçekleştir[waitall:4][w:3]...[waitall:1][w:3] \nPes etme[waitall:4][w:3]...[waitall:1][w:3]"}})
			end
		end
		dial[#dial+1]="[noskip][func:LostKidFace,hope_base,+][next] "
		for i=1,#dial do
			dial[i]="[noskip]"..dial[i]
		end
		enemies[1].SetVar("currentdialogue",dial)
		PlayerHasSpared=true
	end
	nextwaves={"phase child/"..math.random(7)}
end

function GiveRandom(ingo)
	return ingo[math.random(#ingo)]
end
function MTT(ingo)
	SetGlobal("MTT",ingo)
end

function EVERYTHINGEVERYWHERE()
	Evrywhere=1
end
function choice()
	SetGlobal("choicen",1)
	State("NONE")
end
function state(ingo)
	State(ingo)
end

function Level20()
	NewAudio.Play("levelup")
	Player.lv=20
	MaxHP=99
	level20=-10
end

function OnOff(ingo)
	local outgo=""
	if ingo then
		if lang=="rus" then
			outgo="ВКЛ"
			else
			outgo="AÇIK"
		end
		else
		if lang=="rus" then
			outgo="ВЫКЛ"
			else
			outgo="KAPALI"
		end
	end
	return outgo
end

function Differ(ingo)
	local outgo=""
	if ingo==1 then
		if lang=="rus" then
			outgo="[color:ff00ff]Верующий"
			else
			outgo="[color:ff00ff]Sadık"
		end
		elseif ingo==2 then
		if lang=="rus" then
			outgo="[color:ffffff]Деист"
			else
			outgo="[color:ffffff]Deist"
		end
		elseif ingo==3 then
		if lang=="rus" then
			outgo="[color:ff8888]Атеист"
			else
			outgo="[color:ff8888]Ateist"
		end
		elseif ingo==4 then
		if lang=="rus" then
			outgo="[color:ff0000]Тебя поимели"
			else
			outgo="[color:ff0000]Potalanmış"
		end
	end
	return outgo
end

function ShowDiffer(ingo)
	local outgo=""
	if ingo==1 then
		if lang=="rus" then
			outgo="[color:ff00ff]Ваша вера вам окупилась"
			else
			outgo="[color:ff00ff]İnancının karşılığını aldın"
		end
		elseif ingo==2 then
		if lang=="rus" then
			outgo="[color:ffffff]Любая вера хороша в меру"
			else
			outgo="[color:ffffff]İnanmak iyidir"
		end
		elseif ingo==3 then
		if lang=="rus" then
			outgo="[color:ff8888]Вы отвергли бога"
			else
			outgo="[color:ff8888]Tanrıyı reddettin"
		end
		elseif ingo==4 then
		if lang=="rus" then
			outgo="[color:ff0000]Бог отверг вас =)"
			else
			outgo="[color:ff0000]Tanrı seni reddetti =)"
		end
	end
	return outgo
end

function NameAchivement(ingo)
	local outgo=""
	local c=""
	if ingo==1 then
		c=""
		if lang=="rus" then
			outgo="Аутофобия"
			else
			outgo="Otofobi"
		end
		elseif ingo==2 then
		if lang=="rus" then
			outgo="Новая пьеса"
			else
			outgo="Yeni oyun"
		end
		c=""
		elseif ingo==3 then
		if lang=="rus" then
			outgo="На лезвии"
			else
			outgo="Kes gitsin"
		end
		c=""
		elseif ingo==4 then
		if lang=="rus" then
			outgo="Потерянное дитя"
			else
			outgo="Kayıp çocuk"
		end
		c=""
		elseif ingo==5 then
		if lang=="rus" then
			outgo="Дивный новый мир"
			else
			outgo="Yeni dünya"
		end
		c=""
		elseif ingo==6 then
		if lang=="rus" then
			outgo="Жертвенность"
			else
			outgo="İntikam"
		end
		c=""
		elseif ingo==7 then
		if lang=="rus" then
			outgo="Обжора"
			else
			outgo="Gargantua"
		end
		c=""
		elseif ingo==8 then
		if lang=="rus" then
			outgo="Бог вас не услышал"
			else
			outgo="Tanrı seni reddetti"
		end
		c=""
		elseif ingo==9 then
		if lang=="rus" then
			outgo="Не ты первый..."
			else
			outgo="Sonuncu da değil..."
		end
		c=""
		elseif ingo==10 then
		if lang=="rus" then
			outgo="Неприкосновенный"
			else
			outgo="Tek yumruk çocuk"
		end
		c=""
		elseif ingo==11 then
		if lang=="rus" then
			outgo="Пустой звук"
			else
			outgo="Boş konuşmak"
		end
		c=""
		elseif ingo==12 then
		if lang=="rus" then
			outgo="Открытые раны"
			else
			outgo="Açık yaralar"
		end
		c=""
	end
	outgo=c..outgo
	return outgo
end

function DiscAchivement(ingo)
	local outgo=""
	local c=""
	if ingo==1 then
		c=""
		if lang=="rus" then
			outgo="Последний враг на вашем пути повержен"
			else
			outgo="Son düşman yok edildi"
		end
		elseif ingo==2 then
		if lang=="rus" then
			outgo="Перестать играть наскучивший сценарий"
			else
			outgo="Sıkıcı senaryoyu oynamayı bırak"
		end
		c=""
		elseif ingo==3 then
		if lang=="rus" then
			outgo="С каких пор ты здесь главный?"
			else
			outgo="Ne zamandır kontrol sende?"
		end
		c=""
		elseif ingo==4 then
		if lang=="rus" then
			outgo="Воля к битве исчезла без следа"
			else
			outgo="Bu savaş..."
		end
		c=""
		elseif ingo==5 then
		if lang=="rus" then
			outgo="Несмотря ни на что... Вы все ещё вы"
			else
			outgo="Her şeye rağmen, sen hala sensin"
		end
		c=""
		elseif ingo==6 then
		if lang=="rus" then
			outgo="Такова цена вашей свободы"
			else
			outgo="Özgürlüğün bedeli bu"
		end
		c=""
		elseif ingo==7 then
		if lang=="rus" then
			outgo="Съесть все предметы в течение первой фазы"
			else
			outgo="Aşama 1 sırasına her eşyanı ye"
		end
		c=""
		elseif ingo==8 then
		if lang=="rus" then
			outgo="Попробовать молитву на высшей сложности"
			else
			outgo="En yüksek zorlukta dua etmeyi dene"
		end
		c=""
		elseif ingo==9 then
		if lang=="rus" then
			outgo="Умереть на фазе 1.5"
			else
			outgo="Aşama 1.5'da öl"
		end
		c=""
		elseif ingo==10 then
		if lang=="rus" then
			outgo="Пройти игру без получения урона"
			else
			outgo="Hasar almadan oyunu bitir"
		end
		c=""
		elseif ingo==11 then
		if lang=="rus" then
			outgo="Прочитать все варианты текста пощады Чары"
			else
			outgo="Tüm Pacifist textlerini oku"
		end
		c=""
		elseif ingo==12 then
		if lang=="rus" then
			outgo="Дойти до эпилога с <10 ОЗ"
			else
			outgo="10'dan az can ile oyunun sonuna gel"
		end
		c=""
	end
	outgo=c..outgo
	return outgo
end

function NameMusic(ingo)
	outgo="none"
	if ingo =="night" then
		outgo="Autophobia"
		elseif ingo=="wound" then
		outgo="Daemophobia"
		elseif ingo=="fires" then
		outgo="Fire and Whispers"
		elseif ingo=="devil" then
		outgo="Devilovania"
		elseif ingo=="blood" then
		outgo="Bloodshed"
		elseif ingo=="insane" then
		outgo="Insanity"
		elseif ingo=="insa" then
		outgo="INSANTION"
	end
	return outgo
end

function BoogyLook(ingo)
	Titr1.Buggy.sprite.Set("boggy/boogie_"..ingo)
end

function ForTitr1(ingo1,ingo2,ingo3)
	local outgo="[instant][novoice][font:overworld]"
	if not ingo3 then
		else
		outgo=outgo..ingo3
	end
	if lang=="rus" then
		outgo=outgo..ingo1
		else
		outgo=outgo..ingo2
	end
	return outgo
end

function GotAchivement6()
	GotAchivement(6)
end
function BoogyBubble(ingo)
	if ingo then
		Titr1.BuggyText.ShowBubble()
		else
		Titr1.BuggyText.HideBubble()
	end
end


	
function LostMettaFace(ingo)
	MettaScreams.Face=ingo
end

function NoTargeting()
	targeting.Remove()
end
function Titr1NextPhase()
	Titr1.phase=Titr1.phase+1
	IsTalk=false
	Titr1.timer=0
	Titr1.step=0
	Titr1.BuggyText.Remove()
end

function ReadyGlobalSave(ingo)
	BeginTheFight()
	for i=1,7 do
		enemies[i].Call("SetActive",false)
	end
	blood.Set("empty")
	wavetimer=9999999999
	enemies[1].Call("SetActive",true)
	if ingo=="1" then
		prog=0
		SetGlobal("facial_expression",22)
		enemies[1].Call("HandleAttack")
		nextwaves={"phase1/nicetomeetya"}
		if lang=="rus" then
			enemies[1].SetVar("currentdialogue",{" [next] ","[effect:none][noskip][func:TakeKnife][func:head][effect:none][novoice][color:ff0000][func:DUB,prolog/26]СЕЙЧАС ВЫПЬЕШЬ \n[waitall:2]ЧАШУ ИЗ БОЛИ\nДО [waitall:4][func:Devil,night]ДНА![w:10]","[next] "})
			comm="Последний актер на сцене!"
			else
			enemies[1].SetVar("currentdialogue",{" [next] ","[effect:none][func:DUB,prolog/26][noskip][func:TakeKnife][func:head][effect:none][novoice][color:ff0000]YAP[w:1]TIKLAR[w:2]ININ[w:1] \nBE[w:2]DEL[w:1]İNİ ÖDE[waitall:2]ME [func:Devil,night]\nZAM[w:5]ANI![w:20]","[next] "})
			comm="Son aktör sahnede!"
		end
		elseif ingo=="2" then
		SetGlobal("pray",2)
		prog=27
		SetGlobal("evasion",2)
		enemies[1].Call("HandleAttack")
		nextwaves={"phase1/shadows"}
		standnew=2
		standnow=2
		standtime=0
		evadelevel=2
		charatorso.Set(currentspr.."/chara/Chara_body")
		trs_sp=currentspr.."/chara/Chara_body"
		knifeinhand=true
		lgsx=maxleft
		SetGlobal("facial_expression",7)
		if lang=="rus" then
			enemies[1].SetVar("currentdialogue",{" [next] ","[effect:none][func:Devil]Так что давай не \nбудем отступать от \nнеё.","[next] "})
			comm="Чара разочарована в вас."
			else
			comm="Chara seems disappointed in you."
			enemies[1].SetVar("currentdialogue",{" [next] ","[effect:none][func:Devil]Dikkatimiz \ndağılmasın.","[next] "})
		end
		elseif ingo=="3" then
		blood.Set("1.2/chara/check_blood")
		prog=43
		enemies[1].Call("HandleAttack")
		nextwaves={"phase1.5/easy"}
		SetGlobal("facial_expression",46)
		if lang=="rus" then
			enemies[1].SetVar("currentdialogue",{" [next] ","[effect:none][func:Bloodshed][func:trigered]Да начнется \nкровопролитие!!","[next] "})
			comm="Значит,[w:3] она хочет сыграть по-взрослому[waitall:4][w:3]...[waitall:1][w:3] \nХорошо,[w:3] папик."
			else
			comm="So she wants to play hard[waitall:4][w:3]...[waitall:1][w:3] \nOkay,[w:3] daddy."
			enemies[1].SetVar("currentdialogue",{" [next] ","[effect:none][func:Bloodshed][func:trigered]Katliam \nbaşlasın!!","[next] "})
		end
		SetGlobal("pray",4)
		enemies[1].SetVar("dodge",false)
		enemies[1].SetVar("block",true)
		evadelevel=6
		ghostsnow={"Asriel_Sprite"}
		if currentspr=="1.2" then
			local torso=charatorso
			torso.Set(currentspr.."/chara/Chara_body_fight")
			trs_sp=currentspr.."/chara/Chara_body_fight"
			local legs=charalegs
			legs.Set(currentspr.."/chara/Chara_legs_fight")
			lgs_sp=currentspr.."/Chara_legs_fight"
			legs.x=8
			local head=charahead
			head.x=-7
		end
		enemies[1].Call("EpicKnife")
		phase=1.5
		elseif ingo=="4" then
		blood.Set("1.2/chara/check_blood")
		if FallingKnife.timer==-1 then
			FallingKnife.Knife.alpha=0
			FallingKnife.Knife.Set("KnifeFallen0")
			FallingKnife.phase=0
			FallingKnife.timer=0
		end
		prog=49
		phase=2
		FightGoes=false
		enemies[1].Call("HandleAttack")
		nextwaves={"nothing"}
		charatorso.Set(currentspr.."/chara/Chara_body")
		trs_sp=currentspr.."/chara/Chara_body"
		blood.Set(currentspr.."/chara/check_blood")
		standnew=2
		standnow=2
		standtime=0
		chainsaw=true
		SetGlobal("evasion",0)
		knifeinhand=true
		enemies[1].SetVar("dodge",false)
		enemies[1].SetVar("block",false)
		evadelevel=2
		SuddenStrike=true
		SetGlobal("facial_expression",6)
		if lang=="rus" then
			enemies[1].SetVar("currentdialogue",{" [next] ","[effect:none][noskip][func:tired][waitall:2][w:5]Я просто хочу \nпокоя[waitall:4][w:3]...","[next] "})
			comm="Сейчас,[w:3] актер![w:6] Нападай!"
			else
			enemies[1].SetVar("currentdialogue",{" [next] ","[effect:none][noskip][func:tired][waitall:2][w:5]Sadece barış \nistiyorum[waitall:4][w:3]...","[next] "})
			comm="Zamanımız geldi,[w:3] aktör![w:6] \nSaldır!"
		end
		cursefade=6000
		elseif ingo=="5" then
		enemies[1].Call("SetActive",false)
		enemies[5].Call("SetActive",true)
		logotimer=-60
		GlobalSaveTimer=0
		wons=1
		if currentspr=="1.2" then
			local torso=charatorso
			torso.Set(currentspr.."/chara/Chara_body0")
			trs_sp=currentspr.."/chara/Chara_body"
			local legs=charalegs
			legs.Set(currentspr.."/chara/Chara_legs")
			lgs_sp=currentspr.."/Chara_legs"
			legs.x=8
			local head=charahead
			head.x=-7
		end
		FightGoes=false
		deadlyhit=true
		nextwaves={"nothing"}
		enemies[1].SetVar("dodge",false)
		enemies[1].SetVar("block",false)
		evadelevel=6
		standnew=1
		standnow=1
		standtime=0
		LostHead="/lost child/lost_base"
		SetGlobal("facial_expression",60)
		wons=1
		FightGoes=false
		if currentspr=="1.2" then
			local torso=charatorso
			torso.Set(currentspr.."/chara/Chara_body0")
			trs_sp=currentspr.."/chara/Chara_body"
			local legs=charalegs
			legs.Set(currentspr.."/chara/Chara_legs")
			lgs_sp=currentspr.."/Chara_legs"
			legs.x=8
			local head=charahead
			head.x=-7
		end
		FightGoes=false
		deadlyhit=true
		nextwaves={"nothing"}
		enemies[1].SetVar("dodge",false)
		enemies[1].SetVar("block",false)
		evadelevel=6
		standnew=1
		standnow=1
		standtime=0
		elseif ingo=="6" then
		wons=1
		FightGoes=false
		if currentspr=="1.2" then
			local torso=charatorso
			torso.Set(currentspr.."/chara/Chara_body0")
			trs_sp=currentspr.."/chara/Chara_body"
			local legs=charalegs
			legs.Set(currentspr.."/chara/Chara_legs")
			lgs_sp=currentspr.."/Chara_legs"
			legs.x=8
			local head=charahead
			head.x=-7
		end
		FightGoes=false
		deadlyhit=true
		nextwaves={"nothing"}
		enemies[1].SetVar("dodge",false)
		enemies[1].SetVar("block",false)
		evadelevel=6
		standnew=1
		standnow=1
		standtime=0
		LostHead="/lost child/lost_base"
		local dial={}
		if lang=="rus" then
			dial={" [next] ","[effect:none]Ну, я буду говорить,[w:6]\nа ты уклоняться от \nнелепых потуг,[w:6]\nкоторые называют \nатаками.","[func:Achivement][func:SetMusic,lost][next] "}
			else
			dial={" [next] ","[effect:none]Well,[w:6] I will talk and \nyou will be dodging \nthose pathetic \nnon-sense called \nattacks.","[func:Achivement][func:SetMusic,lost][next] "}
		end
		if Achivements[4]=="0" then
			dial[#dial]="[noskip][novoice][instant]"..dial[#dial-1].."[instant:stop][func:Achivement][w:90][func:SetMusic,lost][next] "
		end
		enemies[1].SetVar("currentdialogue",dial)
		if lang=="rus" then
			comm="Это кажется интересным.[w:6]\nДавай не спешить,[w:3] дорогуша.[w:6] Пусть выговорится."
			else
			comm="This seems interesting.[w:6]\nAcele etmeyelim,[w:3] tatlım.[w:6] konuşmasına iizn ver."
		end
		SetGlobal("facial_expression",60)
	end
	local command={}
	if wons==0 then
		if lang=="rus" then
			command={"ПРОВЕРИТЬ", "МОЛИТВА"}
			else
			command={"İNCELE","DUA ET"}
		end
		else
		if lang=="rus" then
			command={"ПРОВЕРИТЬ"}
			else
			command={"İNCELE"}
		end
	end
	enemies[1].SetVar("commands",command)
end

function LostMettaAngry()
	MettaScreams.quick=0.25
	MettaLost=600-MettaScreams.Long
end

function LostMettaCalm()
	MettaScreams.quick=1
end

function METTANAME()
	MettaName=true
	State("NONE")
end

function LowerMusic()
	lowmusic=1
end

function LostHadLost()
	local dial
	if lang=="rus" then
		dial={"[func:Music,finale][func:LostKidFace,base_close,-]Это[waitall:4][w:3]...[waitall:1][w:3] Кгх[waitall:4][w:3]...[waitall:1][w:3] Больно[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,hope_base,+]Я надеялась, что \nудар будет не \nтакой[waitall:4][w:3]...[waitall:1][w:3] болезненный.[w:6] [func:LostKidFace,hope_smile,+]\nИзвини за \nтавтологию[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,hope_sobbing,+]Если честно[waitall:4][w:3]...[waitall:1][w:3] Болит \nне столько рана, \nсколько в груди[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,sobbing_smile,+]Потому что это \nчувство[waitall:4][w:3]...[waitall:1][w:3] Это конец \nдля нас двоих, \nпартнёр[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,hope_cheers,+]Я не смогла нас \nзащитить.[w:6] Это не \nтвоя вина.[w:6]","[func:LostKidFace,hope_sobbing,+]Во всём этом[waitall:4][w:3]...[waitall:1][w:3] \nвиновата только я.[w:6]","[func:LostKidFace,hope_cheers,+]Если в этом мире \nсуществует \nзагробный мир[waitall:4][w:3]...[waitall:1][w:3] \nЯ хотела бы[waitall:4][w:3]...[waitall:1][w:3] \nвстретиться там \nс тобой.[w:6]","[func:LostKidFace,hope_deathsmile,+][func:QuietMusic]Прощай[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,hope_deathsmile_close2,-]милое \nзеркальце[waitall:4][w:3]...[waitall:1][w:3][func:dead][w:60][func:LostHasLost]"}
		else
		dial={"[func:Music,finale][func:LostKidFace,base_close,-]O[waitall:4][w:3]...[waitall:1][w:3] Ah[waitall:4][w:3]...[waitall:1][w:3] Acıttı mı[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,hope_base,+]Umarım bu çok fazla acıtmamıştır[waitall:4][w:3]...[waitall:1][w:3] Acı verici[waitall:4][w:3]...[waitall:1][w:3] [func:LostKidFace,hope_smile,+]\nKendimi tekrarladığım için kusuruma bakma[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,hope_sobbing,+]Dürüst olmak gerekirse[waitall:4][w:3]...[waitall:1][w:3] Göğsümdeki yara kadar acıtmıyor.","[func:LostKidFace,sobbing_smile,+]Çünkü bu duygu[waitall:4][w:3]...[waitall:1][w:3] Bu ikimiz içinde son,[w:3] partner[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,hope_cheers,+]Bizi koruyamadım[waitall:4][w:3]...[waitall:1][w:3] Bu senin hatan değil.[w:6]","[func:LostKidFace,hope_sobbing,+]Suçlanması gereken tek kişi[waitall:4][w:3]...[waitall:1][w:3] Benim.","[func:LostKidFace,hope_cheers,+]Eğer ahiret gerçek ise[waitall:4][w:3]...[waitall:1][w:3] Umarım orada da[waitall:4][w:3]...[waitall:1][w:3] Karşılaşırız[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,hope_deathsmile,+][func:QuietMusic]Hele şükür[waitall:4][w:3]...[waitall:1][w:3] [waitall:1][w:3] [func:LostKidFace,hope_deathsmile_close2,-]\nGüzel ayna[waitall:4][w:3]...[waitall:1][w:3][func:dead][w:60][func:LostHasLost]"}
	end
	for i=1,#dial do
		dial[i]="[noskip]"..dial[i]
	end
	enemies[1].SetVar("currentdialogue",dial)
	State("ENEMYDIALOGUE")
end

function LostToMetta1()
	MettaLost=0
	State("NONE")
end
function Gotcha()
		SetGlobal("charaisdead", 6)
		SetMusic("none")
		if lang=="rus" then
			enemies[1].SetVar("currentdialogue", {"[noskip][func:head4]И[w:4].[w:4].[w:4].[w:4] [func:NoMercy1]Попался!"})
			else
			enemies[1].SetVar("currentdialogue", {"[noskip][func:head4]Ve.[w:4].[w:4].[w:4] [func:NoMercy1]Gotcha!"})
		end
		nextwaves = {"nothing"}
		State("ENEMYDIALOGUE")
end



function GotAchivement(num)
	--Audio.PlaySound("ding")
	if Achivements[num]=="0" then
		if Achiventor.Time==0 then
			Achiventor.Time=1
		end
		Achivements[num]="1"
		WriteSavio()
		Achiventor.outgos[#Achiventor.outgos+1]=num
	end
end

function JUMP()
	Audio.PlaySound("jumpscare")
end
function Mttsaw()
	SetGlobal("MTT","SAW")
	SetMusic("chainsaw")
end
function PlayerGetsKilled()
	PlayerGotsKilled=1
end

function HappyCharaMeal1()
	local dial={}
	arenasize={565,130}
	if lang=="rus" then
		dial={"[func:LostKidFace,hope_question,+]Значит[waitall:4][w:3]...[waitall:1][w:3] \nВсё кончено?","[func:HappyCharaMeal2]"}
		else
		dial={"[func:LostKidFace,hope_question,+]Yani[waitall:4][w:3]...[waitall:1][w:3] Bitti mi?","[func:HappyCharaMeal2]"}
	end
	for i=1,#dial do
		dial[i]="[noskip][effect:none]"..dial[i]
	end
	enemies[1].SetVar("currentdialogue",dial)
	State("ENEMYDIALOGUE")
end


function HappyCharaMeal3()
	local hp=enemies[1].GetVar("hp")
	if lang=="rus" then
		local part={}
		if hp==1500 then
			part[1]="[func:LostKidFace,chocolate1,+]Мне нужно было \nочистить мысли \nпосле того,[w:3] \nчто произошло."
		end
		if hp<1200 then
			part[#part+1]="[func:LostKidFace,chocolate1,+][func:HealUp]Шоколад отлично \nвосстанавливает ОЗ."
		end
		if hp<800 then
			part[#part+1]="[func:HealUp]Весь день бы его \nела[waitall:4][w:3]..."
		end
		if hp<450 then
			part[#part+1]="[func:HealUp]Но лучше всего \nшоколад,[w:3] \nконечно,[w:3] был у папы[waitall:4][w:3]..."
		end
		if hp<150 then
			part[#part+1]="[func:LostKidFace,chocolate4,+][func:HealUp]Восхитительно.[w:6] Чувствую \nсебя как новенькая!"
		end
		dial={"[func:LostKidFace,hope_smile,+][func:KnifeInPocket]П-погоди, партнёр[waitall:4][w:3]...","[func:LostKidFace,chocolate1,+][func:TakeOutChocolate]После такого \nнасыщенного дня \nмне нужна разрядка[waitall:4][w:3]...","[func:LostKidFace,chocolate2,+][func:EatChocolate1][waitall:4][w:3]...","[func:LostKidFace,chocolate3,-][func:EatChocolate2]Ммм[waitall:4][w:3]...[waitall:1][w:3] Обожаю \nшоколад."}
		for i=1,#part do
			dial[#dial+1]=part[i]
		end
		dial[#dial+1]="[func:HappyCharaMeal4]"
		else
		local part={}
		if hp==1500 then
			part[1]="[func:LostKidFace,chocolate1,+]I needed to clear \nmy head after all \nof this."
		end
		if hp<1200 then
			part[#part+1]="[func:LostKidFace,chocolate1,+]Chocolate heals \nevery wound.[w:6]"
		end
		if hp<800 then
			part[#part+1]="Bütün gün yiyebilirdim[waitall:4][w:3]...[waitall:1][w:3]"
		end
		if hp<450 then
			part[#part+1]="Ama yediğim en iyi çikolata babamınki[waitall:4][w:3]...[waitall:1][w:3]"
		end
		if hp<150 then
			part[#part+1]="[func:LostKidFace,chocolate4,+]İnanılmaz.[w:6] Yeni gibi hissediyorum.[w:6]"
		end
		dial={"[func:LostKidFace,hope_smile,+][func:KnifeInPocket]Bir dakika,[w:3] partner[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,chocolate1,+][func:TakeOutChocolate]Tüm bu yorucu günden sonra bir yenileyiciye ihtiyacım var[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,chocolate2,+][func:EatChocolate1][waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,chocolate3,-][func:EatChocolate2][waitall:4][w:3]...[waitall:1][w:3]Mmm,[w:3] Çikolata severim.[w:6]"}
		for i=1,#part do
			dial[#dial+1]=part[i]
		end
		dial[#dial+1]="[func:HappyCharaMeal4]"
	end
	for i=1,#dial do
		dial[i]="[noskip][effect:none]"..dial[i]
	end
	enemies[1].SetVar("currentdialogue",dial)
	State("ENEMYDIALOGUE")
end


function HappyCharaMeal5()
	local dial={}
	if lang=="rus" then
		dial={"[func:LostKidFace,chocolate3,-][func:BackChocolate]Э нет,[w:3] партнёр.","Сначала ты.[w:6][func:GiveChocolate] Давай,[w:3] \nвозьми шоколад.","[func:HappyCharaMeal6]"}
		else
		dial={"[func:LostKidFace,chocolate3,-][func:BackChocolate]Er,[w:3] not so soon,[w:3] \npartner","First you.[w:6] [func:GiveChocolate]Common,[w:3] \ntake a bite.[w:6]","[func:HappyCharaMeal6]"}
	end
	for i=1,#dial do
		dial[i]="[noskip][effect:none]"..dial[i]
	end
	enemies[1].SetVar("currentdialogue",dial)
	State("ENEMYDIALOGUE")
end


function HappyCharaMeal7()
	local dial={}
	if lang=="rus" then
		dial={"[func:LostKidFace,chocolate1,+]Эээ,[w:3] неа.~","Подойди ближе.[w:9] [func:LostKidFace,chocolate2,+]\nАааам.~","[func:HappyCharaMeal8]"}
		else
		dial={"[func:LostKidFace,chocolate1,+]Errr,[w:3] nope~","Come closer.[w:6] \n[func:LostKidFace,chocolate2,+]Open your mouth~","[func:HappyCharaMeal8]"}
	end
	for i=1,#dial do
		dial[i]="[noskip][effect:none]"..dial[i]
	end
	enemies[1].SetVar("currentdialogue",dial)
	State("ENEMYDIALOGUE")
end


function HappyCharaMeal9()
	local dial={}
	if lang=="rus" then
		dial={"[func:LostKidFace,hope_cheers,+][func:BackChocolate]Что же... Настала \nпора заканчивать \nнаше приключение,[w:3]\nда?","[func:LostKidFace,hope_close,-]Если честно,[w:3] я \nждала нашего \nвоссоединения на \nпути Пацифиста,[w:3] \nно то,[w:3] что \nон не за горами...","[func:LostKidFace,hope_base,+]Искренне меня \nрадует.","[func:LostKidFace,hope_sobbing,+][func:NoChocolate]Пойдем.[w:6] Давай \nсделаем это вместе.","[func:HappyCharaMeal10]"}
		else
		dial={"[func:LostKidFace,hope_cheers,+][func:BackChocolate]Well.[w:6].[w:6] It's time to end \nour journey,[w:3] isn't it?","[func:LostKidFace,hope_close,-]To be honest,[w:3] I was \nwaiting for our \nreunion in Pacifist \ntimeline,[w:3] but so \nsoon?[waitall:4][w:3]...[waitall:1][w:3]","[func:LostKidFace,hope_base,+]I am genuinely happy.[w:6]","[func:LostKidFace,hope_sobbing,+][func:NoChocolate]Come on.[w:6] We have a \nbusiness to be made.[w:6]","[func:HappyCharaMeal10]"}
	end
	for i=1,#dial do
		dial[i]="[noskip][effect:none]"..dial[i]
	end
	enemies[1].SetVar("currentdialogue",dial)
	State("ENEMYDIALOGUE")
end

function DoHand()
	ChocolateHand=CreateProjectileAbs("1.2/chara/chocalatehand0",charatorso.absx,charatorso.absy,"Top")
	ChocolateHand.sprite.Scale(2,2)
end

function NoDoHand()
	ChocolateHand.sprite.alpha=0
	--ChocolateHand=false
end

function HappyCharaMeal11()
	local dial={}
	if lang=="rus" then
		dial={"[func:CharaDownFaces,hope_base]* Ну что,[w:3] партнёр[waitall:4][w:3]...[waitall:1][w:3] Вот и наша точка расставания.","[func:CharaDownFaces,hope_cheers]* Но мы скоро встретимся.[w:6] Точнее[waitall:4][w:3]...[waitall:1][w:3] Я из прошлого.","[func:CharaDownFaces,hope_close]* Я рада[waitall:4][w:3]...[waitall:1][w:3] Что стала Чарой,[w:3] которая смогла тебя спасти.","[func:CharaDownFaces,hope_smile]* Смогла спасти своего партнёра.","[func:HideCharaDownFace][func:HappyCharaMeal12]"}
		else
		dial={"[func:CharaDownFaces,hope_base]* Peki,[w:3] partner[waitall:4][w:3]...[waitall:1][w:3] \nBu bizim ayrılış noktamız","[func:CharaDownFaces,hope_cheers]* Ama yakında seninle yeniden buluşacağım.[w:6] Peki[waitall:4][w:3]...[waitall:1][w:3] \nGeçmişteki ben ile.[w:6]","[func:CharaDownFaces,hope_close]* Seni kurtarabilen[waitall:4][w:3]...[waitall:1][w:3] Chara olmaktan mutluyum","[func:CharaDownFaces,hope_smile]* Partnerini kurtar","[func:HideCharaDownFace][func:HappyCharaMeal12]"}
	end
	for i=1,#dial do
		dial[i]="[noskip][font:overworld]"..dial[i]
	end
	State("NONE")
	CharaDownFace=CreateProjectileAbs("empty",106,160,"Top")
	CharaDownFace.sprite.Scale(2,2)
	CharasText=CreateText(dial,{160,180},420,"Top",-1)
	CharasText.HideBubble()
	CharasText.progressmode="manual"
end



function HappyCharaMeal12()
	local dial={}
	if lang=="rus" then
		dial={"Вы неловко отворачиваетесь.","На самом деле,[w:3] у вас по щекам стекают слёзы[waitall:4][w:3]...","Ну-ну,[w:3] незачем плакать[waitall:4][w:3]...","[func:HappyCharaMeal13][color:000000]"}
		else
		dial={"You turn away awkwardly.[w:6]","In fact,[w:3] tears are running down your cheeks[waitall:4][w:3]...[waitall:1][w:3]","Here,[w:3] here[waitall:4][w:3]...[waitall:1][w:3] \nThere's no need to cry now","[func:HappyCharaMeal13][color:000000]"}
	end
	for i=1,#dial do
		dial[i]="[noskip][novoice][voice:uidial]"..dial[i]
	end
	BattleDialog(dial)
end
	
function HideCharaDownFace()
	CharaDownFace.sprite.Set("empty")
end

function CharaDownFaces(ingo)
	CharaDownFace.sprite.Set("1.2/lost child/lost_"..ingo)
end

function CheckCap(ingo)
	local time=0
	if NewAudio.isStopped("CaP")==false then
		time=NewAudio.GetPlayTime("CaP")*60
	end
	if time>ingo then
		return true
		else
		return false
	end
end
function HappyCharaMeal13()
	local dial={}
	if lang=="rus" then
		dial={"[func:CharaDownFaces,hope_base]* Это будет наше первое обещание.","[func:CharaDownFaces,hope_smile]* Впереди нас ждет ещё много обещаний,[w:3] но давай никогда не забывать об этом одном.","* Давай пообещаем[waitall:4][w:3]...[waitall:1][w:3] [func:CharaDownFaces,hope_cheers]Что никогда не бросим это будущее,[w:3] что создали?","[func:CharaDownFaces,hope_close]* В последний миг[waitall:4][w:3]...[waitall:1][w:3] [func:CharaDownFaces,hope_cheers]Я хочу знать,[w:3] что спасла тех,[w:3] кого люблю.","[func:CharaDownFaces,hope_close]* Мой дом.[w:6] Мою семью.[w:6] Моих друзей.","[func:LowerMusic][w:30][func:CharaDownFaces,hope_deathsmile]* И тебя.[w:30][func:ToHappyTitrs][w:600][next] "}
		else
		dial={"[func:CharaDownFaces,hope_base]* Bunun ilk sözümüz olmasına izin ver","[func:CharaDownFaces,hope_smile]* Gelecekte onlardan pek çok olacak,[w:3] Ama şimdi bunu unutmayalım.[w:6]","* Hadi söz verelim[waitall:4][w:3]...[waitall:1][w:3] [func:CharaDownFaces,hope_cheers]Yarattığımız gelecekten asla vazgeçmeyeceğiz?","[func:CharaDownFaces,hope_close]* Sonunda[waitall:4][w:3]...[waitall:1][w:3] [func:CharaDownFaces,hope_cheers]Sevdiklerimi kurtardığımı bilmek istiyorum.[w:6]","[func:CharaDownFaces,hope_close]* Evim.[w:6] Ailem.[w:6] Arkadaşlarım.[w:6]","[func:LowerMusic][w:30][func:CharaDownFaces,hope_deathsmile]* Ve sen.[w:30][func:ToHappyTitrs][w:600][next] "}
	end
	for i=1,#dial do
		dial[i]="[noskip][font:overworld]"..dial[i]
	end
	State("NONE")
	CharasText=CreateText(dial,{160,180},420,"Top",-1)
	CharasText.HideBubble()
	CharasText.progressmode="manual"
end

function LowerMusic()
	QuietMusic=true
end

function LostHadWon()
	if lang=="rus" then
		BattleDialog({"[color:8040ff]Ррргх[waitall:4][w:3]...","[func:Quiet][color:8040ff]Да что ты себе позволяешь,[w:3] \rактёр?![w:2][next] ","[instant][color:8040ff]Д[color:000000]а [color:8040ff]что [color:000000]т[color:8040ff]ы себе по[color:000000]з[color:8040ff]воляешь, \rакт[color:000000]ё[color:8040ff]р?![instant:stop][w:2][next] ","[instant][color:8040ff]Д[color:000000]а [color:8040ff]ч[color:000000]т[color:8040ff]о [color:000000]т[color:8040ff]ы се[color:000000]б[color:8040ff]е по[color:000000]з[color:8040ff]вол[color:000000]я[color:8040ff]ешь, \rа[color:000000]к[color:8040ff]т[color:000000]ё[color:8040ff]р?![instant:stop][w:2][next] ","[color:8040ff][instant][color:000000]Да [color:8040ff]ч[color:000000]т[color:8040ff]о [color:000000]т[color:8040ff]ы се[color:000000]б[color:8040ff]е по[color:000000]з[color:8040ff]в[color:000000]о[color:8040ff]л[color:000000]я[color:8040ff]ешь, \rа[color:000000]ктё[color:8040ff]р?![instant:stop][w:2][next] ","[color:8040ff][instant][color:000000]Да [color:8040ff]ч[color:000000]т[color:8040ff]о [color:000000]т[color:8040ff]ы [color:000000]с[color:8040ff]е[color:000000]б[color:8040ff]е [color:000000]п[color:8040ff]о[color:000000]з[color:8040ff]в[color:000000]о[color:8040ff]л[color:000000]я[color:8040ff]е[color:000000]ш[color:8040ff]ь, \rа[color:000000]ктё[color:8040ff]р[color:000000]?[color:8040ff]!","[color:40207f][func:NAME1]Ты мне обязан жизнью![w:6] Как ты посмел меня предать?![w:2][next] ","[instant][color:40207f]Ты м[color:000000]н[color:40207f]е об[color:000000]я[color:40207f]зан жизнь[color:000000]ю[color:40207f]! Как ты посме[color:000000]л[color:40207f] ме[color:000000]н[color:40207f]я пред[color:000000]а[color:40207f]ть?![instant:stop][w:2][next] ","[instant][color:40207f]Т[color:000000]ы [color:40207f]м[color:000000]н[color:40207f]е [color:000000]о[color:40207f]б[color:000000]я[color:40207f]зан жи[color:000000]зн[color:40207f]ь[color:000000]ю[color:40207f]! К[color:000000]а[color:40207f]к ты посме[color:000000]л[color:40207f] ме[color:000000]н[color:40207f]я п[color:000000]р[color:40207f]ед[color:000000]а[color:40207f]ть?![instant:stop][w:2][next] ","[instant][color:40207f]Т[color:000000]ы [color:40207f]м[color:000000]н[color:40207f]е [color:000000]о[color:40207f]б[color:000000]я[color:40207f]з[color:000000]а[color:40207f]н [color:000000]ж[color:40207f]и[color:000000]зн[color:40207f]ь[color:000000]ю[color:40207f]! К[color:000000]а[color:40207f]к ты п[color:000000]о[color:40207f]сме[color:000000]л[color:40207f] ме[color:000000]н[color:40207f]я п[color:000000]р[color:40207f]ед[color:000000]а[color:40207f]т[color:000000]ь?[color:40207f]![instant:stop][w:2][next] ","[instant][color:40207f]Т[color:000000]ы [color:40207f]м[color:000000]н[color:40207f]е [color:000000]о[color:40207f]б[color:000000]я[color:40207f]з[color:000000]а[color:40207f]н [color:000000]ж[color:40207f]и[color:000000]зн[color:40207f]ь[color:000000]ю[color:40207f]! К[color:000000]а[color:40207f]к т[color:000000]ы[color:40207f] п[color:000000]о[color:40207f]с[color:000000]м[color:40207f]е[color:000000]л[color:40207f] [color:000000]м[color:40207f]е[color:000000]н[color:40207f]я п[color:000000]ре[color:40207f]д[color:000000]а[color:40207f]т[color:000000]ь?[color:40207f]![instant:stop][w:3]","[color:20103f][func:NAME2]Ты поплатишься за это[waitall:4][w:3]...[w:2][next] ","[instant][color:20103f]Ты поп[color:000000]л[color:20103f]атишь[color:000000]с[color:20103f]я за эт[color:000000]о[color:20103f]...[instant:stop][w:2][next] ","[instant][color:20103f]Ты поп[color:000000]л[color:20103f]ат[color:000000]и[color:000000]шь[color:000000]с[color:20103f]я [color:000000]з[color:20103f]а [color:000000]э[color:20103f]т[color:000000]о[color:20103f]...[instant:stop][w:2][next] ","[instant][color:000000]Т[color:20103f]ы п[color:000000]о[color:20103f]п[color:000000]л[color:20103f]а[color:000000]тишь[color:000000]ся з[color:20103f]а [color:000000]э[color:20103f]т[color:000000]о[color:20103f]...[instant:stop][w:2][next] ","[instant][color:000000]Ты [color:20103f]п[color:000000]опл[color:20103f]а[color:000000]тишься за э[color:20103f]т[color:000000]о[color:20103f]...[instant:stop][w:2][next] ","[instant][color:000000]Ты поплатишься за это[color:20103f]...[instant:stop][w:2]","[color:ffffff][waitall:4][w:3][func:NAME3]...","[color:ffffff][waitall:4][w:3]......","[novoice][voice:uidial][color:ffffff]Вы с облегчением вздохнули,[w:3] прочитав слова рассказчика,[w:3] что бы это ни значило.","[func:HappyCharaMeal1]"})
		else
		BattleDialog({"[noskip][color:8040ff]Ahhhh[waitall:4][w:3]...[waitall:1][w:3]","[noskip][func:Quiet][color:8040ff]Bu olacak şey değil,[w:3] aktör![w:2][next] ","[noskip][novoice][instant][noskip][color:8040ff]Bu[color:000000] [color:8040ff] ol[color:000000]ac[color:8040ff]a[color:000000]k [color:8040ff]şe[color:000000]y [color:8040ff]değil, a[color:000000]k[color:8040ff]tör![instant:stop][w:2][next] ","[noskip][novoice][instant][noskip][color:8040ff]Bu[color:000000] [color:8040ff] ol[color:000000]ac[color:8040ff]a[color:000000]k [color:8040ff]şe[color:000000]y [color:8040ff]değil, a[color:000000]k[color:8040ff]tör![instant:stop][w:2][next] ","[noskip][novoice][instant][noskip][color:000000]Bu[color:000000] [color:8040ff] ol[color:000000]ac[color:8040ff]a[color:000000]k [color:8040ff]şe[color:000000]y [color:8040ff]değil, a[color:000000]k[color:8040ff]tör![instant:stop][w:2][next] ","[noskip][novoice][instant][starcolor:000000][noskip][color:000000]Bu[color:000000] [color:8040ff] ol[color:000000]ac[color:8040ff]a[color:000000]k [color:8040ff]şe[color:000000]y [color:8040ff]değil, a[color:000000]k[color:8040ff]tör!![instant:stop]","[noskip][color:402080][func:NAME1]Bana hayatını borçlusun![w:6] Bana nasıl ihanet edersin?![w:2][next] ","[noskip][novoice][instant][color:402080]Bana [color:000000]w[color:402080]hayatını [color:000000]borçl[color:402080]usun! Bana [color:000000]n[color:402080]ası[color:000000]l[color:402080] ihane[color:000000]t[color:402080] edersin?![instant:stop][w:2][next] ","[noskip][novoice][instant][color:402080]Bana [color:000000]w[color:402080]hayatını [color:000000]borçl[color:402080]usun! Bana [color:000000]n[color:402080]ası[color:000000]l[color:402080] ihane[color:000000]t[color:402080] edersin[color:000000]?[color:402080]![instant:stop][w:2][next] ","[noskip][novoice][instant][starcolor:000000][color:402080]Bana [color:000000]w[color:402080]hayatını [color:000000]borçl[color:402080]usun! Bana [color:000000]n[color:402080]ası[color:000000]l[color:402080] ihane[color:000000]t[color:402080] edersin[color:000000]?[color:402080]![instant:stop]","[noskip][color:201040][func:NAME2]Bunu ödeyeceksin[waitall:4][w:3]...[waitall:1][w:3][next] ","[noskip][novoice][instant][color:201040]B[color:000000]u[color:201040]nu ö[color:000000]d[color:201040]eye[color:000000]c[color:201040]ce[color:000000]k[color:201040]sin...[instant:stop][w:2][next] ","[noskip][novoice][instant][color:201040]B[color:000000]u[color:201040]nu ö[color:000000]d[color:201040]eye[color:000000]c[color:201040]ce[color:000000]k[color:201040]sin...[instant:stop][w:2][next] ","[noskip][novoice][instant][color:000000]B[color:000000]u[color:201040]nu ö[color:000000]d[color:201040]eye[color:000000]c[color:201040]ce[color:000000]k[color:201040]sin...[instant:stop][w:2][next] ","[noskip][novoice][instant][color:000000]Bunu ödeyeceksin[color:201040]...","[noskip][novoice][func:NAME3][voice:uidial][waitall:4][w:3]...[waitall:1][w:3]","[noskip][novoice][voice:uidial][waitall:4][w:3]...[w:6]...[waitall:1][w:3]","[noskip][novoice][voice:uidial]Anlatıcının sözlerini okurken rahat bir nefes verdin,[w:3] bu her ne demek ise artık.","[noskip][func:HappyCharaMeal1]"})
	end
end

function ENOUGH()
	comm="[instant][novoice][color:8040ff]"
	if lang=="rus" then
		comm=comm.."Прошу, ХВАТИТ!"
		else
		comm=comm.."I beg you, ENOUGH!"
	end
	encountertext=comm
	State("ACTIONSELECT")
end

function TryThis1()
	comm="[instant][novoice][color:8040ff]"
	if lang=="rus" then
		comm=comm.."Попробуем это."
		else
		comm=comm.."Try this."
	end
end

function NAME1()
	local t={128,64,255}
	local c=0.5
	local t1=math.floor(t[1]*c)
	local t2=math.floor(t[2]*c)
	local t3=math.floor(t[3]*c)
	for i=1,#NameLetters do
		NameLetters[i].color32={t1,t2,t3}
	end
end

function NAME2()
	local t={128,64,255}
	local c=0.25
	local t1=math.floor(t[1]*c)
	local t2=math.floor(t[2]*c)
	local t3=math.floor(t[3]*c)
	for i=1,#NameLetters do
		NameLetters[i].color32={t1,t2,t3}
	end
end

function NAME3()
	for i=1,#NameLetters do
		NameLetters[i].Remove()
	end
	Player.name="Shifty"
end

function DoFalseHeart()
	fPlayer2=CreateProjectileAbs("ut-heart",320,390,"Top")
	fPlayer2.sprite.color={1,0,1}
	Box=CreateProjectileAbs("system/dialog",320,386,"BelowPlayer")
end

function DoChoiceCover()
	cOver=CreateProejctileAbs("system/over",320,400,"Top")
end

function DoThanks(side,name,word,pos,time)
	local p={}
	p.side=side
	p.pos=pos
	p.time=time
	p.txt1=CreateText("[instant][noskip][font:overworld]"..name,{180+160*side,pos},300,"Top",-1)
	p.txt1.alpha=0
	p.txt1.HideBubble()
	p.txt1.color={1,1,0}
	p.txt1.progressmode="none"
	p.txt2=CreateText("[instant][noskip][font:overworld]"..word,{180+160*side,pos-28},300,"Top",-1)
	p.txt2.alpha=0
	p.txt2.HideBubble()
	p.txt2.progressmode="none"
	return p
end

function DoPoster(side,spr,name,word,time)
	local p={}
	p.side=side
	p.StartTime=time
	p.spr=CreateProjectile("titr/"..spr,320-110*side,3,"Over")
	p.spr.sprite.SendToBottom()
	p.spr.MoveToAbs(p.spr.x,240+p.spr.sprite.height)
	p.spr.sprite.Scale(2,2)
	p.spr.sprite.alpha=0
	local x=190-160*side
	p.txt1=CreateText("[instant][noskip][font:overworld]"..name,{190-160*side,160},280,"Over",-1)
	p.txt1.color={1,1,0,0}
	p.txt1.HideBubble()
	p.txt1.progressmode="none"
	p.txt2=CreateText("[instant][noskip][font:overworld]"..word,{190-160*side,132},280,"Over",-1)
	p.txt2.color={1,1,1,0}
	p.txt2.HideBubble()
	p.txt2.progressmode="none"
	return p
end
function ToHappyTitrs()
	ToHappyTitres=1
	COVER=CreateProjectileAbs("overworld/beforebattle",320,240,"Top")
	COVER.sprite.alpha=0
	State("NONE")
end
function Quiting(ingo)
	if ingo then
		globalstage=ingo
	end
	WriteSavio()
	quittimer=1
	MyState="Quiting!"
	OutBlack=CreateProjectile("overworld/beforebattle",0,0,"Top")
	OutBlack.sprite.alpha=0
end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        

function NoGame()
	NoGameStep=NoGameStep+1
	NoGameTime=0
	NoGameStepy=0
end

function AllGoesDarkOnceMore()
	local t=CreateProjectileAbs("overworld/beforebattle",320,240,"Over")
	t.sprite.alpha=0
	t.SetVar("time",0)
	Titr2.BlackOut=t
end

function TryThis()
	local dial="[color:8040ff]"
	if lang=="rus" then
		dial=dial.."Вообще,[w:3] как-то скучно.[w:6]\nНадо разнообразить.[w:6]\nНапример[waitall:4][w:3]..."
		else
		dial=dial.."You know,[w:3] it's kinda boring.[w:6]\nLet's change something.[w:6]\nFor example[waitall:4][w:3]..."
	end
	BattleDialog({dial,"[func:DoAllPellets][func:TryThis1][func:state,ACTIONSELECT][next] "})
end

function DoAllPellets()
	Pellets=true
	DoesPellets=true
	for i=1,40 do
		local p=CreateSprite("leaf_r")
		p.x=700
		p.y=600
		p.SetVar("time",3199)
		p.SetVar("firsttime",i*80-79)
		p.SetVar("side",1)
		p.SetVar("Bang",false)
		table.insert(PELLETS,p)
	end
	for i=1,40 do
		local p=CreateSprite("leaf_r")
		p.SetVar("time",3199)
		p.x=700
		p.y=600
		p.Scale(-1,1)
		p.SetVar("firsttime",i*80-39)
		p.SetVar("side",-1)
		p.SetVar("Bang",false)
		table.insert(PELLETS,p)
	end
end

function introboogy(ingo)
	NoGameBoogy.sprite.Set("boggy/boogie_"..ingo)
end
