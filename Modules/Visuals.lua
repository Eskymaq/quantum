-- Visuals.lua
return function(Options, esp_sec)
    esp_sec:CreateToggle("Monster ESP", Options.MonsterESP, function(v)
        Options.MonsterESP = v
    end)

    esp_sec:CreateToggle("Player ESP", Options.PlayerESP, function(v)
        Options.PlayerESP = v
    end)
    
    -- ESP Loop
    game:GetService("RunService").RenderStepped:Connect(function()
        -- Zde by byla logika pro vykreslování
    end)
end
