
--Made by : https://v3rmillion.net/member.php?action=profile&uid=244024
-- init
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/zxciaz/VenyxUI/main/Reuploaded"))() --someone reuploaded it so I put it in place of the original back up so guy can get free credit.
local venyx = library.new("Winnable Hub | Dog Adventure", 5013109572)

-- themes
local themes = {
Background = Color3.fromRGB(24, 24, 24),
Glow = Color3.fromRGB(0, 0, 0),
Accent = Color3.fromRGB(10, 10, 10),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast = Color3.fromRGB(14, 14, 14),  
TextColor = Color3.fromRGB(255, 255, 255)
}

-- first page
local page = venyx:addPage("Auto Farm", 5012544693)
local section1 = page:addSection("Auto Farm")

section1:addToggle("Auto Farm", nil, function(value)
_G.F = value
end)

mons = {}

for i,v in pairs(game:GetService("Workspace").Monster:GetChildren()) do
   table.insert(mons,v.Name)
end

section1:addDropdown("Select Monster", mons, function(text)
   Select = text
end)

section1:addButton("Refresh ", function()
    table.clear(mons)
for i,v in pairs(game:GetService("Workspace").Monster:GetChildren()) do
   table.insert(mons,v.Name)
end
end)

section1:addKeybind("Toggle Keybind", Enum.KeyCode.RightControl, function()
print("Activated Keybind")
venyx:toggle()
end, function()
print("Changed Keybind")
end)

-- second page
local theme = venyx:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
colors:addColorPicker(theme, color, function(color3)
venyx:setTheme(theme, color3)
end)
end

-- load
venyx:SelectPage(venyx.pages[1], true) -- no default for more freedom

    spawn(function()
        game:GetService("RunService").Heartbeat:Connect(function()
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and _G.F then
                setfflag("HumanoidParallelRemoveNoPhysics", "False")
                setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
                game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
            end
        end)
    end)

        spawn(function()
       game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
            if _G.F then
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Monster[Select].HumanoidRootPart.CFrame * CFrame.new(0,5,0)  * CFrame.Angles(math.rad(-90),0,0)
    if game:GetService("Workspace").Monster[Select].Humanoid.Health == 0 then
    game:GetService("Workspace").Monster[Select]:Destroy()
    end
            end
        end)
       end)
        end)
