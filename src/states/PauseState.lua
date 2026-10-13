local StateManager = require("src.states.StateManager")

local PauseState = {}

function PauseState:update(dt)
    -- O Pause não atualiza física nenhuma! 
    -- Ele só fica esperando o jogador apertar a tecla para sair.
end

function PauseState:draw()
    -- Desenhamos um fundo preto semi-transparente por cima de tudo
    love.graphics.setColor(0, 0, 0, 0.7) 
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("JOGO PAUSADO - Aperte ESC para voltar", 300, 300)
end

function PauseState:keypressed(key)
    if key == "escape" then
        -- Tira o Pause do topo da pilha. O GameState volta a ser o topo automaticamente!
        StateManager.pop()
    end
end

return PauseState