local SnakeGame = {}

SnakeGame.__index = SnakeGame

function SnakeGame:new()
    local game = {
        snake = {{
            x = 10,
            y = 10
        } -- Starting position 
        },
        direction = {
            x = 1,
            y = 0
        },
        food = {
            x = 15,
            y = 15
        },
        score = 0,
        gameOver = false,
        moveTimer = 0,
        speed = 0.1
    }
    return setmetatable(game, SnakeGame)
end

function SnakeGame:update(dt)
    if self.gameOver then
        return
    end
    self.moveTimer = self.moveTimer + dt
    if self.moveTimer < self.speed then
        return
    end
    self.moveTimer = 0

    local head = self.snake[1]
    local newHead = {
        x = head.x + self.direction.x,
        y = head.y + self.direction.y
    }

    if newHead.x < 1 or newHead.y < 1 or newHead.x > 30 or newHead.y > 20 then
        self.gameOver = true
        return
    end

    for i = 2, #self.snake do
        local segment = self.snake[i]
        if newHead.x == segment.x and newHead.y == segment.y then
            self.gameOver = true
            return
        end
    end

    table.insert(self.snake, 1, newHead)

    if newHead.x == self.food.x and newHead.y == self.food.y then
        self.score = self.score + 1
        self.food = {
            x = math.random(1, 30),
            y = math.random(1, 20)
        }
    else
        table.remove(self.snake)
    end

end

function SnakeGame:draw()
    for _, segment in ipairs(self.snake) do
        love.graphics.rectangle("fill", segment.x * 20, segment.y * 20, 18, 18)
    end
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", self.food.x * 20, self.food.y * 20, 18, 18)
    love.graphics.setColor(1, 1, 1)

    love.graphics.print("Score: " .. self.score, 10, 10)

    if self.gameOver then
        local screenWidth = love.graphics.getWidth()
        love.graphics.printf("Game Over", 0, 200, screenWidth, "center")
    end
end

function SnakeGame:changeDirection(dx, dy)
    if self.direction.x == -dx or self.direction.y == -dy then
        return
    end
    self.direction = {
        x = dx,
        y = dy
    }
end

return SnakeGame
