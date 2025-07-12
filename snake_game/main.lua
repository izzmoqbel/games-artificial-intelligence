local GameState = require("gamestate")

local gameState = GameState:new()

function love.update(dt)
    gameState:update(dt)
end

function love.draw()
    gameState:draw()
end

function love.keypressed(key)
    if gameState.current == "menu" then
        if key == "return" then
            gameState:switch("playing")
        end
    elseif gameState.current == "playing" then
        local game = gameState.states.playing
        if key == "up" then
            game:changeDirection(0, -1)
        end
        if key == "down" then
            game:changeDirection(0, 1)
        end
        if key == "left" then
            game:changeDirection(-1, 0)
        end
        if key == "right" then
            game:changeDirection(1, 0)
        end
    end
end
