if _G.typicalcool ~= true then
    _G.typicalcool = true
    if setclipboard then
        setclipboard("net made for roware | join our discord server : https://discord.gg/RFKwREK9MK")
    end
    game:GetService("RunService").Heartbeat:Connect(function()
       workspace.FallenPartsDestroyHeight = 0/0
       settings().Physics.AllowSleep = false
       game:GetService("Players").LocalPlayer.ReplicationFocus = workspace
       settings().Physics.ThrottleAdjustTime = 6 - math.huge
       setsimulationradius(1000,1000)
       sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 1000)
    end)
end
