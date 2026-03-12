-- Modules/Visuals.lua
return function(Options, esp_sec)
    esp_sec:CreateToggle("Monster ESP", Options.MonsterESP, function(v)
        Options.MonsterESP = v
        print("Monster ESP změněno na:", v)
    end)
end
