local PlayerView = {}
PlayerView.__index = PlayerView

function PlayerView.new(PlayerModel)
    local self = setmetatable({}, PlayerView)
    self.model = PlayerModel

    self.imgParado = love.graphics.newImage("assets/idle.png")
    self.imgAndando = love.graphics.newImage("assets/run.png")
    return self
end

function PlayerView:draw()
    local imgAtual = self.model.estaAndando and self.imgAndando or self.imgParado

    love.graphics.draw(
        imgAtual,
        self.model.x,
        self.model.y,
        0,
        self.model.direcaoX, 1,
        imgAtual:getWidth()/2, imgAtual:getHeight()/2
    )
end

return PlayerView