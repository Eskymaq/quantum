-- ==========================================
-- QUANTUM LOADER
-- ==========================================

if not game:IsLoaded() then
game.Loaded:Wait()
end

if getgenv().QUANTUM_LOADER then
return
end
getgenv().QUANTUM_LOADER = true

-- ==========================================
-- SERVICES
-- ==========================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer

-- ==========================================
-- CONFIG
-- ==========================================

local MAIN_SCRIPT =
"https://raw.githubusercontent.com/Eskymaq/quantum/main/main.lua"

local DISCORD_LINK =
"https://discord.gg/c7AxxyBKXr"

-- KEY SYSTEM

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

-- ==========================================
-- LOAD MAIN
-- ==========================================

local function LoadMainScript()

loadstring(game:HttpGet(MAIN_SCRIPT))()

end

-- ==========================================
-- INTRO
-- ==========================================

local function PlayIntro(callback)

local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.Parent = gethui()

local bg = Instance.new("Frame")
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
bg.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,100)
title.Position = UDim2.new(0,0,0.45,0)
title.Text = "Quantum Scripts"
title.Font = Enum.Font.GothamBlack
title.TextSize = 60
title.TextTransparency = 1
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Parent = bg

TweenService:Create(
title,
TweenInfo.new(1),
{TextTransparency = 0}
):Play()

task.wait(2)

TweenService:Create(
bg,
TweenInfo.new(1),
{BackgroundTransparency = 1}
):Play()

task.wait(1)

gui:Destroy()

callback()

end

-- ==========================================
-- SPLASH
-- ==========================================

local function CreateSplash()

local gui = Instance.new("ScreenGui")
gui.Parent = gethui()

local blur = Instance.new("BlurEffect")
blur.Size = 18
blur.Parent = game.Lighting

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,600,0,400)
frame.Position = UDim2.new(.5,-300,.5,-200)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.Parent = gui

Instance.new("UICorner",frame)

local title = Instance.new("TextLabel",frame)
title.Size = UDim2.new(1,0,0,60)
title.Text = "Quantum Scripts"
title.Font = Enum.Font.GothamBold
title.TextSize = 32
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

local welcome = Instance.new("TextLabel",frame)
welcome.Size = UDim2.new(1,0,0,35)
welcome.Position = UDim2.new(0,0,0,60)
welcome.Text = "Welcome, "..LocalPlayer.Name
welcome.Font = Enum.Font.GothamBold
welcome.TextSize = 20
welcome.TextColor3 = Color3.fromRGB(255,120,120)
welcome.BackgroundTransparency = 1

local keyBox = Instance.new("TextBox",frame)
keyBox.Size = UDim2.new(0.8,0,0,40)
keyBox.Position = UDim2.new(0.1,0,0.65,0)
keyBox.PlaceholderText = "Enter your key..."
keyBox.Text = ""
keyBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
keyBox.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner",keyBox)

local exec = Instance.new("TextButton",frame)
exec.Size = UDim2.new(0.8,0,0,55)
exec.Position = UDim2.new(0.1,0,0.78,0)
exec.Text = "Execute Script"
exec.Font = Enum.Font.GothamBold
exec.TextSize = 18
exec.TextColor3 = Color3.new(1,1,1)
exec.BackgroundColor3 = Color3.fromRGB(46,204,113)

Instance.new("UICorner",exec)

exec.MouseButton1Click:Connect(function()

local key = keyBox.Text

if not VerifyKey(key) then
keyBox.TextColor3 = Color3.fromRGB(255,0,0)
warn("Invalid key")
return
end

TweenService:Create(frame,TweenInfo.new(0.4),{
Size = UDim2.new(0,0,0,0)
}):Play()

TweenService:Create(blur,TweenInfo.new(0.4),{
Size = 0
}):Play()

task.wait(0.4)

gui:Destroy()
blur:Destroy()

LoadMainScript()

end)

end

-- ==========================================
-- START
-- ==========================================

PlayIntro(function()

CreateSplash()

end)
