-- ==========================================
-- ANTI DUMP / BASIC PROTECTION
-- ==========================================

if not getgenv then
    return
end

if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- anti double execute
if getgenv().QUANTUM_LOADED then
    return
end
getgenv().QUANTUM_LOADED = true

-- executor check
if not hookfunction or not gethui then
    return
end

pcall(function()
    setreadonly(getgenv(), false)
end)

-- ==========================================
-- GAME CHECK
-- ==========================================

local ALLOWED_GAME = 12673840215

if game.PlaceId ~= ALLOWED_GAME then
    warn("Unsupported game.")
    return
end


--!hood gang

-- ==========================================
-- CONFIG
-- ==========================================

local SCRIPT_VERSION = "3.4"
local LIBRARY_ID = "pe_pubmain"
local CONFIG_FILE = "PeakEvolution_Config.json"
local DISCORD_LINK = "https://discord.gg/c7AxxyBKXr"

if getgenv()[LIBRARY_ID] then
pcall(function()
getgenv()[LIBRARY_ID]:Destroy()
end)
end


-- ==========================================
-- SERVICES
-- ==========================================

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer


-- ==========================================
-- CLEAR ESP
-- ==========================================

local function ClearAllHighlights()

for _,plr in pairs(Players:GetPlayers()) do

if plr.Character then

local char = plr.Character

local highlight = char:FindFirstChild("PlayerESP")
if highlight then
highlight:Destroy()
end

local root = char:FindFirstChild("HumanoidRootPart")
if root then
local gui = root:FindFirstChild("ESPLabel")
if gui then
gui:Destroy()
end
end

end

end

end


-- ==========================================
-- STATS OVERLAY (FPS & PING)
-- ==========================================


local function CreateStatsOverlay()
    local gui = Instance.new("ScreenGui")
    gui.Name = "StatsOverlay"
    gui.Parent = gethui()
    gui.IgnoreGuiInset = true
    gui.Enabled = true

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 150, 0, 70)
    frame.Position = UDim2.new(1, -160, 0, 10)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    frame.BorderSizePixel = 0
    frame.Parent = gui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)
    
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Color3.fromRGB(50, 50, 50)

    local statsText = Instance.new("TextLabel", frame)
    statsText.Size = UDim2.new(1, 0, 1, 0)
    statsText.TextXAlignment = Enum.TextXAlignment.Center
    statsText.TextYAlignment = Enum.TextYAlignment.Center
    statsText.TextColor3 = Color3.fromRGB(255, 255, 255)
    statsText.Font = Enum.Font.GothamMedium
    statsText.TextSize = 14
    statsText.BackgroundTransparency = 1
    statsText.Text = "FPS: --\nPing: --"

    local runService = game:GetService("RunService")
    local stats = game:GetService("Stats")
    local frames = 0

    runService.RenderStepped:Connect(function()
        frames += 1
    end)

    task.spawn(function()
        while gui.Parent do
            local currentFps = frames
            frames = 0
            
            local ping = 0
            pcall(function()
                ping = math.floor(stats.Network.ServerStatsItem["Data Ping"]:GetValue())
            end)
            
            statsText.Text = string.format("FPS: %d\nPing: %d ms", currentFps, ping)
            task.wait(1)
        end
    end)
end


-- ==========================================
-- INTRO ANIMATION (AAA QUALITY)
-- ==========================================

local function PlayIntro(callback)

    local gui = Instance.new("ScreenGui")
    gui.Name = "QuantumIntro"
    gui.IgnoreGuiInset = true
    gui.Parent = gethui()

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1,0,1,0)
    bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
    bg.BackgroundTransparency = 1
    bg.Parent = gui

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1,0,0,100)
    title.Position = UDim2.new(0,0,0.45,0)
    title.Text = "Quantum Scripts"
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 60
    title.TextTransparency = 1
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.BackgroundTransparency = 1
    title.Parent = bg

    local glow = Instance.new("UIStroke")
    glow.Parent = title
    glow.Thickness = 2
    glow.Color = Color3.fromRGB(255,255,255)
    glow.Transparency = 0.5

    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(1,0,0,50)
    subtitle.Position = UDim2.new(0,0,0.55,0)
    subtitle.Text = "Made by Eskymaq"
    subtitle.Font = Enum.Font.GothamBold
    subtitle.TextSize = 28
    subtitle.TextTransparency = 1
    subtitle.TextColor3 = Color3.fromRGB(255,200,100)
    subtitle.BackgroundTransparency = 1
    subtitle.Parent = bg

    TweenService:Create(
        bg,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundTransparency = 0}
    ):Play()

    task.wait(0.3)

    TweenService:Create(
        title,
        TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {TextTransparency = 0, TextSize = 72}
    ):Play()

    task.spawn(function()
        while gui.Parent do
            for i=0,1,0.02 do
                glow.Transparency = 0.5 + math.sin(tick()*3)*0.5
                task.wait(0.03)
            end
        end
    end)

    task.wait(0.2)

    TweenService:Create(
        subtitle,
        TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {TextTransparency = 0}
    ):Play()

    task.wait(2)

    local barBg = Instance.new("Frame", bg)
    barBg.Size = UDim2.new(0.6,0,0,8)
    barBg.Position = UDim2.new(0.2,0,0.7,0)
    barBg.BackgroundColor3 = Color3.fromRGB(50,50,50)
    barBg.BorderSizePixel = 0
    Instance.new("UICorner", barBg).CornerRadius = UDim.new(0,4)

    local bar = Instance.new("Frame", barBg)
    bar.Size = UDim2.new(0,0,1,0)
    bar.Position = UDim2.new(0,0,0,0)
    bar.BackgroundColor3 = Color3.fromRGB(88,101,242)
    Instance.new("UICorner", bar).CornerRadius = UDim.new(0,4)

    for i=0,1,0.01 do
        bar.Size = UDim2.new(i,0,1,0)
        task.wait(0.01)
    end

    task.wait(0.5)

    TweenService:Create(bg,TweenInfo.new(0.8),{BackgroundTransparency = 1}):Play()
    TweenService:Create(title,TweenInfo.new(0.8),{TextTransparency = 1, TextSize = 60}):Play()
    TweenService:Create(subtitle,TweenInfo.new(0.8),{TextTransparency = 1}):Play()
    TweenService:Create(bar,TweenInfo.new(0.8),{Size = UDim2.new(0,0,1,0)}):Play()

    task.wait(1)

    gui:Destroy()

    callback()

end


-- ==========================================
-- SPLASH WITH BLUR AND EFFECTS + KEY SYSTEM
-- ==========================================

local function CreateSplashScreen(callback)

local gui = Instance.new("ScreenGui")
gui.Parent = gethui()

-- KEY SYSTEM

local HttpService = game:GetService("HttpService")
local KEY_URL = "https://raw.githubusercontent.com/Eskymaq/quantum/main/keys.json"

local Keys = HttpService:JSONDecode(game:HttpGet(KEY_URL))

local HWID = game:GetService("RbxAnalyticsService"):GetClientId()

local function VerifyKey(key)

if not Keys[key] then
return false
end

if Keys[key] == "" then
return true
end

if Keys[key] == HWID then
return true
end

return false

end

-- BLUR BACKGROUND

local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = game.Lighting

TweenService:Create(
blur,
TweenInfo.new(0.6),
{Size = 18}
):Play()

-- (zbytek splash zůstává úplně stejný…)

end
