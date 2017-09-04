-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local physics = require("physics")
system.activate( "multitouch" )
physics.start()
physics.setGravity( 0,3)



local background = display.newImage("universe.jpg",1280,720)
background.x = display.contentCenterX
background.y = display.contentCenterY



 

local plataforma = display.newImageRect("plataforma.png",152,25)
plataforma.x = display.contentWidth-428
plataforma.y = display.contentHeight-20
physics.addBody(plataforma,"static",{bounce=0.0,friction=1})

local plataforma2 = display.newImageRect("plataforma.png",152,25)
plataforma2.x = display.contentWidth-250
plataforma2.y = display.contentHeight-70
physics.addBody(plataforma2,"static",{bounce=0.0,friction=1})

local plataforma3 = display.newImageRect("plataforma.png",152,25)
plataforma3.x = display.contentWidth-80
plataforma3.y = display.contentHeight-120
physics.addBody(plataforma3,"static",{bounce=0.0,friction=1})

local gato = display.newImage("gato.png")
physics.addBody(gato,"dynamic",{ friction=1,bounce= 0.0})
gato.x= display.contentCenterX
gato.isFixed = true

local botao = {}

botao[1] = display.newImageRect("botao.png",50,50)
botao[1].x = display.contentWidth-450
botao[1].y = display.contentHeight-40
botao[1].alpha = 0.7
botao[1].myName = "esquerda"


botao[2] = display.newImageRect("botao.png",50,50)
botao[2].x = display.contentWidth-350
botao[2].y = display.contentHeight-40
botao[2].rotation = 180
botao[2].alpha = 0.7
botao[2].myName = "direita"

botao[3] = display.newImageRect("pulo.png",65,65)
botao[3].x = display.contentWidth-40
botao[3].y = display.contentHeight-40
botao[3].alpha = 0.7
botao[3].myName = "pulo"



local gatoX = 0

local toque = function(e)
	if e.phase == "began" or e.phase == "moved" then
		if e.target.myName == "esquerda" then 
			gatoX = -2            
		elseif e.target.myName == "direita" then 
			gatoX = 2

		elseif e.target.myName == "pulo" then
			gato:setLinearVelocity(0,-100)
		end

	else 
		gatoX=0
	end
end
local j = 1
for j = 1 , #botao do   
	botao[j]:addEventListener("touch", toque)
end


local cont_plat = 0
local plat_boolean = true 
local plat_andar = function ()
	if cont_plat == 40 then
		plat_boolean = false
	elseif cont_plat == 0 then
		plat_boolean = true
	end

	if plat_boolean == true then
		plataforma.x=plataforma.x + 2
		cont_plat=cont_plat+1
	else
		plataforma.x = plataforma.x - 2
		cont_plat= cont_plat-1
	end
	
end

local cont_platV = 0
local plat_booleanV = true 
local plat_andarV = function ()
	if cont_platV == 40 then
		plat_booleanV = false
	elseif cont_platV == 0 then
		plat_booleanV = true
	end

	if plat_booleanV == true then
		plataforma2.y=plataforma2.y - 2
		cont_platV=cont_platV+1
	else
		plataforma2.y = plataforma2.y + 2
		cont_platV= cont_platV-1
	end
	
end

local cont_plat3 = 0
local plat_boolean3 = true 
local plat_andar3 = function ()
	if cont_plat3 == 40 then
		plat_boolean3 = false
	elseif cont_plat3 == 0 then
		plat_boolean3 = true
	end

	if plat_boolean3 == true then
		plataforma3.x=plataforma3.x + 2
		cont_plat3=cont_plat3+1
	else
		plataforma3.x = plataforma3.x - 2
		cont_plat3= cont_plat3-1
	end
	
end

local andar = function()
	gato.x = gato.x + gatoX


end
Runtime:addEventListener("enterFrame",andar)
timer.performWithDelay(25,plat_andar,-1)
timer.performWithDelay(25,plat_andarV,-1)
timer.performWithDelay(25,plat_andar3,-1)
