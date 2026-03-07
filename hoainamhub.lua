repeat task.wait() until game:IsLoaded()

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/KavoUI.lua"))()

local Window = Library.CreateLib("Hoài Nam Hub | Titan Fishing","DarkTheme")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Farm")

_G.AutoFish = false
Section:NewToggle("Auto Fish", "Auto catch fish", function(v)
_G.AutoFish = v
while _G.AutoFish do
task.wait(1)
pcall(function()
game:GetService("ReplicatedStorage").Events.Fish:FireServer()
end)
end
end)

_G.AutoSell = false
Section:NewToggle("Auto Sell", "Auto sell fish", function(v)
_G.AutoSell = v
while _G.AutoSell do
task.wait(5)
pcall(function()
game:GetService("ReplicatedStorage").Events.Sell:FireServer()
end)
end
end)

Section:NewButton("Teleport Island 1","TP",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,10,0)
end)
