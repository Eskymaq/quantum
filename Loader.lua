local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

local KEY_URL = "https://raw.githubusercontent.com/TVUJUSERNAME/quantum/main/keys.json"
local MAIN_URL = "https://raw.githubusercontent.com/TVUJUSERNAME/quantum/main/main.lua"

local function VerifyKey(key)
    local ok, data = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(KEY_URL))
    end)
    if not ok then return false end

    local HWID = game:GetService("RbxAnalyticsService"):GetClientId()

    if not data[key] then
        return false
    end

    if data[key] == "" or data[key] == HWID then
        return true
    end

    return false
end

-- GUI
local ScreenGui = Instance.new("ScreenGui", gethui())

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 420, 0, 260)
Frame.Position = UDim2.new(0.5,-210,0.5,-130)
Frame.BackgroundColor3 = Color3.fromRGB(22,22,22)
Frame.BorderSizePixel = 0

Instance.new("UICorner", Frame)

local Stroke = Instance.new("UIStroke", Frame)
Stroke.Color = Color3.fromRGB(70,70,70)
Stroke.Thickness = 1.5

-- TITLE
local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1,0,0,40)
Title.Position = UDim2.new(0,0,0,5)
Title.Text = "QUANTUM LOADER"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.BackgroundTransparency = 1

-- INFO
local Info = Instance.new("TextLabel", Frame)
Info.Size = UDim2.new(0.9,0,0,30)
Info.Position = UDim2.new(0.05,0,0.18,0)
Info.Text = "Enter your key to execute the script"
Info.TextColor3 = Color3.fromRGB(200,200,200)
Info.Font = Enum.Font.Gotham
Info.TextSize = 14
Info.BackgroundTransparency = 1

-- WARNING
local Warning = Instance.new("TextLabel", Frame)
Warning.Size = UDim2.new(0.9,0,0,40)
Warning.Position = UDim2.new(0.05,0,0.32,0)
Warning.Text = "⚠ Keys are HWID locked. Sharing your key may result in it being disabled or banned."
Warning.TextWrapped = true
Warning.TextColor3 = Color3.fromRGB(255,170,0)
Warning.Font = Enum.Font.Gotham
Warning.TextSize = 13
Warning.BackgroundTransparency = 1

-- KEY BOX
local KeyBox = Instance.new("TextBox", Frame)
KeyBox.Size = UDim2.new(0.85,0,0,45)
KeyBox.Position = UDim2.new(0.075,0,0.52,0)
KeyBox.PlaceholderText = "Enter your key..."
KeyBox.Text = ""
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 16
KeyBox.TextColor3 = Color3.fromRGB(255,255,255)
KeyBox.BackgroundColor3 = Color3.fromRGB(35,35,35)
KeyBox.BorderSizePixel = 0

Instance.new("UICorner", KeyBox)

-- BUTTON
local Button = Instance.new("TextButton", Frame)
Button.Size = UDim2.new(0.85,0,0,45)
Button.Position = UDim2.new(0.075,0,0.75,0)
Button.Text = "EXECUTE"
Button.Font = Enum.Font.GothamBold
Button.TextSize = 16
Button.TextColor3 = Color3.new(1,1,1)
Button.BackgroundColor3 = Color3.fromRGB(46,204,113)
Button.BorderSizePixel = 0

Instance.new("UICorner", Button)

-- STATUS
local Status = Instance.new("TextLabel", Frame)
Status.Size = UDim2.new(1,0,0,20)
Status.Position = UDim2.new(0,0,0.93,0)
Status.Text = ""
Status.TextColor3 = Color3.fromRGB(180,180,180)
Status.Font = Enum.Font.Gotham
Status.TextSize = 12
Status.BackgroundTransparency = 1

-- HOVER EFFECT
Button.MouseEnter:Connect(function()
    TweenService:Create(Button, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(60,220,130)
    }):Play()
end)

Button.MouseLeave:Connect(function()
    TweenService:Create(Button, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(46,204,113)
    }):Play()
end)

-- CLICK
Button.MouseButton1Click:Connect(function()

    Status.Text = "Checking key..."

    local key = KeyBox.Text

    if VerifyKey(key) then

        Status.Text = "Key accepted. Loading..."

        wait(0.5)

        ScreenGui:Destroy()

        local ok, err = pcall(function()
            loadstring(game:HttpGet(MAIN_URL))()
        end)

        if not ok then
            warn("Failed to load main.lua", err)
        end

    else

        Status.Text = "Invalid key."
        KeyBox.Text = ""
        KeyBox.PlaceholderText = "Invalid key!"
        KeyBox.TextColor3 = Color3.fromRGB(255,80,80)

    end

end)
