local StateManager = require("src.states.StateManager")
local GameState    = require("src.states.GameState")

local MenuState = {}

function MenuState:enter()
    print("Iniciando menu!")
end

function MenuState:updatedt()
    -- nada
end

function MenuState:draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("pressione espaço para iniciar!", 300, 300)
end

function MenuState:keypressed(key)
    if key == "space" then
        StateManager.switch(GameState)
    end
end

return MenuState