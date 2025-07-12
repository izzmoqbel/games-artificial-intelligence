local HighScore = {}

function HighScore:save(score)
    -- Using "to-be-closed" variable feature to automatically close the file when it goes out of scope
    local file<close> = io.open("highscore.txt", "w")
    if file then
        file:write(tostring(score))
        -- File automatically closes even if error occurs 
    end
end

function HighScore:load()
    local file<close> = io.open("highscore.txt", "r")
    if file then
        local content = file:read("*a")
        return tonumber(content) or 0
    end
    return 0
end

return HighScore
