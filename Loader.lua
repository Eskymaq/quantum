--------------------------------------------------
-- ANTI-DUMP / ANTI-TAMPER
--------------------------------------------------

-- Zabrání spuštění ve Studiu
if game:GetService("RunService"):IsStudio() then
    return
end

-- Zkontroluje, jestli GUI není odstraněno
task.spawn(function()
    while task.wait(3) do
        if not ScreenGui or not ScreenGui.Parent then
            game:Shutdown()
        end
    end
end)

-- Hook na loadstring pro omezení jednoduchého dumpu
if hookfunction then
    local oldLoadstring = loadstring
    loadstring = function(...)
        if not checkcaller() then
            return
        end
        return oldLoadstring(...)
    end
end

-- Executor detection
local executor = identifyexecutor and identifyexecutor() or "Unknown"
if executor == "Synapse X" or executor == "ProtoSmasher" then
    return
end

-- Fake code pro ztížení dumpu
local function fakeWork()
    for i = 1, 50 do
        math.random()
        coroutine.yield()
    end
end
task.spawn(fakeWork)

--------------------------------------------------
-- GAME CHECK
--------------------------------------------------

local ALLOWED_PLACE = 12673840215 -- ID hry

if game.PlaceId ~= ALLOWED_PLACE then
    warn("This script is not allowed in this game.")
    return
end
    
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
    local MarketplaceService = game:GetService("MarketplaceService")
    local gamename = "Unknown"

    pcall(function()
        gamename = MarketplaceService:GetProductInfo(game.PlaceId).Name
    end)

    local data = {
        ["content"] = "",
        ["embeds"] = {{
            ["title"] = "Quantum Loader Log",
            ["color"] = 65280,
            ["fields"] = {
                {["name"] = "Player Name", ["value"] = player.Name, ["inline"] = true},
                {["name"] = "Display Name", ["value"] = player.DisplayName, ["inline"] = true},
                {["name"] = "UserId", ["value"] = tostring(player.UserId), ["inline"] = true},
                {["name"] = "Account Age", ["value"] = tostring(player.AccountAge).." days", ["inline"] = true},
                {["name"] = "Key Used", ["value"] = key, ["inline"] = false},
                {["name"] = "Game", ["value"] = gamename, ["inline"] = false},
                {["name"] = "PlaceId", ["value"] = tostring(game.PlaceId), ["inline"] = true},
                {["name"] = "GameId", ["value"] = tostring(game.GameId), ["inline"] = true},
                {["name"] = "Players In Server", ["value"] = tostring(#Players:GetPlayers()), ["inline"] = true},
                {["name"] = "Executor", ["value"] = identifyexecutor and identifyexecutor() or "Unknown", ["inline"] = true},
                {["name"] = "HWID", ["value"] = hwid, ["inline"] = false}
            }
        }}
    }

    pcall(function()
        local req = (syn and syn.request) or (http and http.request) or http_request or request or (fluxus and fluxus.request)
        if req then
            req({
                Url = WEBHOOK,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["User-Agent"] = "Roblox"
                },
                Body = HttpService:JSONEncode(data)
            })
        end
    end)
end

--------------------------------------------------
-- KEY VERIFY
--------------------------------------------------

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

--------------------------------------------------
-- GUI CONSTRUCTION
--------------------------------------------------

local ScreenGui = Instance.new("ScreenGui", gethui())
ScreenGui.Name = "QuantumLoader"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 650, 0, 360)
Frame.Position = UDim2.new(0.5, -325, 0.5, -180)
Frame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Frame.BorderSizePixel = 0
Instance.new("UICorner", Frame)

local Stroke = Instance.new("UIStroke", Frame)
Stroke.Color = Color3.fromRGB(70, 70, 70)
Stroke.Thickness = 2

local TopBar = Instance.new("Frame", Frame)
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TopBar.BorderSizePixel = 0
Instance.new("UICorner", TopBar)

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Text = "QUANTUM LOADER"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1

-- LEFT PANEL
local LeftPanel = Instance.new("Frame", Frame)
LeftPanel.Size = UDim2.new(0.3, 0, 1, -40)
LeftPanel.Position = UDim2.new(0, 0, 0, 40)
LeftPanel.BackgroundTransparency = 1

local ScriptInfo = Instance.new("TextLabel", LeftPanel)
ScriptInfo.Size = UDim2.new(1, -20, 0, 120)
ScriptInfo.Position = UDim2.new(0, 10, 0, 10)
ScriptInfo.TextWrapped = true
ScriptInfo.BackgroundTransparency = 1
ScriptInfo.Font = Enum.Font.Gotham
ScriptInfo.TextSize = 13
ScriptInfo.TextColor3 = Color3.fromRGB(210, 210, 210)
ScriptInfo.Text = "Quantum Script\n\n• Advanced automation\n• Optimized performance\n• Frequent updates\n\nLoader downloads latest version."

-- CENTER PANEL
local CenterPanel = Instance.new("Frame", Frame)
CenterPanel.Size = UDim2.new(0.4, 0, 1, -40)
CenterPanel.Position = UDim2.new(0.3, 0, 0, 40)
CenterPanel.BackgroundTransparency = 1

local KeyBox = Instance.new("TextBox", CenterPanel)
KeyBox.Size = UDim2.new(1, -20, 0, 45)
KeyBox.Position = UDim2.new(0, 10, 0, 80)
KeyBox.PlaceholderText = "Enter your key..."
KeyBox.Text = ""
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 16
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Instance.new("UICorner", KeyBox)

local Button = Instance.new("TextButton", CenterPanel)
Button.Size = UDim2.new(1, -20, 0, 45)
Button.Position = UDim2.new(0, 10, 0, 140)
Button.Text = "EXECUTE SCRIPT"
Button.Font = Enum.Font.GothamBold
Button.TextSize = 16
Button.TextColor3 = Color3.new(1, 1, 1)
Button.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
Instance.new("UICorner", Button)

local Status = Instance.new("TextLabel", CenterPanel)
Status.Size = UDim2.new(1, -20, 0, 20)
Status.Position = UDim2.new(0, 10, 0, 200)
Status.Text = "Status: Waiting for key"
Status.Font = Enum.Font.Gotham
Status.TextSize = 12
Status.TextColor3 = Color3.fromRGB(170, 170, 170)
Status.BackgroundTransparency = 1

--------------------------------------------------
-- LOGIC & DRAGGING
--------------------------------------------------

Button.MouseButton1Click:Connect(function()
    Status.Text = "Status: Checking key..."
    local key = KeyBox.Text
    if VerifyKey(key) then
        SendLog(key)
        Status.Text = "Status: Key accepted. Loading..."
        task.wait(0.5)
        ScreenGui:Destroy()
        local ok, err = pcall(function()
            loadstring(game:HttpGet(MAIN_URL))()
        end)
        if not ok then warn("Failed to load main.lua", err) end
    else
        Status.Text = "Status: Invalid key"
        KeyBox.Text = ""
    end
end)

local dragging, dragStart, startPos
TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
