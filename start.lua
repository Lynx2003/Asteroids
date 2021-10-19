local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local _w = display.contentWidth
local _H = display.contentHeight
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    local bg = display.newImageRect(sceneGroup, "assets/background.png", 320, 480)
    bg.x = display.contentCenterX
    bg.y = display.contentCenterY

    local title = display.newImageRect(sceneGroup, "assets/title.png", 250, 45)
    title.x = display.contentCenterX
    title.y = display.contentCenterY / 3

    local optPlay = display.newText(
        sceneGroup,
        "PLAY",
        display.contentCenterX,
        _H * 5 / 10,
        native.systemFont,
        25
    );
        optPlay:addEventListener("tap", function()
        composer.gotoScene("level01", { effect = "slideLeft", time = 1500} )
    end)

    local optScore = display.newText(
        sceneGroup,
        "HIGH SCORE",
        display.contentCenterX,
        _H * 12 / 20,
        native.systemFont,
        12
    )
    optScore:addEventListener("tap", function()
    composer.gotoScene("Ranking", { effect = "slideRight", time = 1500})
    end
)
end 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene