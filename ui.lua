local UI = {
    buttons = {},
    activePanel = "main",
    panels = {
        main = {},
        settings = {},
        profile = {}
    },
    fonts = {}
}

-- Button class
local Button = {}
Button.__index = Button

function Button.new(x, y, width, height, text, callback)
    local self = setmetatable({}, Button)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.text = text
    self.callback = callback
    self.isHovered = false
    return self
end

function Button:update(dt)
    local mx, my = love.mouse.getPosition()
    self.isHovered = mx >= self.x and mx <= self.x + self.width and
                     my >= self.y and my <= self.y + self.height
end

function Button:draw()
    -- Draw button background
    if self.isHovered then
        love.graphics.setColor(unpack(colors.buttonHover))
    else
        love.graphics.setColor(unpack(colors.button))
    end
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, 5, 5)
    
    -- Draw button border
    love.graphics.setColor(unpack(colors.accent))
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height, 5, 5)
    
    -- Draw button text
    love.graphics.setColor(unpack(colors.text))
    local textW = UI.fonts.default:getWidth(self.text)
    local textH = UI.fonts.default:getHeight()
    love.graphics.print(
        self.text,
        UI.fonts.default,
        self.x + (self.width - textW) / 2,
        self.y + (self.height - textH) / 2
    )
end

function UI.load()
    -- Load fonts
    UI.fonts.default = love.graphics.newFont(14)
    UI.fonts.title = love.graphics.newFont(24)
    
    -- Create main menu buttons
    table.insert(UI.panels.main, Button.new(300, 200, 200, 40, "Play Game", function() print("Play clicked") end))
    table.insert(UI.panels.main, Button.new(300, 260, 200, 40, "Settings", function() UI.activePanel = "settings" end))
    table.insert(UI.panels.main, Button.new(300, 320, 200, 40, "Profile", function() UI.activePanel = "profile" end))
    table.insert(UI.panels.main, Button.new(300, 380, 200, 40, "Exit", function() love.event.quit() end))
    
    -- Create settings menu buttons
    table.insert(UI.panels.settings, Button.new(300, 200, 200, 40, "Graphics", function() print("Graphics clicked") end))
    table.insert(UI.panels.settings, Button.new(300, 260, 200, 40, "Audio", function() print("Audio clicked") end))
    table.insert(UI.panels.settings, Button.new(300, 320, 200, 40, "Controls", function() print("Controls clicked") end))
    table.insert(UI.panels.settings, Button.new(300, 380, 200, 40, "Back", function() UI.activePanel = "main" end))
    
    -- Create profile menu buttons
    table.insert(UI.panels.profile, Button.new(300, 200, 200, 40, "View Stats", function() print("Stats clicked") end))
    table.insert(UI.panels.profile, Button.new(300, 260, 200, 40, "Achievements", function() print("Achievements clicked") end))
    table.insert(UI.panels.profile, Button.new(300, 320, 200, 40, "Back", function() UI.activePanel = "main" end))
end

function UI.update(dt)
    -- Update all buttons in current panel
    for _, button in ipairs(UI.panels[UI.activePanel]) do
        button:update(dt)
    end
end

function UI.draw()
    -- Draw panel title
    love.graphics.setColor(unpack(colors.text))
    love.graphics.setFont(UI.fonts.title)
    local title = UI.activePanel:gsub("^%l", string.upper)
    local titleW = UI.fonts.title:getWidth(title)
    love.graphics.print(title, (800 - titleW) / 2, 100)
    
    -- Draw all buttons in current panel
    love.graphics.setFont(UI.fonts.default)
    for _, button in ipairs(UI.panels[UI.activePanel]) do
        button:draw()
    end
end

function UI.mousepressed(x, y, button)
    if button == 1 then
        for _, btn in ipairs(UI.panels[UI.activePanel]) do
            if btn.isHovered then
                btn.callback()
                return
            end
        end
    end
end

function UI.mousereleased(x, y, button)
    -- Handle mouse release events if needed
end

return UI
