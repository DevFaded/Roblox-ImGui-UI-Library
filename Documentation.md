
# Roblox ImGui UI Library Documentation

---

### Loading the Library
```lua
local ImGUI = loadstring(game:HttpGet(('https://github.com/DevFaded/Roblox-ImGui-UI-Library/raw/refs/heads/main/source.lua')))()
```

### Creating a Window
```lua
local Window = ImGUI:AddWindow("Preview", {
    main_color = Color3.fromRGB(41, 74, 122),
    min_size = Vector2.new(500, 600),
    toggle_key = Enum.KeyCode.RightShift,
    can_resize = true,
})
```

### Adding Tabs
```lua
local Tab = Window:AddTab("Tab 1")
```

### UI Elements

#### Label
Displays static text.
```lua
Tab:AddLabel("Hello World!")
```

#### Button
Adds a clickable button with a callback.
```lua
Tab:AddButton("Button", function()
    print("Button clicked.")
end)
```

#### TextBox
Adds a text box for user input.
```lua
Tab:AddTextBox("TextBox", function(text)
    print(text)
end, {
    clear = false, -- Optional: Default is true
})
```

#### Switch
Adds a toggle switch.
```lua
local Switch = Tab:AddSwitch("Switch", function(bool)
    print(bool)
end)
Switch:Set(true) -- Set initial state
```

#### Slider
Adds a slider for numerical input.
```lua
local Slider = Tab:AddSlider("Slider", function(value)
    print(value)
end, {
    min = 0, -- Minimum value
    max = 100, -- Maximum value
    readonly = false, -- Optional: Default is false
})
Slider:Set(50) -- Set initial value
```

#### Keybind
Adds a keybind input.
```lua
Tab:AddKeybind("Keybind", function(key)
    print(key)
end, {
    standard = Enum.KeyCode.RightShift -- Default: RightShift
})
```

#### Dropdown
Adds a dropdown menu with selectable items.
```lua
local Dropdown = Tab:AddDropdown("Dropdown", function(selected)
    print(selected)
end)
for i = 1, 9 do
    Dropdown:Add(tostring(i)) -- Add items
end

local obj = Dropdown:Add("10") -- Add item "10"
obj:Remove() -- Remove the item
```

#### Color Picker
Adds a color picker.
```lua
local CP = Tab:AddColorPicker(function(color)
    print(color)
end)
CP:Set(Color3.new(1, 0, 0)) -- Set initial color
```

#### Console
Adds a console for text or code.
```lua
local Console = Tab:AddConsole({
    y = 100, -- Height of the console
    source = "Lua", -- Source language
})
Console:Set("-- Example code
for i = 1, 9 do 
    print(i)
end")
print(Console:Get()) -- Get current text
```

#### Horizontal Alignment
Adds horizontally aligned buttons.
```lua
local HA = Tab:AddHorizontalAlignment()
HA:AddButton("Execute", function()
    loadstring(Console:Get())() -- Execute console content
end)
HA:AddButton("Clear", function()
    Console:Set("") -- Clear console content
end)
```

#### Folder
Adds a collapsible folder for grouping elements.
```lua
local Folder = Tab:AddFolder("Folder")
Folder:AddLabel("Hello")

local Folder2 = Folder:AddFolder("?")
Folder2:AddLabel("Woo!")
```

### Managing Tabs
```lua
Tab:Show() -- Show the tab
ImGUI:FormatWindows() -- Formats all windows
```
