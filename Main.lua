-- Main.lua
local REPO_URL = "https://raw.githubusercontent.com/Eskymaq/quantum/main/"
local Options = {MonsterESP = false, PlayerESP = false, Noclip = false, WalkSpeed = false, WalkSpeedValue = 16, Fly = false, FlySpeed = 60}

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/XXSCRIPT/refs/heads/main/Library/Module.lua"))()
local window = library:CreateWindow({WindowName="Quantum Evolution"}, game.CoreGui)

local main_tab = window:CreateTab("Main")
local esp_tab = window:CreateTab("ESP")

local main_sec = main_tab:CreateSection("Movement")
local walk_sec = main_tab:CreateSection("Speed/Fly")
local esp_sec = esp_tab:CreateSection("Visuals")

-- Načtení modulů
local movementMod = loadstring(game:HttpGet(REPO_URL .. "Modules/Movement.lua"))()
local visualsMod = loadstring(game:HttpGet(REPO_URL .. "Modules/Visuals.lua"))()

-- Propojení
if movementMod then movementMod(Options, main_sec, walk_sec) end
if visualsMod then visualsMod(Options, esp_sec) end
