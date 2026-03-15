local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer

local KEY_URL = "https://raw.githubusercontent.com/Eskymaq/quantum/main/keys.json"
local MAIN_URL = "https://raw.githubusercontent.com/Eskymaq/quantum/main/main.lua"

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

local ScreenGui = Instance.new("ScreenGui", gethui())

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 460, 0, 340)
Frame.Position = UDim2.new(0.5,-230,0.5,-170)
Frame.BackgroundColor3 = Color3.fromRGB(24,24,24)
Frame.BorderSizePixel = 0
Instance.new("UICorner", Frame)

local Stroke = Instance.new("UIStroke", Frame)
Stroke.Color = Color3.fromRGB(70,70,70)
Stroke.Thickness = 2

local TopBar = Instance.new("Frame", Frame)
TopBar.Size = UDim2.new(1,0,0,40)
TopBar.BackgroundColor3 = Color3.fromRGB(30,30,30)
TopBar.BorderSizePixel = 0
Instance.new("UICorner", TopBar)

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1,0,1,0)
Title.Text = "QUANTUM LOADER"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.new(1,1,1)
Title.BackgroundTransparency = 1

local InfoPanel = Instance.new("TextLabel", Frame)
InfoPanel.Size = UDim2.new(0.9,0,0,60)
InfoPanel.Position = UDim2.new(0.05,0,0.16,0)
InfoPanel.BackgroundTransparency = 1
InfoPanel.TextWrapped = true
InfoPanel.Font = Enum.Font.Gotham
InfoPanel.TextSize = 13
InfoPanel.TextColor3 = Color3.fromRGB(210,210,210)
InfoPanel.Text = "Quantum Loader allows you to run the Quantum script safely.\nEnter your key below and press Execute."

local Rules = Instance.new("TextLabel", Frame)
Rules.Size = UDim2.new(0.9,0,0,50)
Rules.Position = UDim2.new(0.05,0,0.33,0)
Rules.BackgroundTransparency = 1
Rules.TextWrapped = true
Rules.Font = Enum.Font.Gotham
Rules.TextSize = 12
Rules.TextColor3 = Color3.fromRGB(255,170,0)
Rules.Text = "Security Notice:\n• Keys are HWID locked\n• Do NOT share your key\n• Key sharing may lead to blacklist"

local LoaderInfo = Instance.new("TextLabel", Frame)
LoaderInfo.Size = UDim2.new(0.9,0,0,35)
LoaderInfo.Position = UDim2.new(0.05,0,0.46,0)
LoaderInfo.BackgroundTransparency = 1
LoaderInfo.TextWrapped = true
LoaderInfo.Font = Enum.Font.Gotham
LoaderInfo.TextSize = 12
LoaderInfo.TextColor3 = Color3.fromRGB(180,180,180)
LoaderInfo.Text = "Loader Info:\n• Script loads remotely from GitHub\n• Updates are automatic"

local KeyBox = Instance.new("TextBox", Frame)
KeyBox.Size = UDim2.new(0.85,0,0,45)
KeyBox.Position = UDim2.new(0.075,0,0.60,0)
KeyBox.PlaceholderText = "Enter your key..."
KeyBox.Text = ""
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 16
KeyBox.TextColor3 = Color3.fromRGB(255,255,255)
KeyBox.BackgroundColor3 = Color3.fromRGB(35,35,35)
KeyBox.BorderSizePixel = 0
Instance.new("UICorner", KeyBox)

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

local Status = Instance.new("TextLabel", Frame)
Status.Size = UDim2.new(1,0,0,20)
Status.Position = UDim2.new(0,0,0.90,0)
Status.Text = "Status: Waiting for key"
Status.TextColor3 = Color3.fromRGB(170,170,170)
Status.Font = Enum.Font.Gotham
Status.TextSize = 12
Status.BackgroundTransparency = 1

local Support = Instance.new("TextLabel", Frame)
Support.Size = UDim2.new(1,0,0,15)
Support.Position = UDim2.new(0,0,0.95,0)
Support.Text = "Quantum Loader v1.0 | Keys are HWID locked"
Support.TextColor3 = Color3.fromRGB(120,120,120)
Support.Font = Enum.Font.Gotham
Support.TextSize = 11
Support.BackgroundTransparency = 1

Button.MouseEnter:Connect(function()
    TweenService:Create(Button,TweenInfo.new(0.15),{
        BackgroundColor3 = Color3.fromRGB(60,220,130)
    }):Play()
end)

Button.MouseLeave:Connect(function()
    TweenService:Create(Button,TweenInfo.new(0.15),{
        BackgroundColor3 = Color3.fromRGB(46,204,113)
    }):Play()
end)

Button.MouseButton1Click:Connect(function()

    Status.Text = "Status: Checking key..."

    local key = KeyBox.Text

    if VerifyKey(key) then

        Status.Text = "Status: Key accepted. Loading..."

        task.wait(0.5)

        ScreenGui:Destroy()

        local ok, err = pcall(function()
            loadstring(game:HttpGet(MAIN_URL))()
        end)

        if not ok then
            warn("Failed to load main.lua", err)
        end

    else

        Status.Text = "Status: Invalid key"
        KeyBox.Text = ""
        KeyBox.PlaceholderText = "Invalid key!"
        KeyBox.TextColor3 = Color3.fromRGB(255,80,80)

    end

end)

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    Frame.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
end

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
