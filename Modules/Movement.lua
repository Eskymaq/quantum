-- Movement.lua
return function(Options, main_sec, walk_sec, jump_sec)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

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

    walk_sec:CreateToggle("Enable WalkSpeed", Options.WalkSpeed, function(v)
        Options.WalkSpeed = v
        if v then LocalPlayer.Character.Humanoid.WalkSpeed = Options.WalkSpeedValue end
    end)
    
    jump_sec:CreateToggle("Infinite Jump", Options.InfiniteJump, function(v)
        Options.InfiniteJump = v
    end)

    game:GetService("UserInputService").JumpRequest:Connect(function()
        if Options.InfiniteJump then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end)
end
