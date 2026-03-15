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

    -- HWID lock check
    if data[key] == "" or data[key] == HWID then
        return true
    end

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

local Title = Instance.new("TextLabel",Frame)
Title.Size = UDim2.new(1,0,0,40)
Title.Text = "QUANTUM LOADER"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.new(1,1,1)
Title.BackgroundColor3 = Color3.fromRGB(30,30,30)

local KeyBox = Instance.new("TextBox",Frame)
KeyBox.Size = UDim2.new(0.8,0,0,45)
KeyBox.Position = UDim2.new(0.1,0,0.4,0)
KeyBox.PlaceholderText = "Enter key..."
KeyBox.Text = ""
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 16
KeyBox.TextColor3 = Color3.new(1,1,1)
KeyBox.BackgroundColor3 = Color3.fromRGB(35,35,35)
Instance.new("UICorner",KeyBox)

local Execute = Instance.new("TextButton",Frame)
Execute.Size = UDim2.new(0.8,0,0,45)
Execute.Position = UDim2.new(0.1,0,0.6,0)
Execute.Text = "EXECUTE"
Execute.Font = Enum.Font.GothamBold
Execute.TextSize = 16
Execute.TextColor3 = Color3.new(1,1,1)
Execute.BackgroundColor3 = Color3.fromRGB(46,204,113)
Instance.new("UICorner",Execute)

local Status = Instance.new("TextLabel",Frame)
Status.Size = UDim2.new(1,0,0,20)
Status.Position = UDim2.new(0,0,0.9,0)
Status.Text = "Status: Waiting for key"
Status.TextColor3 = Color3.fromRGB(170,170,170)
Status.Font = Enum.Font.Gotham
Status.TextSize = 12
Status.BackgroundTransparency = 1

--------------------------------------------------
-- RIGHT PANEL INFO
--------------------------------------------------
local InfoFrame = Instance.new("Frame",Frame)
InfoFrame.Size = UDim2.new(1,0,0.3,0)
InfoFrame.Position = UDim2.new(0,0,0,0)
InfoFrame.BackgroundTransparency = 1

local InfoText = Instance.new("TextLabel",InfoFrame)
InfoText.Size = UDim2.new(1,-20,1,-20)
InfoText.Position = UDim2.new(0,10,0,10)
InfoText.TextWrapped = true
InfoText.BackgroundTransparency = 1
InfoText.Font = Enum.Font.Gotham
InfoText.TextSize = 13
InfoText.TextColor3 = Color3.fromRGB(210,210,210)
InfoText.Text = [[
Quantum Loader
• HWID locked keys
• Logs are sent via Discord webhook
• Do not share your key
• Compatible with most executors
]]

--------------------------------------------------
-- EXECUTE
--------------------------------------------------
Execute.MouseButton1Click:Connect(function()
    local key = KeyBox.Text
    Status.Text = "Status: Checking key..."

    if not VerifyKey(key) then
        Status.Text = "Status: Invalid key"
        return
    end

    SendLog(key)

    Status.Text = "Status: Key accepted. Launching..."
    task.wait(0.5)

    local ok, err = pcall(function()
        loadstring(game:HttpGet(MAIN_URL))()
    end)

    if not ok then
        warn("Failed to load main.lua", err)
        Status.Text = "Status: Failed to load script"
    else
        Status.Text = "Status: Script loaded"
        ScreenGui:Destroy()
    end
end)
