repeat task.wait() until game:IsLoaded()

local player = game.Players.LocalPlayer
local rs = game:GetService("ReplicatedStorage")

-- GUI
local gui = Instance.new("ScreenGui")
gui.Parent = player.PlayerGui
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,260,0,220)
main.Position = UDim2.new(0.05,0,0.3,0)
main.BackgroundColor3 = Color3.fromRGB(25,25,25)
main.Active = true
main.Draggable = true

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,30)
title.Text = "🍌 Hoài Nam Hub"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundColor3 = Color3.fromRGB(40,40,40)

local list = Instance.new("UIListLayout", main)
list.Padding = UDim.new(0,5)
list.SortOrder = Enum.SortOrder.LayoutOrder

local function button(txt)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1,0,0,35)
    b.Text = txt
    b.BackgroundColor3 = Color3.fromRGB(50,50,50)
    b.TextColor3 = Color3.new(1,1,1)
    b.Parent = main
    return b
end

local autoFish = button("🎣 Auto Fish")
local autoSell = button("💰 Auto Sell")
local autoSkill = button("⚡ Auto Skill")
local tpIsland = button("🗺 Teleport Island")
local antiAFK = button("🛡 Anti AFK")

-- Auto Fish
local AF = false
autoFish.MouseButton1Click:Connect(function()
AF = not AF
while AF do
task.wait(1)
pcall(function()
rs.Events.Fish:FireServer()
end)
end
end)

-- Auto Sell
autoSell.MouseButton1Click:Connect(function()
pcall(function()
rs.Events.Sell:FireServer()
end)
end)

-- Auto Skill
autoSkill.MouseButton1Click:Connect(function()
local v = game:GetService("VirtualInputManager")
v:SendKeyEvent(true,"Z",false,game)
v:SendKeyEvent(true,"X",false,game)
v:SendKeyEvent(true,"C",false,game)
v:SendKeyEvent(true,"V",false,game)
end)

-- Teleport
tpIsland.MouseButton1Click:Connect(function()
player.Character.HumanoidRootPart.CFrame = CFrame.new(0,10,0)
end)

-- Anti AFK
antiAFK.MouseButton1Click:Connect(function()
local vu = game:GetService("VirtualUser")
player.Idled:Connect(function()
vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
task.wait(1)
vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
end)
