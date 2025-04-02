local UI = require('ui')

function love.load()
    -- Set up window properties
    love.window.setMode(800, 600, {
        resizable = true,
        vsync = true,
        minwidth = 400,
        minheight = 300
    })
    
    -- Initialize UI
    UI.load()
    
    -- Colors
    colors = {
        background = {0.1, 0.1, 0.1},
        text = {1, 1, 1},
        button = {0.2, 0.2, 0.2},
        buttonHover = {0.3, 0.3, 0.3},
        accent = {0.6, 0.2, 0.8}
    }
end

function love.update(dt)
    UI.update(dt)
end

function love.draw()
    -- Set background color
    love.graphics.setBackgroundColor(unpack(colors.background))
    
    -- Draw UI elements
    UI.draw()
end

function love.mousepressed(x, y, button, istouch, presses)
    UI.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button, istouch, presses)
    UI.mousereleased(x, y, button)
end
