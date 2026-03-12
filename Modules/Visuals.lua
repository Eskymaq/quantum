-- Visuals.lua
return function(Options, esp_sec)
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local LocalPlayer = Players.LocalPlayer

    local function ClearAllHighlights()
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Highlight") and (obj.Name == "MonsterESP" or obj.Name == "PlayerESP") then
                obj:Destroy()
            end
        end
    end

    esp_sec:CreateToggle("Monster ESP", Options.MonsterESP, function(v)
        Options.MonsterESP = v
        if not v then ClearAllHighlights() end
    end)

    esp_sec:CreateToggle("Player ESP", Options.PlayerESP, function(v)
        Options.PlayerESP = v
        if not v then ClearAllHighlights() end
    end)

    -- ESP Loop
    task.spawn(function()
        while true do
            task.wait(2)
            
            -- Monster ESP
            if Options.MonsterESP then
                for _, m in ipairs(workspace:GetDescendants()) do
                    if m:IsA("Model") and not Players:GetPlayerFromCharacter(m) 
                    and m:FindFirstChild("HumanoidRootPart") and not m:FindFirstChild("MonsterESP") then
                        local h = Instance.new("Highlight")
                        h.Name = "MonsterESP"
                        h.FillColor = Color3.fromRGB(255, 0, 0)
                        h.Parent = m
                    end
                end
            end

            -- Player ESP
            if Options.PlayerESP then
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                        if not plr.Character:FindFirstChild("PlayerESP") then
                            local h = Instance.new("Highlight")
                            h.Name = "PlayerESP"
                            h.FillColor = Color3.fromRGB(0, 255, 0)
                            h.Parent = plr.Character
                        end
                    end
                end
            end
        end
    end)
end
