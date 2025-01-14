local ImGUI = loadstring(game:HttpGet("https://github.com/DevFaded/Roblox-ImGui-UI-Library/raw/refs/heads/main/source.lua"))()

local Window = ImGUI:AddWindow("Preview", {
    main_color = Color3.fromRGB(41, 74, 122),
    min_size = Vector2.new(500, 600),
    toggle_key = Enum.KeyCode.RightShift,
    can_resize = true,
})

local Tab = Window:AddTab("Tab 1")

-- Elements
Tab:AddLabel("Hello World!")

Tab:AddButton("Button", function()
    print("Button clicked.")
end)

Tab:AddTextBox("TextBox", function(text)
    print(text)
end, {
    clear = false,
})

local Switch = Tab:AddSwitch("Switch", function(bool)
    print(bool)
end)
Switch:Set(true)

local Slider = Tab:AddSlider("Slider", function(x)
    print(x)
end, {
    min = 0,
    max = 100,
    readonly = false,
})
Slider:Set(50)

Tab:AddKeybind("Keybind", function(key)
    print(key)
end, {
    standard = Enum.KeyCode.RightShift
})

local Dropdown = Tab:AddDropdown("Dropdown", function(object)
    print(object)
end)
for i = 1, 9 do
    Dropdown:Add(tostring(i))
end
local obj = Dropdown:Add("10")
obj:Remove()

local CP = Tab:AddColorPicker(function(color)
    print(color)
end)
CP:Set(Color3.new(1, 0, 0))

local Console = Tab:AddConsole({
    y = 100,
    source = "Lua",
})
Console:Set("-- Gamer time!\nfor i = 1, 9 do \n    print(i)\nend")
print(Console:Get())

local HA = Tab:AddHorizontalAlignment()
HA:AddButton("Execute", function()
    loadstring(Console:Get())()
end)
HA:AddButton("Clear", function()
    Console:Set("")
end)

local Folder = Tab:AddFolder("Folder")
Folder:AddLabel("Hello")
local Folder2 = Folder:AddFolder("?")
Folder2:AddLabel("Woo!")

Tab:Show()
ImGUI:FormatWindows()
