function love.conf(t)
    t.title = "Modern UI Demo"        -- The title of the window
    t.version = "11.4"                -- The LÖVE version this game was made for
    t.window.width = 800             -- Game's screen width
    t.window.height = 600            -- Game's screen height
    t.window.resizable = true        -- Let the window be user-resizable
    t.window.minwidth = 400          -- Minimum window width
    t.window.minheight = 300         -- Minimum window height
    t.window.vsync = true            -- Enable vertical sync
    
    -- For debugging
    t.console = true                 -- Attach a console for debug output
    
    -- Modules that we won't be using
    t.modules.joystick = false       -- We won't be using gamepad input
    t.modules.physics = false        -- We won't be using the physics module
end
