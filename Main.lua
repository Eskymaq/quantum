-- Main.lua
local REPO_URL = "https://raw.githubusercontent.com/Eskymaq/quantum/main/"

-- 1. Definice globálního nastavení (Options)
local Options = {
    MonsterESP = false, 
    PlayerESP = false, 
    Noclip = false, 
    WalkSpeed = false, 
    WalkSpeedValue = 16, 
    InfiniteJump = false,
    Fly = false,
    FlySpeed = 60
}

-- 2. Inicializace UI knihovny
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/XXSCRIPT/refs/heads/main/Library/Module.lua"))()
local window = library:CreateWindow({WindowName="Quantum Evolution | V3.3"}, game.CoreGui)

-- 3. Vytvoření tabů a sekcí
local main_tab = window:CreateTab("Main")
local esp_tab = window:CreateTab("ESP")

local main_sec = main_tab:CreateSection("Movement & Noclip")
local walk_sec = main_tab:CreateSection("Speed & Jump")
local esp_sec = esp_tab:CreateSection("ESP Visuals")

-- 4. Funkce pro bezpečné načtení modulů
local function loadModule(moduleName)
    local success, func = pcall(function()
        return loadstring(game:HttpGet(REPO_URL .. "Modules/" .. moduleName .. ".lua"))()
    end)
    
    if success and type(func) == "function" then
        return func
    else
        warn("Quantum Error: Modul " .. moduleName .. " se nepodařilo načíst: " .. tostring(func))
        return nil
    end
end

-- 5. Načtení a spuštění modulů
local movementFunc = loadModule("Movement")
local visualsFunc = loadModule("Visuals")

-- 6. Předání sekcí a options do modulů
if movementFunc then
    movementFunc(Options, main_sec, walk_sec)
end

if visualsFunc then
    visualsFunc(Options, esp_sec)
end

-- 7. Globální funkce v Mainu (Config/Unload)
local config_tab = window:CreateTab("Settings")
local config_sec = config_tab:CreateSection("General")

config_sec:CreateButton("Unload Script", function()
    library:Destroy()
end)

print("Quantum Evolution V3.3 Loaded!")
