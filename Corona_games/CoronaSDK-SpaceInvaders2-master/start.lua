local composer = require( "composer" )
local scene = composer.newScene()

local startButton -- used to start the game
local pulsatingText = require("pulsatingtext") -- A module providing a pulsating text effect
local starFieldGenerator = require("starfieldgenerator") -- A module that generates the starFieldGenerator
local starGenerator -- An instance of the starFieldGenerator

function scene:create( event )
	local group = self.view
	startButton = display.newImage("new_game_btn.png",display.contentCenterX,display.contentCenterY+100)
    group:insert(startButton)
    local   invadersText =  pulsatingText.new( "INVADERZ",display.contentCenterX,display.contentCenterY-200,"Conquest", 20,group )

     invadersText:pulsate()


function scene:show( event )
	local phase = event.phase
    local previousScene = composer.getSceneName( "previous" )
	if(previousScene~=nil) then

	end
   if ( phase == "did" ) then
   startButton:addEventListener("tap",startGame)
   end


function scene:hide( event )
		local phase = event.phase
		if ( phase == "will" ) then
    		startButton:removeEventListener("tap",startGame)
			 Runtime:removeEventListener("enterFrame", starGenerator)
		end
end

function startGame()
	
composer.gotoScene("gamelevel")
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
return scene