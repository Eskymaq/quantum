-- Movement.lua
return function(Options, main_sec, walk_sec, jump_sec, fly_sec)
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local LocalPlayer = Players.LocalPlayer

    -- Noclip
    main_sec:CreateToggle("Noclip", Options.Noclip, function(v)
        Options.Noclip = v
    end)

    RunService.Stepped:Connect(function()
        if Options.Noclip and LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)

    -- WalkSpeed
    walk_sec:CreateToggle("Enable WalkSpeed", Options.WalkSpeed, function(v)
        Options.WalkSpeed = v
    end)
    walk_sec:CreateSlider("Speed Value", 16, 100, Options.WalkSpeedValue, function(v)
        Options.WalkSpeedValue = v
        if Options.WalkSpeed and LocalPlayer.Character then
            LocalPlayer.Character.Humanoid.WalkSpeed = v
        end
    end)

    -- Jump
    jump_sec:CreateToggle("Infinite Jump", Options.InfiniteJump, function(v)
        Options.InfiniteJump = v
    end)

    game:GetService("UserInputService").JumpRequest:Connect(function()
        if Options.InfiniteJump then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end)
end
