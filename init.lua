-- init.lua
-- Tento soubor slouží jako hlavní spouštěč celého projektu Quantum.

local REPO_URL = "https://raw.githubusercontent.com/Eskymaq/quantum/main/"

-- Funkce pro bezpečné načtení hlavního modulu
local function LoadQuantum()
    local success, result = pcall(function()
        return loadstring(game:HttpGet(REPO_URL .. "Main.lua"))()
    end)
    
    if not success then
        warn("Quantum Error: Nepodařilo se načíst Main.lua. Chyba: " .. tostring(result))
    end
end

-- Spuštění
LoadQuantum()
