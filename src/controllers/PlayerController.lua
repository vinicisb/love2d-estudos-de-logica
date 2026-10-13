local PlayerController = {}
PlayerController.__index = PlayerController

function PlayerController.new(PlayerModel)
    local self = setmetatable({}, PlayerController)
    self.model = PlayerModel
    return self
end

function PlayerController:update(dt)
    local dx = 0
    if love.keyboard.isDown("right") then dx = 1 end
    if love.keyboard.isDown("left") then dx = -1 end

    self.model:mover(dx, dt)
end

return PlayerController