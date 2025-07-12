local menu = {}

function menu:update(dt)
end

function menu:draw()
    local screenWidth = love.graphics.getWidth()
    love.graphics.printf("Press Enter to Start", 0, 200, screenWidth, "center")
end

return menu
