-- Main.lua
local REPO_URL = "https://raw.githubusercontent.com/Eskymaq/quantum/main/"

local Options = {
    MonsterESP = false, PlayerESP = false, Noclip = false,
    WalkSpeed = false, WalkSpeedValue = 16, InfiniteJump = false
}

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/XXSCRIPT/refs/heads/main/Library/Module.lua"))()
local window = library:CreateWindow({WindowName="Quantum | V3.3"}, gethui())

-- Tady vytvoříme sekce
local main_tab = window:CreateTab("Main")
local esp_tab = window:CreateTab("ESP")

local main_sec = main_tab:CreateSection("Main")
local walk_sec = main_tab:CreateSection("Walk")
local jump_sec = main_tab:CreateSection("Jump")
local esp_sec = esp_tab:CreateSection("Visuals")

-- Načtení a okamžité spuštění modulů
local movementMod = loadstring(game:HttpGet(REPO_URL .. "Modules/Movement.lua"))()
local visualsMod = loadstring(game:HttpGet(REPO_URL .. "Modules/Visuals.lua"))()

-- Propojení sekcí s moduly
movementMod(Options, main_sec, walk_sec, jump_sec)
visualsMod(Options, esp_sec)
