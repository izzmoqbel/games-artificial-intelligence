local SnakeGame = require("snake_game")
local game = SnakeGame:new()

local state = {}

function state:update(dt)
    game:update(dt)
end

function state:draw()
    game:draw()
end

function state:changeDirection(dx, dy)
    game:changeDirection(dx, dy)
end

return state
