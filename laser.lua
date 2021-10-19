local sheet = require("sheet")

local physics = require("physics")

local laser = {}

function laser:create(group, nave)
    local raio = display.newImageRect(
        group,
        sheet.object,
        5,
        14,
        40
    )
    raio.x = nave.x
    raio.y = nave.y
    raio.name = "laser"
    physics.addBody(raio, "dynamic", { isSensor = true})
    raio.isBullet = true
    raio:toBack()

    transition.to( raio, { y = - 40, time = 500 })
end

return laser