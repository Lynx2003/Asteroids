local physics = require("physics")


local sheet = require ("sheet")

local asteroid = {}

asteroid.belt = {}

function asteroid:create(group)
    local pedra = display.newImageRect( group, sheet.object, 1,  102, 85 )
    pedra.x = display.contentCenterX
    pedra.y = display.contentCenterY
    pedra.name = "asteroid"
    pedra:scale(0.5, 0.5)

    table.insert(self.belt, pedra);
    physics.addBody(pedra, 'dynamic', { radius = 20, bounce = 0.8})

       local deondevem = math.random(3)

       if (deondevem == 1) then
           pedra.x =-10
           pedra.y = math.random(display.contentHeight/2)
           pedra:setLinearVelocity(
               math.random(40,120),
               math.random(20,60)
           )

       elseif (deondevem == 2) then
           pedra.x = math.random(display.contentWidth)
           pedra.y = -10
           pedra:setLinearVelocity(
               math.random(-40,40),
               math.random(20,60)
           )

       else
           pedra.x = display.contentWidth + 10
           pedra.y = math.random(display.contentHeight/2)
           pedra:setLinearVelocity(
               math.random(-120,-40),
               math.random(20,60)
           )      
       end
       pedra:applyTorque(-0.5, -0.5)
end
   
function asteroid:action()
   for i, v in ipairs(self.belt) do
       physics.addBody(v, 'dynamic', { radius = 40, bounce = 0.8})

       

   end

end


return asteroid