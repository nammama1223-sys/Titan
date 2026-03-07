repeat task.wait() until game:IsLoaded()

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/uilib.lua"))()

local Window = Library:Window("Hoài Nam Hub | Titan Fishing")

local Tab = Window:Tab("Main")

Tab:Toggle("Auto Fish",false,function(v)
_G.AutoFish = v
while _G.AutoFish do
task.wait(1)
pcall(function()
game:GetService("ReplicatedStorage").Events.Fish:FireServer()
end)
end
end)

Tab:Toggle("Auto Sell",false,function(v)
_G.AutoSell = v
while _G.AutoSell do
task.wait(5)
pcall(function()
game:GetService("ReplicatedStorage").Events.Sell:FireServer()
end)
end
end)

Tab:Button("Teleport Island 1",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,10,0)
end)
