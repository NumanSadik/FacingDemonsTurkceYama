local samp={}

function samp.CheckCollision(Play,knif)
	local x=Play.x
	local y=Play.y
	local kx=knif.x
	local ky=knif.y
	local dist=math.sqrt((x-kx)*(x-kx)+(y-ky)*(y-ky))
	local napr=0
	if y<ky then
		napr=270+180*math.asin((x-kx)/dist)/math.pi
		else napr=90-180*math.asin((x-kx)/dist)/math.pi
	end
	local ug=napr-(knif.sprite.rotation%360)
	x=dist*math.cos(ug*math.pi/180)
	y=dist*math.sin(ug*math.pi/180)
	local toside=0
	local w=(knif.sprite.width/2*knif.sprite.xscale)+toside
	local h=(knif.sprite.height/2*knif.sprite.yscale)+toside
	local output=false
	if x<w and x>-w and y<h and y>-h then
		output=true
	end
	return output
end

return samp