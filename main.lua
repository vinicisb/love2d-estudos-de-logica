local StateManager = require("src.states.StateManager")
local MenuState = require("src.states.MenuState") -- Vamos assumir que você criou um Menu

function love.load()
    -- O jogo inicia jogando o Menu na pilha
    StateManager.switch(MenuState)
end

function love.update(dt)
    StateManager.update(dt)
end

function love.draw()
    StateManager.draw()
end

function love.keypressed(key)
    StateManager.keypressed(key)
end