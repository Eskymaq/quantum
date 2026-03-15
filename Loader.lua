local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = game:GetService("Players").LocalPlayer

-- =========================
-- CONFIG
-- =========================

local KEYS_URL = "https://raw.githubusercontent.com/Eskymaq/quantum/main/keys.json"
local MAIN_SCRIPT = "https://raw.githubusercontent.com/Eskymaq/quantum/main/main.lua"
local DISCORD_LINK = "https://discord.gg/9QA9JWasBs"

local HWID = game:GetService("RbxAnalyticsService"):GetClientId()

-- =========================
-- LOAD KEYS FROM GITHUB
-- =========================

local Keys = {}

local success, response = pcall(function()
    return game:HttpGet(KEYS_URL)
end)

if success then
    Keys = HttpService:JSONDecode(response)
else
    warn("Failed to download keys.json")
end

-- =========================
-- VERIFY KEY
-- =========================

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

-- ==========================================
-- INTRO ANIMATION
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

    TweenService:Create(bg,TweenInfo.new(0.5),{BackgroundTransparency=0}):Play()

    task.wait(0.3)

    TweenService:Create(title,TweenInfo.new(0.8),{
        TextTransparency = 0,
        TextSize = 72
    }):Play()

    task.wait(0.2)

    TweenService:Create(subtitle,TweenInfo.new(0.8),{
        TextTransparency = 0
    }):Play()

    task.wait(2)

    local barBg = Instance.new("Frame", bg)
    barBg.Size = UDim2.new(0.6,0,0,8)
    barBg.Position = UDim2.new(0.2,0,0.7,0)
    barBg.BackgroundColor3 = Color3.fromRGB(50,50,50)

    local bar = Instance.new("Frame", barBg)
    bar.Size = UDim2.new(0,0,1,0)
    bar.BackgroundColor3 = Color3.fromRGB(88,101,242)

    for i=0,1,0.01 do
        bar.Size = UDim2.new(i,0,1,0)
        task.wait(0.01)
    end

    task.wait(0.5)

    TweenService:Create(bg,TweenInfo.new(0.8),{BackgroundTransparency=1}):Play()
    TweenService:Create(title,TweenInfo.new(0.8),{TextTransparency=1}):Play()
    TweenService:Create(subtitle,TweenInfo.new(0.8),{TextTransparency=1}):Play()

    task.wait(1)

    gui:Destroy()

    callback()
end

-- ==========================================
-- SPLASH + KEY SYSTEM
-- ==========================================

local function CreateSplashScreen(callback)

    local gui = Instance.new("ScreenGui")
    gui.Parent = gethui()

    local blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = game.Lighting

    TweenService:Create(blur,TweenInfo.new(0.6),{Size=18}):Play()

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0,600,0,400)
    frame.Position = UDim2.new(.5,-300,.5,-200)
    frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
    frame.Parent = gui

    local keyBox = Instance.new("TextBox", frame)
    keyBox.Size = UDim2.new(0.8,0,0,40)
    keyBox.Position = UDim2.new(0.1,0,0.6,0)
    keyBox.PlaceholderText = "Enter your key..."
    keyBox.Text = ""

    local exec = Instance.new("TextButton", frame)
    exec.Size = UDim2.new(0.8,0,0,55)
    exec.Position = UDim2.new(0.1,0,0.75,0)
    exec.Text = "Execute Script"

    exec.MouseButton1Click:Connect(function()

        local key = keyBox.Text

        if not VerifyKey(key) then
            keyBox.TextColor3 = Color3.fromRGB(255,0,0)
            warn("Invalid key or HWID mismatch")
            return
        end

        gui:Destroy()
        blur:Destroy()

        callback()

    end)

end

-- ==========================================
-- START
-- ==========================================

PlayIntro(function()

    CreateSplashScreen(function()

        loadstring(game:HttpGet(MAIN_SCRIPT))()

    end)

end)
