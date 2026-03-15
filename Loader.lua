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
-- GAME CHECK
-- ==========================================

local ALLOWED_GAME = 12673840215

if game.PlaceId ~= ALLOWED_GAME then
    warn("Quantum: Unsupported game.")
    return
end

-- ==========================================
-- SERVICES
-- ==========================================

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer

-- ==========================================
-- LOAD MAIN SCRIPT
-- ==========================================

local function LoadMain()

loadstring(game:HttpGet(
"https://raw.githubusercontent.com/Eskymaq/quantum/main/main.lua"
))()

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
bg.BackgroundColor3 = Color3.new(0,0,0)
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

local function CreateSplashScreen()

local gui = Instance.new("ScreenGui")
gui.Parent = gethui()

-- KEY SYSTEM

local KEY_URL =
"https://raw.githubusercontent.com/Eskymaq/quantum/main/keys.json"

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

-- BLUR

local blur = Instance.new("BlurEffect")
blur.Size = 18
blur.Parent = game.Lighting

-- FRAME

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,600,0,400)
frame.Position = UDim2.new(.5,-300,.5,-200)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.Parent = gui

Instance.new("UICorner",frame)

-- TITLE

local title = Instance.new("TextLabel",frame)
title.Size = UDim2.new(1,0,0,60)
title.Text = "Quantum Scripts"
title.Font = Enum.Font.GothamBold
title.TextSize = 32
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

-- WELCOME

local welcome = Instance.new("TextLabel",frame)
welcome.Size = UDim2.new(1,0,0,30)
welcome.Position = UDim2.new(0,0,0,60)
welcome.Text = "Welcome "..LocalPlayer.Name
welcome.Font = Enum.Font.Gotham
welcome.TextSize = 18
welcome.TextColor3 = Color3.fromRGB(255,120,120)
welcome.BackgroundTransparency = 1

-- KEY BOX

local keyBox = Instance.new("TextBox",frame)
keyBox.Size = UDim2.new(0.8,0,0,40)
keyBox.Position = UDim2.new(0.1,0,0.6,0)
keyBox.PlaceholderText = "Enter your key..."
keyBox.Text = ""
keyBox.TextColor3 = Color3.new(1,1,1)
keyBox.BackgroundColor3 = Color3.fromRGB(40,40,40)

Instance.new("UICorner",keyBox)

-- EXECUTE BUTTON

local exec = Instance.new("TextButton",frame)
exec.Size = UDim2.new(0.8,0,0,50)
exec.Position = UDim2.new(0.1,0,0.75,0)
exec.Text = "Execute Script"
exec.Font = Enum.Font.GothamBold
exec.TextSize = 18
exec.TextColor3 = Color3.new(1,1,1)
exec.BackgroundColor3 = Color3.fromRGB(46,204,113)

Instance.new("UICorner",exec)

-- BUTTON ACTION

exec.MouseButton1Click:Connect(function()

local key = keyBox.Text

if not VerifyKey(key) then

keyBox.TextColor3 = Color3.fromRGB(255,0,0)
warn("Invalid key")

return

end

TweenService:Create(
frame,
TweenInfo.new(0.4),
{Size = UDim2.new(0,0,0,0)}
):Play()

TweenService:Create(
blur,
TweenInfo.new(0.4),
{Size = 0}
):Play()

task.wait(0.4)

gui:Destroy()
blur:Destroy()

LoadMain()

end)

end

-- ==========================================
-- START
-- ==========================================

PlayIntro(function()

CreateSplashScreen()

end)
