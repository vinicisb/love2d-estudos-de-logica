local StateManager = require("src.states.StateManager")
local PauseState = require("src.states.PauseState") -- Precisamos carregar o pause para usá-lo
local PlayerModel = require("src.models.PlayerModel")
local PlayerController = require("src.controllers.PlayerController")
local PlayerView = require("src.views.PlayerView")

local GameState = {}

function GameState:enter()
    self.model = PlayerModel.new(400, 300)
    self.controller = PlayerController.new(self.model)
    self.view = PlayerView.new(self.model)
end

function GameState:update(dt)
    -- Lógica pesada do jogo, raycasting, movimentação de inimigos
    self.controller:update(dt)
end

function GameState:draw()
    self.view:draw()
end

function GameState:keypressed(key)
    if key == "escape" then
        -- Quando apertar ESC, nós EMPILHAMOS o Pause por cima do Jogo
        StateManager.push(PauseState)
    end
end

return GameState