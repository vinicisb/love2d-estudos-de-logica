local StateManager = {}

-- A nossa pilha (stack) começa vazia
local stack = {}

-- Muda de estado (limpa tudo e coloca um novo) - Ideal para ir do Menu pro Jogo
function StateManager.switch(newState)
    -- Se houver estados anteriores, chama a função de limpeza (exit) deles
    while #stack > 0 do
        local state = table.remove(stack)
        if state.exit then state:exit() end
    end
    
    -- Coloca o novo estado na pilha
    table.insert(stack, newState)
    if newState.enter then newState:enter() end
end

-- Coloca um estado EM CIMA do atual - Ideal para o Pause
function StateManager.push(newState)
    table.insert(stack, newState)
    if newState.enter then newState:enter() end
end

-- Remove o estado do topo - Ideal para "Despausar"
function StateManager.pop()
    local state = stack[#stack]
    if state and state.exit then state:exit() end
    table.remove(stack)
end

-- O Update só roda o estado do TOPO da pilha
function StateManager.update(dt)
    local topo = stack[#stack]
    if topo and topo.update then
        topo:update(dt)
    end
end

-- O Draw desenha TODOS os estados, do fundo até o topo
function StateManager.draw()
    for i = 1, #stack do
        local state = stack[i]
        if state.draw then state:draw() end
    end
end

-- Repassa eventos de teclado apenas para o estado do topo
function StateManager.keypressed(key)
    local topo = stack[#stack]
    if topo and topo.keypressed then
        topo:keypressed(key)
    end
end

return StateManager