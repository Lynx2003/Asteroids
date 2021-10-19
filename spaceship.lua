local sheet = require("sheet")

local physics = require("physics")

local laser = require("laser")

local spaceship = {}



function spaceship:create(group)

    local nave = display.newImageRect(
        group,
        sheet.object,
        4,
        98,
        79
    )
    nave:scale(0.5, 0.5)
    nave.x = display.contentCenterX
    nave.y = display.contentHeight - 50
    nave.name = "spaceship"
    physics.addBody(nave, "dynamic", { radius = 20, isSensor = true})
    nave:addEventListener("touch", self.motores)
    nave:addEventListener("tap", self.fogo)

end

function spaceship.motores(event)
    local nave = event.target

    if (event.phase == "began") then
     display.currentStage:setFocus( nave)

     nave.touchOffsetX = event.x - nave.x
     --- nave.touchOffsetY = event.y - nave.y
    end

    if (event.phase == "moved") then
        nave.x = event.x - nave.touchOffsetX
      ---  nave.y = event.y - nave.touchOffsetY
    end

    if (event.phase == "ended") then
        display.currentStage:setFocus( nil )

    end

    return true 
end

function spaceship.fogo(event) 
    local nave = event.target

    laser:create(display.newGroup(), nave)


end

return spaceship