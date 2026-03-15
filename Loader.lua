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
-- INTRO ANIMATION (AAA QUALITY)
-- ==========================================

local function PlayIntro(callback)
    local gui = Instance.new("ScreenGui")
    gui.Name = "QuantumIntro"
    gui.IgnoreGuiInset = true
    gui.Parent = gethui()

    -- BACKGROUND
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1,0,1,0)
    bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
    bg.BackgroundTransparency = 1
    bg.Parent = gui

    -- TEXT TITLE
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

    -- GLOW EFFECT
    local glow = Instance.new("UIStroke")
    glow.Parent = title
    glow.Thickness = 2
    glow.Color = Color3.fromRGB(255,255,255)
    glow.Transparency = 0.5

    -- SUBTITLE
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

    -- ANIMACE FADE-IN BACKGROUND
    TweenService:Create(
        bg,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundTransparency = 0}
    ):Play()

    task.wait(0.3)

    -- TITLE FADE + ZOOM
    TweenService:Create(
        title,
        TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {TextTransparency = 0, TextSize = 72}
    ):Play()

    -- GLOW PULSE
    task.spawn(function()
        while gui.Parent do
            for i=0,1,0.02 do
                glow.Transparency = 0.5 + math.sin(tick()*3)*0.5
                task.wait(0.03)
            end
        end
    end)

    task.wait(0.2)

    -- SUBTITLE FADE-IN
    TweenService:Create(
        subtitle,
        TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {TextTransparency = 0}
    ):Play()

    task.wait(2) -- držíme text na obrazovce

    -- CINEMATIC LOADING BAR
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

    -- Animate loading bar
    for i=0,1,0.01 do
        bar.Size = UDim2.new(i,0,1,0)
        task.wait(0.01)
    end

    task.wait(0.5)

    -- FADE OUT EVERYTHING
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

    -- BLUR BACKGROUND
    local blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = game.Lighting
    TweenService:Create(
        blur,
        TweenInfo.new(0.6),
        {Size = 18}
    ):Play()

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 0, 0, 0)
    frame.Position = UDim2.new(.5, 0, .5, 0)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    frame.BorderSizePixel = 0
    frame.Parent = gui
    frame.BackgroundTransparency = 1
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

    -- ANIMACE SPLASH
    task.spawn(function()
        TweenService:Create(
            frame,
            TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {
                Size = UDim2.new(0,600,0,400),
                Position = UDim2.new(.5,-300,.5,-200),
                BackgroundTransparency = 0
            }
        ):Play()
    end)

    -- LEFT SIDE (CHANGELOG)
    local logFrame = Instance.new("Frame", frame)
    logFrame.Size = UDim2.new(0.4, 0, 1, 0)
    logFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Instance.new("UICorner", logFrame).CornerRadius = UDim.new(0, 8)

    local logTitle = Instance.new("TextLabel", logFrame)
    logTitle.Size = UDim2.new(1, 0, 0, 40)
    logTitle.Text = "Update Log"
    logTitle.TextColor3 = Color3.fromRGB(255,255,255)
    logTitle.Font = Enum.Font.GothamBold
    logTitle.TextSize = 20
    logTitle.BackgroundTransparency = 1

    local logText = Instance.new("TextLabel", logFrame)
    logText.Size = UDim2.new(0.9,0,0.8,0)
    logText.Position = UDim2.new(0.05,0,0.15,0)
    logText.TextXAlignment = Enum.TextXAlignment.Left
    logText.TextYAlignment = Enum.TextYAlignment.Top
    logText.TextColor3 = Color3.fromRGB(200,200,200)
    logText.Font = Enum.Font.Gotham
    logText.TextSize = 14
    logText.BackgroundTransparency = 1

    logText.Text = 
        "• v3.4:\n".. 
        "• Intro animation added\n".. 
        "• Improved splash screen\n".. 
        "• Player utilities system\n".. 
        "• Teleport to player\n".. 
        "• Follow / Spectate player\n".. 
        "• Freeze / Unfreeze player\n".. 
        "• Friend system for ESP\n\n".. 
        "Upcoming:\n".. 
        "• Aim assist improvements\n".. 
        "• ESP upgrades\n".. 
        "• More player tools"

    -- DIVIDER
    local line = Instance.new("Frame", frame)
    line.Size = UDim2.new(0,1,0.9,0)
    line.Position = UDim2.new(0.4,0,0.05,0)
    line.BackgroundColor3 = Color3.fromRGB(50,50,50)
    line.BorderSizePixel = 0

    -- RIGHT SIDE (INFO)
    local rightFrame = Instance.new("Frame", frame)
    rightFrame.Size = UDim2.new(0.6,0,1,0)
    rightFrame.Position = UDim2.new(0.4,0,0,0)
    rightFrame.BackgroundTransparency = 1

    local title = Instance.new("TextLabel", rightFrame)
    title.Size = UDim2.new(1,0,0,60)
    title.Text = "Quantum scripts"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 32
    title.TextColor3 = Color3.new(1,1,1)
    title.BackgroundTransparency = 1

    local welcome = Instance.new("TextLabel", rightFrame)
    welcome.Size = UDim2.new(1,0,0,35)
    welcome.Position = UDim2.new(0,0,0,60)
    welcome.Text = "Welcome, "..LocalPlayer.Name
    welcome.TextColor3 = Color3.fromRGB(255,120,120)
    welcome.Font = Enum.Font.GothamBold
    welcome.TextSize = 20
    welcome.BackgroundTransparency = 1

    local function createInfo(y,text)
        local lbl = Instance.new("TextLabel", rightFrame)
        lbl.Size = UDim2.new(1,-20,0,20)
        lbl.Position = UDim2.new(0,20,0,y)
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.Text = text
        lbl.TextColor3 = Color3.fromRGB(200,200,200)
        lbl.Font = Enum.Font.Gotham
        lbl.TextSize = 16
        lbl.BackgroundTransparency = 1
        return lbl
    end

    createInfo(105,"Status:")
    createInfo(130,"Version: 3.4")
    createInfo(155,"Created by")
    createInfo(180,"Release: March 2026")

    local author = Instance.new("TextLabel", rightFrame)
    author.Size = UDim2.new(1,-20,0,20)
    author.Position = UDim2.new(0,105,0,155)
    author.Text = "Eskymaq"
    author.TextColor3 = Color3.fromRGB(255,215,0)
    author.Font = Enum.Font.GothamBold
    author.TextSize = 16
    author.TextXAlignment = Enum.TextXAlignment.Left
    author.BackgroundTransparency = 1

    local status = Instance.new("Frame", rightFrame)
    status.Size = UDim2.new(0,10,0,10)
    status.Position = UDim2.new(0,75,0,110)
    status.BackgroundColor3 = Color3.fromRGB(46,204,113)
    Instance.new("UICorner", status).CornerRadius = UDim.new(1,0)

    -- KEY INPUT
    local keyBox = Instance.new("TextBox", rightFrame)
    keyBox.Size = UDim2.new(0.8,0,0,40)
    keyBox.Position = UDim2.new(0.1,0,0.67,0)
    keyBox.PlaceholderText = "Enter your key..."
    keyBox.Text = ""
    keyBox.TextColor3 = Color3.fromRGB(255,255,255)
    keyBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
    Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0,6)
    keyBox.ClearTextOnFocus = false

    -- BUTTONS
    local discord = Instance.new("TextButton", rightFrame)
    discord.Size = UDim2.new(0.8,0,0,55)
    discord.Position = UDim2.new(0.1,0,0.55,0)
    discord.Text = "Discord"
    discord.Font = Enum.Font.GothamBold
    discord.TextSize = 18
    discord.TextColor3 = Color3.new(1,1,1)
    discord.BackgroundColor3 = Color3.fromRGB(88,101,242)
    Instance.new("UICorner", discord).CornerRadius = UDim.new(0,8)

    local exec = Instance.new("TextButton", rightFrame)
    exec.Size = UDim2.new(0.8,0,0,55)
    exec.Position = UDim2.new(0.1,0,0.75,0)
    exec.Text = "Execute Script"
    exec.Font = Enum.Font.GothamBold
    exec.TextSize = 18
    exec.TextColor3 = Color3.new(1,1,1)
    exec.BackgroundColor3 = Color3.fromRGB(46,204,113)
    Instance.new("UICorner", exec).CornerRadius = UDim.new(0,8)

    local footer = Instance.new("TextLabel", frame)
    footer.Size = UDim2.new(0.95,0,0,20)
    footer.Position = UDim2.new(0,0,1,-25)
    footer.Text = "© 2026 Quantum Scripts"
    footer.TextColor3 = Color3.fromRGB(120,120,120)
    footer.TextSize = 12
    footer.Font = Enum.Font.Gotham
    footer.TextXAlignment = Enum.TextXAlignment.Right
    footer.BackgroundTransparency = 1

    -- ADD EFFECTS
    -- 1. PARALLAX / mouse movement effect
    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            local viewport = workspace.CurrentCamera.ViewportSize
            local x = (input.Position.X/viewport.X - 0.5) * 15
            local y = (input.Position.Y/viewport.Y - 0.5) * 15
            TweenService:Create(frame, TweenInfo.new(0.2,Enum.EasingStyle.Quad), {Position = UDim2.new(.5,-300+x,.5,-200+y)}):Play()
        end
    end)

    -- 2. BUTTON HOVER AND CLICK RIPPLE
    local function addButtonEffects(button)
        button.MouseEnter:Connect(function()
            TweenService:Create(button,TweenInfo.new(0.2),{Size=UDim2.new(0.82*0.8,0,0,60)}):Play()
        end)
        button.MouseLeave:Connect(function()
            TweenService:Create(button,TweenInfo.new(0.2),{Size=UDim2.new(0.8,0,0,55)}):Play()
        end)
        button.MouseButton1Down:Connect(function()
            local ripple = Instance.new("Frame")
            ripple.Size = UDim2.new(0,0,0,0)
            ripple.Position = UDim2.new(.5,0,.5,0)
            ripple.BackgroundColor3 = Color3.new(1,1,1)
            ripple.BackgroundTransparency = 0.6
            ripple.Parent = button
            Instance.new("UICorner",ripple).CornerRadius = UDim.new(1,0)
            TweenService:Create(ripple,TweenInfo.new(0.5),{Size=UDim2.new(3,0,3,0),BackgroundTransparency=1,Position=UDim2.new(-1,0,-1,0)}):Play()
            game.Debris:AddItem(ripple,0.6)
        end)
    end

    addButtonEffects(discord)
    addButtonEffects(exec)

    discord.MouseButton1Click:Connect(function()
        setclipboard(DISCORD_LINK)
    end)

    exec.MouseButton1Click:Connect(function()
        local key = keyBox.Text
        if not VerifyKey(key) then
            warn("Invalid or HWID mismatch key!")
            keyBox.TextColor3 = Color3.fromRGB(255,0,0)
            return
        end
        -- fade out frame + blur
        TweenService:Create(frame,TweenInfo.new(0.4),{Size=UDim2.new(0,0,0,0),Position=UDim2.new(.5,0,.5,0)}):Play()
        TweenService:Create(blur,TweenInfo.new(0.4),{Size=0}):Play()
        task.wait(0.4)
        gui:Destroy()
        blur:Destroy()
        callback()
    end)
end

-- ==========================================
-- START
-- ==========================================

PlayIntro(function()

CreateSplash()

end)
