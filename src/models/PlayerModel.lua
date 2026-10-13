local PlayerModel = {}
PlayerModel.__index = PlayerModel

function PlayerModel.new(x, y)
    local self = setmetatable({}, PlayerModel)
    self.x = x
    self.y = y
    self.speed = 300
    self.direcaoX = 1
    self.estaAndando = false
    return self
end

function PlayerModel:mover(dx, dt)
    self.x = self.x + (dx * self.speed * dt)

    if dx ~= 0 then
        self.direcaoX = dx > 0 and 1 or -1
        self.estaAndando = true
    else
        self.estaAndando = false
    end
end

return PlayerModel