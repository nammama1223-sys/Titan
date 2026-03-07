repeat task.wait() until game:IsLoaded()-- Hoài Nam Hub | Titan Fishing

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/banana-hub/banana-gui/main/source.lua"))()

local Window = Library:CreateWindow("Hoài Nam Hub | Titan Fishing")

local Tab = Window:CreateTab("Main")

Tab:CreateToggle("Auto Fish", function(state)
    _G.AutoFish = state
    while _G.AutoFish do
        task.wait()
        pcall(function()
            game:GetService("ReplicatedStorage").Events.Fish:FireServer()
        end)
    end
end)

Tab:CreateToggle("Auto Sell", function(state)
    _G.AutoSell = state
    while _G.AutoSell do
        task.wait(5)
        pcall(function()
            game:GetService("ReplicatedStorage").Events.Sell:FireServer()
        end)
    end
end)

Tab:CreateButton("Teleport Island 1", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,10,0)
end)

Tab:CreateButton("Teleport Island 2", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(500,10,200)
end)

Tab:CreateButton("Teleport Island 3", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-400,10,600)
end)

Tab:CreateButton("Teleport Island 4", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(900,10,-200)
end)

Tab:CreateButton("Teleport Island 5", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-800,10,-500)
end)
