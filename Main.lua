-- Základní nastavení
local Options = {
    MonsterESP = false,
    PlayerESP = false,
    -- ... další nastavení
}

local script_running = {value = true} -- Tabulka, aby se dala měnit z jiných souborů

-- Vytvoření UI (zkráceno pro ukázku)
local library = loadstring(game:HttpGet("..."))()
local window = library:CreateWindow(...)
local esp_tab = window:CreateTab("ESP")
local esp_sec = esp_tab:CreateSection("Visual")

-- ==========================================
-- NAČÍTÁNÍ MODULŮ Z GITHUB
-- ==========================================
-- Tady si definuješ cestu ke svému GitHub repozitáři (musí to být raw link na složku, kde máš soubory)
local REPO_URL = "https://raw.githubusercontent.com/TVUJ_NICK/TVUJ_REPO/main/Modules/"

-- Stáhneme ESP.lua, spustíme ho jako funkci a předáme mu Options a UI sekci
local loadESP = loadstring(game:HttpGet(REPO_URL .. "ESP.lua"))()
loadESP(Options, esp_sec, script_running)

-- Takhle bys pak načítal další...
-- local loadMovement = loadstring(game:HttpGet(REPO_URL .. "Movement.lua"))()
-- loadMovement(Options, walk_sec, jump_sec, fly_sec, script_running)
