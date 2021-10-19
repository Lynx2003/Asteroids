display.setStatusBar(display.HiddenStatusBar)
math.randomseed(os.time())

local physics = require("physics")
physics.start()
physics.setGravity(0,0)

math.randomseed(os.time() )

local composer = require("composer")

local opt = {effect = "fade", time = 1500 }
composer.gotoScene("start", opt)

