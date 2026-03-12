-- Visuals.lua
return function(Options, esp_sec)
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    
    esp_sec:CreateToggle("Player ESP", Options.PlayerESP, function(v)
        Options.PlayerESP = v
    end)

    -- ESP Loop
    RunService.RenderStepped:Connect(function()
        if Options.PlayerESP then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= Players.LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    if not p.Character:FindFirstChild("ESP_Highlight") then
                        local h = Instance.new("Highlight", p.Character)
                        h.Name = "ESP_Highlight"
                        h.FillColor = Color3.fromRGB(0, 255, 0)
                        h.OutlineTransparency = 0
                    end
                end
            end
        else
            for _, p in pairs(Players:GetPlayers()) do
                if p.Character and p.Character:FindFirstChild("ESP_Highlight") then
                    p.Character.ESP_Highlight:Destroy()
                end
            end
        end
    end)
end
