-- Modules/Movement.lua
return function(Options, main_sec)
    local LocalPlayer = game:GetService("Players").LocalPlayer
    
    main_sec:CreateToggle("Noclip", Options.Noclip, function(v)
        Options.Noclip = v
    end)

    game:GetService("RunService").Stepped:Connect(function()
        if Options.Noclip and LocalPlayer.Character then
            for _, p in pairs(LocalPlayer.Character:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
        end
    end)
end
