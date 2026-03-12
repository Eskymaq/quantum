-- Main.lua
local REPO_URL = "https://raw.githubusercontent.com/Eskymaq/quantum/main/"

-- Načtení funkcí z modulů
local movementMod = loadstring(game:HttpGet(REPO_URL .. "Modules/Movement.lua"))()
local visualsMod = loadstring(game:HttpGet(REPO_URL .. "Modules/Visuals.lua"))()
