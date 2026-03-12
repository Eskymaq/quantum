-- Hlavní loader
local REPO_URL = "https://raw.githubusercontent.com/Eskymaq/Quantum/main/"

local function loadMod(path)
    return loadstring(game:HttpGet(REPO_URL .. path))()
end

-- Načtení hlavního skriptu
loadMod("Main.lua")
