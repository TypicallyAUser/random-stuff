if _G.typicalcool ~= true then
    _G.typicalcool = true
    game:GetService("RunService").Heartbeat:Connect(function()
       workspace.FallenPartsDestroyHeight = 0/0
       settings().Physics.AllowSleep = false
       game:GetService("Players").LocalPlayer.ReplicationFocus = workspace
       settings().Physics.ThrottleAdjustTime = 6 - math.huge
       setsimulationradius(1000,1000)
       sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 1000)
    end)
end
