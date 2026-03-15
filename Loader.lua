local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

local KEY_URL = "https://raw.githubusercontent.com/Eskymaq/quantum/main/keys.json"
local MAIN_URL = "https://raw.githubusercontent.com/Eskymaq/quantum/main/main.lua"
local WEBHOOK = "https://discord.com/api/webhooks/1482711975590105220/IgbNNg5zcf-ecZo70yXTk04Ohed9JO7EF4YmnwPzhdS8UOAzKda7A_bkZ34C-GSHdKMf"

--------------------------------------------------
-- LOG SYSTEM
--------------------------------------------------
local function SendLog(key)
    local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
    local player = Players.LocalPlayer

    local data = {
        ["content"] = "",
        ["embeds"] = {{
            ["title"] = "Quantum Loader Log",
            ["color"] = 65280,
            ["fields"] = {
                {["name"] = "Player", ["value"] = player.Name, ["inline"] = true},
                {["name"] = "UserId", ["value"] = tostring(player.UserId), ["inline"] = true},
                {["name"] = "Key Used", ["value"] = key, ["inline"] = false},
                {["name"] = "HWID", ["value"] = hwid, ["inline"] = false},
                {["name"] = "Executor", ["value"] = identifyexecutor and identifyexecutor() or "Unknown", ["inline"] = true}
            }
        }}
    }

    pcall(function()
        request({
            Url = WEBHOOK,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(data)
        })
    end)
end

--------------------------------------------------
-- KEY CHECK
--------------------------------------------------
local function VerifyKey(key)
    local ok,data = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(KEY_URL))
    end)
    if not ok then return false end

    local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
    if not data[key] then return false end
    if data[key] == "" or data[key] == HWID then return true end
    return false
end

--------------------------------------------------
-- GUI
--------------------------------------------------
local ScreenGui = Instance.new("ScreenGui", gethui())

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0,650,0,360)
Frame.Position = UDim2.new(0.5,-325,0.5,-180)
Frame.BackgroundColor3 = Color3.fromRGB(24,24,24)
Frame.BorderSizePixel = 0
Instance.new("UICorner",Frame)

local Stroke = Instance.new("UIStroke", Frame)
Stroke.Color = Color3.fromRGB(70,70,70)
Stroke.Thickness = 2

-- TOP BAR
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

--------------------------------------------------
-- LEFT PANEL (INFO)
--------------------------------------------------
local LeftPanel = Instance.new("Frame", Frame)
LeftPanel.Size = UDim2.new(0.3,0,1,-40)
LeftPanel.Position = UDim2.new(0,0,0,40)
LeftPanel.BackgroundTransparency = 1

local ScriptInfo = Instance.new("TextLabel", LeftPanel)
ScriptInfo.Size = UDim2.new(1,-20,0,120)
ScriptInfo.Position = UDim2.new(0,10,0,10)
ScriptInfo.TextWrapped = true
ScriptInfo.BackgroundTransparency = 1
ScriptInfo.Font = Enum.Font.Gotham
ScriptInfo.TextSize = 13
ScriptInfo.TextColor3 = Color3.fromRGB(210,210,210)
ScriptInfo.Text =
"Quantum Script\n\n"..
"• Advanced automation\n"..
"• Optimized performance\n"..
"• Frequent updates\n\n"..
"This loader downloads the latest version automatically."

local VersionInfo = Instance.new("TextLabel", LeftPanel)
VersionInfo.Size = UDim2.new(1,-20,0,80)
VersionInfo.Position = UDim2.new(0,10,0,150)
VersionInfo.BackgroundTransparency = 1
VersionInfo.TextWrapped = true
VersionInfo.Font = Enum.Font.Gotham
VersionInfo.TextSize = 12
VersionInfo.TextColor3 = Color3.fromRGB(170,170,170)
VersionInfo.Text =
"Loader Information\n\n"..
"Version: 1.0\n"..
"Executor Support: Yes\n"..
"Auto Updates: Enabled"

--------------------------------------------------
-- CENTER PANEL (KEY INPUT)
--------------------------------------------------
local CenterPanel = Instance.new("Frame", Frame)
CenterPanel.Size = UDim2.new(0.4,0,1,-40)
CenterPanel.Position = UDim2.new(0.3,0,0,40)
CenterPanel.BackgroundTransparency = 1

local Info = Instance.new("TextLabel", CenterPanel)
Info.Size = UDim2.new(1,-20,0,40)
Info.Position = UDim2.new(0,10,0,20)
Info.Text = "Enter your key to execute the script"
Info.Font = Enum.Font.Gotham
Info.TextSize = 14
Info.TextColor3 = Color3.fromRGB(200,200,200)
Info.BackgroundTransparency = 1

local KeyBox = Instance.new("TextBox", CenterPanel)
KeyBox.Size = UDim2.new(1,-20,0,45)
KeyBox.Position = UDim2.new(0,10,0,80)
KeyBox.PlaceholderText = "Enter your key..."
KeyBox.Text = ""
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 16
KeyBox.TextColor3 = Color3.fromRGB(255,255,255)
KeyBox.BackgroundColor3 = Color3.fromRGB(35,35,35)
KeyBox.BorderSizePixel = 0
Instance.new("UICorner", KeyBox)

local Execute = Instance.new("TextButton", CenterPanel)
Execute.Size = UDim2.new(1,-20,0,45)
Execute.Position = UDim2.new(0,10,0,140)
Execute.Text = "EXECUTE SCRIPT"
Execute.Font = Enum.Font.GothamBold
Execute.TextSize = 16
Execute.TextColor3 = Color3.new(1,1,1)
Execute.BackgroundColor3 = Color3.fromRGB(46,204,113)
Execute.BorderSizePixel = 0
Instance.new("UICorner", Execute)

local Status = Instance.new("TextLabel", CenterPanel)
Status.Size = UDim2.new(1,-20,0,20)
Status.Position = UDim2.new(0,10,0,200)
Status.Text = "Status: Waiting for key"
Status.Font = Enum.Font.Gotham
Status.TextSize = 12
Status.TextColor3 = Color3.fromRGB(170,170,170)
Status.BackgroundTransparency = 1

--------------------------------------------------
-- RIGHT PANEL (SECURITY & SUPPORT)
--------------------------------------------------
local RightPanel = Instance.new("Frame", Frame)
RightPanel.Size = UDim2.new(0.3,0,1,-40)
RightPanel.Position = UDim2.new(0.7,0,0,40)
RightPanel.BackgroundTransparency = 1

local Security = Instance.new("TextLabel", RightPanel)
Security.Size = UDim2.new(1,-20,0,120)
Security.Position = UDim2.new(0,10,0,10)
Security.TextWrapped = true
Security.BackgroundTransparency = 1
Security.Font = Enum.Font.Gotham
Security.TextSize = 13
Security.TextColor3 = Color3.fromRGB(255,170,0)
Security.Text =
"Security Notice\n\n"..
"• Keys are HWID locked\n"..
"• Do NOT share your key\n"..
"• Sharing may result in blacklist\n\n"..
"Your key will bind to your device."

local ExtraInfo = Instance.new("TextLabel", RightPanel)
ExtraInfo.Size = UDim2.new(1,-20,0,120)
ExtraInfo.Position = UDim2.new(0,10,0,150)
ExtraInfo.BackgroundTransparency = 1
ExtraInfo.TextWrapped = true
ExtraInfo.Font = Enum.Font.Gotham
ExtraInfo.TextSize = 12
ExtraInfo.TextColor3 = Color3.fromRGB(170,170,170)
ExtraInfo.Text =
"Support\n\n"..
"If your key doesn't work:\n"..
"• Make sure it is valid\n"..
"• Do not use shared keys\n"..
"• Restart executor"

--------------------------------------------------
-- BUTTON EFFECTS
--------------------------------------------------
Execute.MouseEnter:Connect(function()
    TweenService:Create(Execute,TweenInfo.new(0.15),{BackgroundColor3 = Color3.fromRGB(60,220,130)}):Play()
end)
Execute.MouseLeave:Connect(function()
    TweenService:Create(Execute,TweenInfo.new(0.15),{BackgroundColor3 = Color3.fromRGB(46,204,113)}):Play()
end)

--------------------------------------------------
-- EXECUTE SCRIPT
--------------------------------------------------
Execute.MouseButton1Click:Connect(function()
    local key = KeyBox.Text
    Status.Text = "Checking key..."

    if not VerifyKey(key) then
        Status.Text = "Invalid key"
        KeyBox.Text = ""
        KeyBox.PlaceholderText = "Invalid key!"
        return
    end

    SendLog(key)

    Status.Text = "Key accepted. Launching..."
    task.wait(0.5)

    local ok, err = pcall(function()
        loadstring(game:HttpGet(MAIN_URL))()
    end)

    if not ok then
        warn("Failed to load main.lua", err)
        Status.Text = "Failed to load script"
    else
        Status.Text = "Script loaded"
        ScreenGui:Destroy()
    end
end)
