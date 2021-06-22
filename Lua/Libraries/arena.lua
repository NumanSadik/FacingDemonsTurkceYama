Player.SetControlOverride(true)
width=100
height=100
awayx=0
awayy=150
if Encounter.GetVar("movefast")==true then
	speed=3
	else speed=2
end
Arena.ResizeImmediate(-10,0)
Player.MoveTo(0,130,true)
black=CreateSprite("black")
black.x=awayx+320
black.y=awayy+95
cornerupleft=CreateSprite("bomb")
cornerupleft.x=-width/2+awayx+320
cornerupleft.y=height/2+awayy+95
sideup=CreateSprite("bomb")
sideup.x=awayx+320
sideup.y=height/2+awayy+95
cornerupright=CreateSprite("bomb")
cornerupright.x=width/2+awayx+320
cornerupright.y=height/2+awayy+95
sideright=CreateSprite("bomb")
sideright.x=width/2+awayx+320
sideright.y=awayy+95
cornerdownright=CreateSprite("bomb")
cornerdownright.x=width/2+awayx+320
cornerdownright.y=-height/2+awayy+95
sidedown=CreateSprite("bomb")
sidedown.x=awayx/2+320
sidedown.y=-height/2+awayy+95
cornerdownleft=CreateSprite("bomb")
cornerdownleft.x=-width/2+awayx+320
cornerdownleft.y=-height/2+awayy+95
sideleft=CreateSprite("bomb")
sideleft.x=-width/2+awayx+320
sideleft.y=awayy+95
sideup.Scale(width/5,1)
sidedown.Scale(width/5,1)
sideright.Scale(1,height/5)
sideleft.Scale(1,height/5)
black.Scale(width,height)
black.SendToTop()
cornerupleft.SendToTop()
cornerupright.SendToTop()
cornerdownright.SendToTop()
cornerdownleft.SendToTop()
sideup.SendToTop()
sideright.SendToTop()
sidedown.SendToTop()
sideleft.SendToTop()



function arenachange(widthnw,heightnw,awayxnew,awayynew,speed1,speed2,boolean1,boolean2,boolean3,boolean4)--размер по х, размер по у, отдаление по х, отдаление по х, скорость изменени€ размера, скорость переставлени€ арены, перемещени€ в нужную точку и мгновенноке изменение размера, передвижение игрока вместе с ареной, отсутсвие двуижени€ игрока, отсутсвие двуижени€ игрока при зажатом ’
distx=0
disty=0
if not width then
	width=100
	height=100
	awayx=0
	awayy=150
end
local widthnew=widthnw+5
local heightnew=heightnw+5
if  width==widthnew and height==heightnew and awayx==awayxnew and awayy==awayynew then
	else
	boardup=false
	boardright=false
	boarddown=false
	boardleft=false
	if Player.y>awayy+height/2-10.5 then
		boardup=true 
	end
	if Player.y<awayy-height/2+10.5 then
		boarddown=true
	end
	if Player.x>awayx+width/2-10.5 then
		boardright=true
	end
	if Player.x<awayx-width/2+10.5 then
		boardleft=true
	end
	if width>widthnew then
		if width-speed1>widthnew then
			width=width-speed1
			if boardleft==true then
				distx=speed1/2
				elseif boardright then
				distx=-speed1/2
			end
			else 
			if boardleft==true then
				distx=width-widthnew
				elseif boardright then
				distx=-width+widthnew
			end
			width=widthnew
		end
		elseif width==widthnew then
		else
		if width+speed1<widthnew then
			width=width+speed1
			else width=widthnew
		end
	end
	if height>heightnew then
		if height-speed1>heightnew then
			height=height-speed1
			if boarddown==true then
				disty=speed1/2
				elseif boardup then
				disty=-speed1/2
			end
			else
			if boarddown==true then
				disty=height-heightnew
				elseif boardup then
				disty=-height+heightnew
			end
			 height=heightnew
		end
		elseif height==heightnew then
		else
		if height+speed1<heightnew then
			height=height+speed1
			else height=heightnew
		end
	end
	if awayx>awayxnew then
		if awayx-speed2>awayxnew then
			awayx=awayx-speed2
			distx=-speed2
			else distx=awayxnew-awayx
			 awayx=awayxnew
		end
		elseif awayx<awayxnew then
		if awayx+speed2<awayxnew then
			awayx=awayx+speed2
			distx=speed2
			else distx=awayxnew-awayx
			  awayx=awayxnew
		end
	end
	if awayy>awayynew then
		if awayy-speed2>awayynew then
			awayy=awayy-speed2
			disty=-speed2
			else disty=awayynew-awayy
			  awayy=awayynew
		end
		elseif awayy<awayynew then
		if awayy+speed2<awayynew then
			awayy=awayy+speed2
			disty=speed2
			else disty=awayynew-awayy
			  awayy=awayynew
		end
	end
	if boolean1==true then
		width=widthnew
		height=heightnew
		awayx=awayxnew
		awayy=awayynew
		if Player.x>awayx+width/2-10.5 then
			Player.MoveTo(awayx+width/2-10.5,Player.y,true)
		end
		if Player.x<awayx-width/2+10.5 then
			Player.MoveTo(awayx-width/2+10.5,Player.y,true)
		end
		if Player.y<awayy-height/2+10.5 then
			Player.MoveTo(Player.x,awayy-height/2+10.5,true)
		end
		if Player.y>awayy+height/2-10.5 then
			Player.MoveTo(Player.x,awayy+height/2-10.5,true)
		end
	end
	if boolean2==false then
		if (distx>0 and boardleft==false) or (distx<0 and boardright==false) then
			distx=0
		end
		if (disty>0 and boarddown==false) or (disty<0 and boardup==false) then
			disty=0
		end
	end
	black.x=awayx+320
	black.y=awayy+95
	cornerupleft.x=-width/2+awayx+320
	cornerupleft.y=height/2+awayy+95
	sideup.x=awayx+320
	sideup.y=height/2+awayy+95
	cornerupright.x=width/2+awayx+320
	cornerupright.y=height/2+awayy+95
	sideright.x=width/2+awayx+320
	sideright.y=awayy+95
	cornerdownright.x=width/2+awayx+320
	cornerdownright.y=-height/2+awayy+95
	sidedown.x=awayx+320
	sidedown.y=-height/2+awayy+95
	cornerdownleft.x=-width/2+awayx+320
	cornerdownleft.y=-height/2+awayy+95
	sideleft.x=-width/2+awayx+320
	sideleft.y=awayy+95
	sideup.Scale(width/5,1)
	sidedown.Scale(width/5,1)
	sideright.Scale(1,height/5)
	sideleft.Scale(1,height/5)
	black.Scale(width,height)
end
local moving=0
if Input.Cancel>0 then
	if not boolean4 then
		moving=speed/2
		else moving=0
	end
	else moving=speed
end
if not boolean3 then
	local nothing=arenaplayermove(moving,moving,distx,disty,true)
end

end


function arenaplayermove(speedx,speedy,arenax,arenay,boolean)	
if boolean==true then
	Player.MoveTo(Player.x+arenax,Player.y+arenay,true)
end
local moving=false
if Input.Up>0 and Input.Down==0 then
   if  Player.y+speedy<awayy+height/2-10.5 then
   	Player.MoveTo(Player.x,Player.y+speedy,true)
	moving=true
	else Player.MoveTo(Player.x,awayy+height/2-10.5,true)
   end
end
if Input.Right>0 and Input.Left ==0   then
   if  Player.x+speedx<awayx+width/2-10.5 then
   	Player.MoveTo(Player.x+speedx,Player.y,true)
	moving=true
   else Player.MoveTo(awayx+width/2-10.5,Player.y,true)
   end
end
if Input.Left>0   and Input.Right ==0  then
   if  Player.x-speedx>awayx-width/2+10.5 then
   	Player.MoveTo(Player.x-speedx,Player.y,true)
	moving=true
   else Player.MoveTo(awayx-width/2+10.5,Player.y,true)
   end
end 
if Input.Down>0  and Input.Up==0   then
   if  Player.y-speedy>awayy-height/2+10.5 then
   	Player.MoveTo(Player.x,Player.y-speedy,true)
	moving=true
   else Player.MoveTo(Player.x,awayy-height/2+10.5,true)
   end
end
return moving
end


function fakearenaend()
	black.Remove()
	cornerupleft.Remove()
	sideup.Remove()
	cornerupright.Remove()
	sideright.Remove()
	cornerdownright.Remove()
	sidedown.Remove()
	cornerdownleft.Remove()
	sideleft.Remove()
end


function arenaplace()
	return awayx,awayy
end


function arenaright()
	return awayx+width/2-10.5
end



function arenaup()
	return awayy+height/2-10.5
end

function IsMoving()
	return arenaplayermove(0,0,0,0,false)	
end

function arenaleft()
	return awayx-width/2+10.5
end

function arenadown()
	return awayy-height/2+10.5
end


	