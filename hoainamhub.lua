repeat task.wait() until game:IsLoaded()

local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,230,0,180)
frame.Position = UDim2.new(0.05,0,0.3,0)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,30)
title.Text = "Hoài Nam Hub | Titan Fishing"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

local autofish = Instance.new("TextButton", frame)
autofish.Position = UDim2.new(0,0,0,40)
autofish.Size = UDim2.new(1,0,0,35)
autofish.Text = "Auto Fish"

local autosell = Instance.new("TextButton", frame)
autosell.Position = UDim2.new(0,0,0,80)
autosell.Size = UDim2.new(1,0,0,35)
autosell.Text = "Auto Sell"

local tp = Instance.new("TextButton", frame)
tp.Position = UDim2.new(0,0,0,120)
tp.Size = UDim2.new(1,0,0,35)
tp.Text = "Teleport Island"

local af = false

autofish.MouseButton1Click:Connect(function()
af = not af
while af do
task.wait(1)
pcall(function()
game:GetService("ReplicatedStorage").Events.Fish:FireServer()
end)
end
end)

autosell.MouseButton1Click:Connect(function()
pcall(function()
game:GetService("ReplicatedStorage").Events.Sell:FireServer()
end)
end)

tp.MouseButton1Click:Connect(function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,10,0)
end)
