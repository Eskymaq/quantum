-- Main.lua
local REPO_URL = "https://raw.githubusercontent.com/Eskymaq/quantum/main/"

-- Definice Options
local Options = {
    MonsterESP = false, PlayerESP = false,
    Noclip = false,
    WalkSpeed = false, WalkSpeedValue = 16,
    InfiniteJump = false,
    JumpPowerEnabled = false, JumpPower = 50,
    Fly = false, FlySpeed = 60,
    ToggleKeyName = "Insert"
}

-- Inicializace UI
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/XXSCRIPT/refs/heads/main/Library/Module.lua"))()
local window = library:CreateWindow({WindowName="Peak Evolution | V3.3"}, gethui())

-- Vytvoření tabů a sekcí
local main_tab = window:CreateTab("Main")
local esp_tab = window:CreateTab("ESP")
local config_tab = window:CreateTab("Settings")

local main_sec = main_tab:CreateSection("Main")
local walk_sec = main_tab:CreateSection("Walk")
local jump_sec = main_tab:CreateSection("Jump")
local fly_sec = main_tab:CreateSection("Fly")
local esp_sec = esp_tab:CreateSection("Visual")
local config_sec = config_tab:CreateSection("Settings")

-- Načtení modulů
local movementFunc = loadstring(game:HttpGet(REPO_URL .. "Modules/Movement.lua"))()
local visualsFunc = loadstring(game:HttpGet(REPO_URL .. "Modules/Visuals.lua"))()

-- Propojení (posíláme Options a sekce do modulů)
movementFunc(Options, main_sec, walk_sec, jump_sec, fly_sec)
visualsFunc(Options, esp_sec)

-- Globální věci v Mainu (Config/Unload)
config_sec:CreateButton("Unload Script", function()
    library:Destroy()
end)

-- Keybind pro menu
game:GetService("UserInputService").InputBegan:Connect(function(input, gp)
    if not gp and input.KeyCode.Name == Options.ToggleKeyName then
        local my_gui = gethui():GetChildren()[#gethui():GetChildren()]
        if my_gui then my_gui.Enabled = not my_gui.Enabled end
    end
end)
